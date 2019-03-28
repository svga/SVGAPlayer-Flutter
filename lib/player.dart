import 'dart:typed_data';
import 'dart:ui' as ui show Image;
import 'package:flutter/widgets.dart';
import 'proto/svga.pbserver.dart';

class SVGAPlayer extends StatefulWidget {
  SVGAPlayerController _controller;
  BoxFit fit = BoxFit.contain;

  SVGAPlayer(this._controller, {this.fit = BoxFit.contain});

  @override
  State<StatefulWidget> createState() {
    final state = _SVGAPlayerState();
    this._controller._state = state;
    return state;
  }
}

class SVGAPlayerController {
  _SVGAPlayerState _state;

  MovieEntity _videoItem;

  Map<String, ui.Image> bitmapCache;

  set videoItem(MovieEntity value) {
    this._videoItem = value;
  }

  MovieEntity get videoItem => this._videoItem;

  Future<void> _resetCache() async {
    this.bitmapCache = {};
    if (this.videoItem != null) {
      for (var item in this.videoItem.images.entries) {
        this.bitmapCache[item.key] = await decodeImageFromList(item.value);
      }
    }
  }

  Future<void> prepare() async {
    await this._resetCache();
  }

  void startAnimation() async {
    await this.prepare();
    this._state.createAnimation();
  }
}

class _SVGAPlayerState extends State<SVGAPlayer>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
  }

  void createAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 4000))
          ..addListener(() {
            this.setState(() {});
          });
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: new _Painter(
        this.widget._controller.videoItem,
        this._animationController?.value ?? 0.0,
        this.widget._controller,
        this.widget.fit,
      ),
      size: Size.square(300),
    );
  }
}

class _Painter extends CustomPainter {
  final MovieEntity videoItem;
  int currentFrame = 0;
  final SVGAPlayerController controller;
  final BoxFit fit;

  _Painter(this.videoItem, double animationProcess, this.controller, this.fit) {
    if (this.videoItem == null) return;
    this.currentFrame =
        (this.videoItem.params.frames.toDouble() * animationProcess).toInt();
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (this.videoItem == null) return;
    canvas.save();
    this.scaleToFit(canvas, size);
    this.drawBitmap(canvas, size);
    canvas.restore();
  }

  void scaleToFit(Canvas canvas, Size size) {
    final double imageWidth =
        this.controller.videoItem.params.viewBoxWidth.toDouble();
    final double imageHeight =
        this.controller.videoItem.params.viewBoxHeight.toDouble();
    if (imageWidth == 0.0 ||
        imageHeight == 0.0 ||
        size.width == 0.0 ||
        size.height == 0.0) return;
    switch (this.fit) {
      case BoxFit.contain:
        if (imageWidth / imageHeight >= size.width / size.height) {
          canvas.translate(
            0.0,
            (size.height - (imageHeight * (size.width / imageWidth))) / 2.0,
          );
          canvas.scale(size.width / imageWidth, size.width / imageWidth);
        } else {
          canvas.translate(
            (size.width - (imageWidth * (size.height / imageHeight))) / 2.0,
            0.0,
          );
          canvas.scale(size.height / imageHeight, size.height / imageHeight);
        }
        break;
      case BoxFit.cover:
        if (imageWidth / imageHeight <= size.width / size.height) {
          canvas.translate(
            0.0,
            (size.height - (imageHeight * (size.width / imageWidth))) / 2.0,
          );
          canvas.scale(size.width / imageWidth, size.width / imageWidth);
        } else {
          canvas.translate(
            (size.width - (imageWidth * (size.height / imageHeight))) / 2.0,
            0.0,
          );
          canvas.scale(size.height / imageHeight, size.height / imageHeight);
        }
        break;
      case BoxFit.fill:
        canvas.scale(size.width / imageWidth, size.height / imageHeight);
        break;
      case BoxFit.fitWidth:
        canvas.translate(
          0.0,
          (size.height - (imageHeight * (size.width / imageWidth))) / 2.0,
        );
        canvas.scale(size.width / imageWidth, size.width / imageWidth);
        break;
      case BoxFit.fitHeight:
        canvas.translate(
          (size.width - (imageWidth * (size.height / imageHeight))) / 2.0,
          0.0,
        );
        canvas.scale(size.height / imageHeight, size.height / imageHeight);
        break;
      case BoxFit.none:
        canvas.translate(
          (size.width - imageWidth) / 2.0,
          (size.height - imageHeight) / 2.0,
        );
        break;
      case BoxFit.scaleDown:
        if (imageWidth > size.width || imageHeight > size.height) {
          if (imageWidth / imageHeight >= size.width / size.height) {
            canvas.translate(
              0.0,
              (size.height - (imageHeight * (size.width / imageWidth))) / 2.0,
            );
            canvas.scale(size.width / imageWidth, size.width / imageWidth);
          } else {
            canvas.translate(
              (size.width - (imageWidth * (size.height / imageHeight))) / 2.0,
              0.0,
            );
            canvas.scale(size.height / imageHeight, size.height / imageHeight);
          }
        }
        break;
      default:
    }
  }

  void drawBitmap(Canvas canvas, Size size) {
    this.videoItem.sprites.forEach((sprite) {
      if (sprite.imageKey == null) return;
      final frameItem = sprite.frames[this.currentFrame];
      final bitmap = this.controller.bitmapCache[sprite.imageKey];
      if (bitmap == null) return;
      canvas.save();
      canvas.transform(Float64List.fromList([
        frameItem.transform.a,
        frameItem.transform.b,
        0.0,
        0.0,
        frameItem.transform.c,
        frameItem.transform.d,
        0.0,
        0.0,
        0.0,
        0.0,
        1.0,
        0.0,
        frameItem.transform.tx,
        frameItem.transform.ty,
        0.0,
        1.0
      ].toList()));
      final bitmapPaint = Paint();
      bitmapPaint.color =
          Color.fromARGB((frameItem.alpha * 255.0).toInt(), 255, 255, 255);
      canvas.drawImage(bitmap, Offset.zero, bitmapPaint);
      canvas.restore();
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    if (oldDelegate is _Painter) {
      return !(oldDelegate.videoItem == this.videoItem &&
          oldDelegate.currentFrame == this.currentFrame);
    }
    return true;
  }
}
