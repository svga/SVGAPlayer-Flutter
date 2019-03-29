library svgaplayer_flutter_player;

import 'dart:ui' as ui show Image;
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'proto/svga.pbserver.dart';
import 'dart:typed_data';
import 'package:path_drawing/path_drawing.dart';
import 'parser.dart';
part 'painter.dart';

class SVGAImageView extends StatefulWidget {
  final SVGAAnimationController _controller;
  final BoxFit fit;
  final bool clearsAfterStop;

  // static SVGAImageView withUrl(
  //   String url, {
  //   SVGAAnimationController controller,
  //   fit = BoxFit.contain,
  //   bool clearsAfterStop,
  // }) {
  //   SVGAParser.shared.decodeFromURL(url).then((videoItem) {
  //     controller.videoItem = videoItem;
  //     loops ? controller.repeat() : controller.forward();
  //   });
  //   return SVGAImageView(controller, fit: fit);
  // }

  SVGAImageView(
    this._controller, {
    this.fit = BoxFit.contain,
    this.clearsAfterStop = true,
  });

  @override
  State<StatefulWidget> createState() {
    return _SVGAImageViewState(this._controller,
        clearsAfterStop: this.clearsAfterStop);
  }
}

class SVGAAnimationController extends AnimationController {
  MovieEntity _videoItem;
  bool _canvasNeedsClear = false;

  SVGAAnimationController({@required TickerProvider vsync})
      : super(vsync: vsync);

  set videoItem(MovieEntity value) {
    this.stop();
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

class _SVGAImageViewState extends State<SVGAImageView> {
  final SVGAAnimationController _animationController;
  final bool clearsAfterStop;

  _SVGAImageViewState(this._animationController, {this.clearsAfterStop}) {
    this._animationController.addListener(() {
      this.setState(() {});
    });
    this._animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed && this.clearsAfterStop) {
        this._animationController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this._animationController.videoItem == null) {
      return Container();
    }
    return CustomPaint(
      painter: new SVGAPainter(
        this._animationController.videoItem,
        SVGAPainter.calculateCurrentFrame(this._animationController.videoItem,
            this._animationController.value),
        this._animationController,
        this.widget.fit,
      ),
      size: Size(
        this.widget._controller.videoItem.params.viewBoxWidth,
        this.widget._controller.videoItem.params.viewBoxHeight,
      ),
    );
  }
}
