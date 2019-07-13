library svgaplayer_flutter_player;

import 'dart:ui' as ui show Image;
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:svgaplayer_flutter/proto/svga.pb.dart';
import 'proto/svga.pbserver.dart';
import 'dart:typed_data';
import 'package:path_drawing/path_drawing.dart';
import 'parser.dart';
part 'painter.dart';
part 'simple_player.dart';

class SVGAImage extends StatefulWidget {
  final SVGAAnimationController _controller;
  final BoxFit fit;
  final bool clearsAfterStop;

  SVGAImage(
    this._controller, {
    this.fit = BoxFit.contain,
    this.clearsAfterStop = true,
  });

  @override
  State<StatefulWidget> createState() {
    return _SVGAImageState(this._controller,
        clearsAfterStop: this.clearsAfterStop);
  }
}

class SVGAAnimationController extends AnimationController {
  MovieEntity _videoItem;
  bool _canvasNeedsClear = false;

  SVGAAnimationController({@required TickerProvider vsync})
      : super(vsync: vsync);

  set videoItem(MovieEntity value) {
    if (this.isAnimating) {
      this.stop();
    }
    this.clear();
    this._videoItem = value;
    if (value != null) {
      this.duration = Duration(
          milliseconds: (this._videoItem.params.frames /
                  this._videoItem.params.fps *
                  1000)
              .toInt());
    } else {
      this.duration = Duration(milliseconds: 0);
    }
  }

  MovieEntity get videoItem => this._videoItem;

  void clear() {
    this._canvasNeedsClear = true;
    this.notifyListeners();
  }
}

class _SVGAImageState extends State<SVGAImage> {
  final SVGAAnimationController _animationController;
  final bool clearsAfterStop;

  _SVGAImageState(this._animationController, {this.clearsAfterStop}) {
    this._animationController.addListener(_setState);
    this._animationController.addStatusListener(_clearAnimation);
  }

  void _setState() {
    if (mounted) {
      this.setState(() {});
    }
  }
  void _clearAnimation(AnimationStatus status) {
    if (status == AnimationStatus.completed && this.clearsAfterStop) {
      this._animationController.clear();
    }
  }

  @override
  void dispose() {
    this._animationController.removeListener(_setState);
    this._animationController.removeStatusListener(_clearAnimation);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (this._animationController.videoItem == null) {
      return Container();
    }
    final needsClear = this._animationController._canvasNeedsClear;
    this._animationController._canvasNeedsClear = false;
    return CustomPaint(
      painter: new SVGAPainter(
        this._animationController.videoItem,
        SVGAPainter.calculateCurrentFrame(this._animationController.videoItem,
            this._animationController.value),
        fit: this.widget.fit,
        clear: needsClear,
      ),
      size: Size(
        this.widget._controller.videoItem.params.viewBoxWidth,
        this.widget._controller.videoItem.params.viewBoxHeight,
      ),
    );
  }
}
