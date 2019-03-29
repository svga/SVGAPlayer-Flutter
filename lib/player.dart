library svgaplayer_flutter_player;

import 'dart:ui' as ui show Image;
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'proto/svga.pbserver.dart';
import 'dart:typed_data';
import 'package:path_drawing/path_drawing.dart';
part 'painter.dart';

typedef FrameHandler = void Function(int currentFrame, double progress);
typedef CompleteHandler = void Function();

class SVGAPlayer extends StatefulWidget {
  final SVGAPlayerController _controller;
  final BoxFit fit;

  SVGAPlayer(
    this._controller, {
    this.fit = BoxFit.contain,
  });

  @override
  State<StatefulWidget> createState() {
    final state = _SVGAPlayerState();
    this._controller._state = state;
    return state;
  }
}

class SVGAPlayerController {
  bool clearsAfterStop = true;
  _SVGAPlayerState _state;
  MovieEntity _videoItem;
  bool _prepared = false;
  Map<String, ui.Image> _bitmapCache = {};
  Map<String, Path> _pathCache = {};

  set videoItem(MovieEntity value) {
    this.stopAnimation(clear: true);
    this._videoItem = value;
    this._prepared = false;
  }

  MovieEntity get videoItem => this._videoItem;

  Future<void> _resetCache() async {
    this._bitmapCache = {};
    this._pathCache = {};
    if (this.videoItem != null) {
      for (var item in this.videoItem.images.entries) {
        this._bitmapCache[item.key] = await decodeImageFromList(item.value);
      }
    }
  }

  Future<void> prepare() async {
    if (this._prepared) return;
    await this._resetCache();
    this._prepared = true;
  }

  Future<void> startAnimation({
    bool once,
    FrameHandler onFrame,
    CompleteHandler onComplete,
  }) async {
    if (this._state == null) return;
    await this.prepare();
    this._state.createAnimation(
          once != true,
          onFrame: onFrame,
          onComplete: onComplete,
        );
  }

  void pauseAnimation() {
    this.stopAnimation(clear: false);
  }

  void stopAnimation({bool clear}) {
    if (this._state == null) return;
    this._state.stopAnimation(clear);
  }
}

class _SVGAPlayerState extends State<SVGAPlayer>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  int currentFrame = -1;
  bool drawingEmpty = true;

  @override
  void initState() {
    super.initState();
  }

  void createAnimation(
    bool isRepeat, {
    FrameHandler onFrame,
    CompleteHandler onComplete,
  }) {
    if (this.widget._controller.videoItem == null) return;
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
            milliseconds: (this.widget._controller.videoItem.params.frames /
                    this.widget._controller.videoItem.params.fps *
                    1000)
                .toInt()))
      ..addListener(() {
        final nextFrame = SVGAPainter.calculateCurrentFrame(
            this.widget._controller.videoItem, _animationController.value);
        if (nextFrame == this.currentFrame) return;
        this.setState(() {
          currentFrame = nextFrame;
        });
        if (onFrame != null) {
          onFrame(currentFrame, _animationController.value);
        }
      });
    final future = isRepeat
        ? _animationController.repeat()
        : _animationController.forward();
    future.whenCompleteOrCancel(() {
      if (this.widget._controller.clearsAfterStop) {
        this.setState(() {
          drawingEmpty = true;
        });
      }
      if (onComplete != null) {
        onComplete();
      }
    });
    this.setState(() {
      drawingEmpty = false;
    });
  }

  void stopAnimation(bool clear) {
    _animationController?.stop();
    this.setState(() {
      currentFrame = -1;
      drawingEmpty = clear ?? this.widget._controller.clearsAfterStop;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this.widget._controller.videoItem == null ||
        this.drawingEmpty ||
        this.currentFrame < 0) {
      return Container();
    }
    return CustomPaint(
      painter: new SVGAPainter(
        this.widget._controller.videoItem,
        this.currentFrame,
        this.widget._controller,
        this.widget.fit,
      ),
      size: Size(
        this.widget._controller.videoItem.params.viewBoxWidth,
        this.widget._controller.videoItem.params.viewBoxHeight,
      ),
    );
  }
}
