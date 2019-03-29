import 'dart:typed_data';
import 'dart:ui' as ui show Image;
import 'package:flutter/widgets.dart';
import 'package:path_drawing/path_drawing.dart';
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
  bool _prepared = false;
  Map<String, ui.Image> bitmapCache = {};
  Map<String, Path> pathCache = {};

  set videoItem(MovieEntity value) {
    this._videoItem = value;
    this._prepared = false;
  }

  MovieEntity get videoItem => this._videoItem;

  Future<void> _resetCache() async {
    this.bitmapCache = {};
    this.pathCache = {};
    if (this.videoItem != null) {
      for (var item in this.videoItem.images.entries) {
        this.bitmapCache[item.key] = await decodeImageFromList(item.value);
      }
    }
  }

  Future<void> prepare() async {
    if (this._prepared) return;
    await this._resetCache();
    this._prepared = true;
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
    if (this.widget._controller.videoItem == null) return;
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
            milliseconds: (this.widget._controller.videoItem.params.frames /
                    this.widget._controller.videoItem.params.fps *
                    1000)
                .toInt()))
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
    this.drawShape(canvas, size);
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

  void drawShape(Canvas canvas, Size size) {
    this.videoItem.sprites.forEach((sprite) {
      final frameItem = sprite.frames[this.currentFrame];
      if (frameItem.shapes == null || frameItem.shapes.length == 0) return;
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
      frameItem.shapes.forEach((shape) {
        final path = this.buildPath(shape);
        if (shape.hasTransform()) {
          canvas.save();
          canvas.transform(Float64List.fromList([
            shape.transform.a,
            shape.transform.b,
            0.0,
            0.0,
            shape.transform.c,
            shape.transform.d,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0,
            0.0,
            shape.transform.tx,
            shape.transform.ty,
            0.0,
            1.0
          ].toList()));
        }
        final fill = shape.styles?.fill;
        if (fill != null) {
          final paint = Paint();
          paint.isAntiAlias = true;
          paint.style = PaintingStyle.fill;
          paint.color = Color.fromARGB(
            (fill.a * frameItem.alpha * 255).toInt(),
            (fill.r * 255).toInt(),
            (fill.g * 255).toInt(),
            (fill.b * 255).toInt(),
          );
          canvas.drawPath(path, paint);
        }
        final strokeWidth = shape.styles?.strokeWidth;
        if (strokeWidth != null && strokeWidth > 0) {
          final paint = Paint();
          paint.style = PaintingStyle.stroke;
          if (shape.styles.stroke != null) {
            paint.color = Color.fromARGB(
              (shape.styles.stroke.a * frameItem.alpha * 255).toInt(),
              (shape.styles.stroke.r * 255).toInt(),
              (shape.styles.stroke.g * 255).toInt(),
              (shape.styles.stroke.b * 255).toInt(),
            );
          }
          paint.strokeWidth = strokeWidth;
          final lineCap = shape.styles?.lineCap;
          if (lineCap != null) {
            switch (lineCap) {
              case ShapeEntity_ShapeStyle_LineCap.LineCap_BUTT:
                paint.strokeCap = StrokeCap.butt;
                break;
              case ShapeEntity_ShapeStyle_LineCap.LineCap_ROUND:
                paint.strokeCap = StrokeCap.round;
                break;
              case ShapeEntity_ShapeStyle_LineCap.LineCap_SQUARE:
                paint.strokeCap = StrokeCap.square;
                break;
              default:
            }
          }
          final lineJoin = shape.styles?.lineJoin;
          if (lineJoin != null) {
            switch (lineJoin) {
              case ShapeEntity_ShapeStyle_LineJoin.LineJoin_MITER:
                paint.strokeJoin = StrokeJoin.miter;
                break;
              case ShapeEntity_ShapeStyle_LineJoin.LineJoin_ROUND:
                paint.strokeJoin = StrokeJoin.round;
                break;
              case ShapeEntity_ShapeStyle_LineJoin.LineJoin_BEVEL:
                paint.strokeJoin = StrokeJoin.bevel;
                break;
              default:
            }
          }
          paint.strokeMiterLimit = shape.styles?.miterLimit ?? 0.0;
          List<double> lineDash = [
            shape.styles?.lineDashI ?? 0.0,
            shape.styles?.lineDashII ?? 0.0,
            shape.styles?.lineDashIII ?? 0.0
          ];
          if (lineDash[0] > 0 || lineDash[1] > 0) {
            canvas.drawPath(
                dashPath(
                  path,
                  dashArray: CircularIntervalList([
                    lineDash[0] < 1.0 ? 1.0 : lineDash[0],
                    lineDash[1] < 0.1 ? 0.1 : lineDash[1],
                  ]),
                  dashOffset: DashOffset.absolute(lineDash[2]),
                ),
                paint);
          } else {
            canvas.drawPath(path, paint);
          }
          if (shape.hasTransform()) {
            canvas.restore();
          }
        }
      });
      canvas.restore();
    });
  }

  static const _validMethods = 'MLHVCSQRZmlhvcsqrz';

  Path buildPath(ShapeEntity shape) {
    final path = Path();
    if (shape.type == ShapeEntity_ShapeType.SHAPE) {
      final args = shape.shape;
      final argD = args.d ?? "";
      if (this.controller.pathCache[argD] != null) {
        return this.controller.pathCache[argD];
      }
      final d = argD.replaceAllMapped(RegExp('([a-zA-Z])'), (match) {
        return "|||${match.group(1)} ";
      }).replaceAll(RegExp(","), " ");
      var currentPointX = 0.0;
      var currentPointY = 0.0;
      double currentPointX1;
      double currentPointY1;
      double currentPointX2;
      double currentPointY2;
      d.split("|||").forEach((segment) {
        if (segment.length == 0) {
          return;
        }
        final firstLetter = segment.substring(0, 1);
        if (_validMethods.indexOf(firstLetter) >= 0) {
          final args = segment.substring(1).trim().split(" ");
          if (firstLetter == "M") {
            currentPointX = double.parse(args[0]);
            currentPointY = double.parse(args[1]);
            path.moveTo(currentPointX, currentPointY);
          } else if (firstLetter == "m") {
            currentPointX += double.parse(args[0]);
            currentPointY += double.parse(args[1]);
            path.moveTo(currentPointX, currentPointY);
          } else if (firstLetter == "L") {
            currentPointX = double.parse(args[0]);
            currentPointY = double.parse(args[1]);
            path.lineTo(currentPointX, currentPointY);
          } else if (firstLetter == "l") {
            currentPointX += double.parse(args[0]);
            currentPointY += double.parse(args[1]);
            path.lineTo(currentPointX, currentPointY);
          } else if (firstLetter == "H") {
            currentPointX = double.parse(args[0]);
            path.lineTo(currentPointX, currentPointY);
          } else if (firstLetter == "h") {
            currentPointX += double.parse(args[0]);
            path.lineTo(currentPointX, currentPointY);
          } else if (firstLetter == "V") {
            currentPointY = double.parse(args[0]);
            path.lineTo(currentPointX, currentPointY);
          } else if (firstLetter == "v") {
            currentPointY += double.parse(args[0]);
            path.lineTo(currentPointX, currentPointY);
          } else if (firstLetter == "C") {
            currentPointX1 = double.parse(args[0]);
            currentPointY1 = double.parse(args[1]);
            currentPointX2 = double.parse(args[2]);
            currentPointY2 = double.parse(args[3]);
            currentPointX = double.parse(args[4]);
            currentPointY = double.parse(args[5]);
            path.cubicTo(currentPointX1, currentPointY1, currentPointX2,
                currentPointY2, currentPointX, currentPointY);
          } else if (firstLetter == "c") {
            currentPointX1 = currentPointX + double.parse(args[0]);
            currentPointY1 = currentPointY + double.parse(args[1]);
            currentPointX2 = currentPointX + double.parse(args[2]);
            currentPointY2 = currentPointY + double.parse(args[3]);
            currentPointX += double.parse(args[4]);
            currentPointY += double.parse(args[5]);
            path.cubicTo(currentPointX1, currentPointY1, currentPointX2,
                currentPointY2, currentPointX, currentPointY);
          } else if (firstLetter == "S") {
            if (currentPointX1 != null &&
                currentPointY1 != null &&
                currentPointX2 != null &&
                currentPointY2 != null) {
              currentPointX1 = currentPointX - currentPointX2 + currentPointX;
              currentPointY1 = currentPointY - currentPointY2 + currentPointY;
              currentPointX2 = double.parse(args[0]);
              currentPointY2 = double.parse(args[1]);
              currentPointX = double.parse(args[2]);
              currentPointY = double.parse(args[3]);
              path.cubicTo(currentPointX1, currentPointY1, currentPointX2,
                  currentPointY2, currentPointX, currentPointY);
            } else {
              currentPointX1 = double.parse(args[0]);
              currentPointY1 = double.parse(args[1]);
              currentPointX = double.parse(args[2]);
              currentPointY = double.parse(args[3]);
              path.quadraticBezierTo(
                  currentPointX1, currentPointY1, currentPointX, currentPointY);
            }
          } else if (firstLetter == "s") {
            if (currentPointX1 != null &&
                currentPointY1 != null &&
                currentPointX2 != null &&
                currentPointY2 != null) {
              currentPointX1 = currentPointX - currentPointX2 + currentPointX;
              currentPointY1 = currentPointY - currentPointY2 + currentPointY;
              currentPointX2 = currentPointX + double.parse(args[0]);
              currentPointY2 = currentPointY + double.parse(args[1]);
              currentPointX += double.parse(args[2]);
              currentPointY += double.parse(args[3]);
              path.cubicTo(currentPointX1, currentPointY1, currentPointX2,
                  currentPointY2, currentPointX, currentPointY);
            } else {
              currentPointX1 = currentPointX + double.parse(args[0]);
              currentPointY1 = currentPointY + double.parse(args[1]);
              currentPointX += double.parse(args[2]);
              currentPointY += double.parse(args[3]);
              path.quadraticBezierTo(
                  currentPointX1, currentPointY1, currentPointX, currentPointY);
            }
          } else if (firstLetter == "Q") {
            currentPointX1 = double.parse(args[0]);
            currentPointY1 = double.parse(args[1]);
            currentPointX = double.parse(args[2]);
            currentPointY = double.parse(args[3]);
            path.quadraticBezierTo(
                currentPointX1, currentPointY1, currentPointX, currentPointY);
          } else if (firstLetter == "q") {
            currentPointX1 = currentPointX + double.parse(args[0]);
            currentPointY1 = currentPointY + double.parse(args[1]);
            currentPointX += double.parse(args[2]);
            currentPointY += double.parse(args[3]);
            path.quadraticBezierTo(
                currentPointX1, currentPointY1, currentPointX, currentPointY);
          } else if (firstLetter == "Z" || firstLetter == "z") {
            path.close();
          }
        }
        this.controller.pathCache[argD] = path;
      });
    } else if (shape.type == ShapeEntity_ShapeType.ELLIPSE) {
      final args = shape.ellipse;
      final xv = args.x ?? 0.0;
      final yv = args.y ?? 0.0;
      final rxv = args.radiusX ?? 0.0;
      final ryv = args.radiusY ?? 0.0;
      path.addOval(Rect.fromLTWH(xv - rxv, yv - ryv, rxv * 2, ryv * 2));
    } else if (shape.type == ShapeEntity_ShapeType.RECT) {
      final args = shape.rect;
      final xv = args.x ?? 0.0;
      final yv = args.y ?? 0.0;
      final wv = args.width ?? 0.0;
      final hv = args.height ?? 0.0;
      final crv = args.cornerRadius ?? 0.0;
      path.addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(xv, yv, wv, hv), Radius.circular(crv)));
    }
    return path;
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
