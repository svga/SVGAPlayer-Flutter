part of svgaplayer_flutter_player;

class _SVGAPainter extends CustomPainter {
  final BoxFit fit;
  final SVGAAnimationController controller;
  int get currentFrame => controller.currentFrame;
  MovieEntity get videoItem => controller.videoItem!;
  final FilterQuality filterQuality;

  /// Guaranteed to draw within the canvas bounds
  final bool clipRect;
  _SVGAPainter(
    this.controller, {
    this.fit = BoxFit.contain,
    this.filterQuality = FilterQuality.low,
    this.clipRect = true,
  })  : assert(
            controller.videoItem != null, 'Invalid SVGAAnimationController!'),
        super(repaint: controller);

  @override
  void paint(Canvas canvas, Size size) {
    if (controller._canvasNeedsClear) {
      // mark cleared
      controller._canvasNeedsClear = false;
      return;
    }
    if (size.isEmpty || controller.videoItem == null) return;
    final params = videoItem.params;
    final Size viewBoxSize = Size(params.viewBoxWidth, params.viewBoxHeight);
    if (viewBoxSize.isEmpty) return;
    canvas.save();
    try {
      final canvasRect = Offset.zero & size;
      if (clipRect) canvas.clipRect(canvasRect);
      scaleCanvasToViewBox(canvas, canvasRect, Offset.zero & viewBoxSize);
      drawSprites(canvas, size);
    } finally {
      canvas.restore();
    }
  }

  void scaleCanvasToViewBox(Canvas canvas, Rect canvasRect, Rect viewBoxRect) {
    final fittedSizes = applyBoxFit(fit, viewBoxRect.size, canvasRect.size);

    // scale viewbox size (source) to canvas size (destination)
    var sx = fittedSizes.destination.width / fittedSizes.source.width;
    var sy = fittedSizes.destination.height / fittedSizes.source.height;
    final Size scaledHalfViewBoxSize =
        Size(viewBoxRect.size.width * sx, viewBoxRect.size.height * sy) / 2.0;
    final Size halfCanvasSize = canvasRect.size / 2.0;
    // center align
    final Offset shift = Offset(
      halfCanvasSize.width - scaledHalfViewBoxSize.width,
      halfCanvasSize.height - scaledHalfViewBoxSize.height,
    );
    if (shift != Offset.zero) canvas.translate(shift.dx, shift.dy);
    if (sx != 1.0 && sy != 1.0) canvas.scale(sx, sy);
  }

  void drawSprites(Canvas canvas, Size size) {
    for (final sprite in videoItem.sprites) {
      final imageKey = sprite.imageKey;
      // var matteKey = sprite.matteKey;
      if (imageKey.isEmpty ||
          videoItem.dynamicItem.dynamicHidden[imageKey] == true) {
        continue;
      }
      final frameItem = sprite.frames[currentFrame];
      final needTransform = frameItem.hasTransform();
      final needClip = frameItem.hasClipPath();
      if (needTransform) {
        canvas.save();
        canvas.transform(Float64List.fromList(<double>[
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
        ]));
      }
      if (needClip) {
        canvas.save();
        canvas.clipPath(buildDPath(frameItem.clipPath));
      }
      final frameRect =
          Rect.fromLTRB(0, 0, frameItem.layout.width, frameItem.layout.height);
      final frameAlpha =
          frameItem.hasAlpha() ? (frameItem.alpha * 255).toInt() : 255;
      drawBitmap(canvas, imageKey, frameRect, frameAlpha);
      drawShape(canvas, frameItem.shapes, frameAlpha);
      // draw dynamic
      final dynamicDrawer = videoItem.dynamicItem.dynamicDrawer[imageKey];
      if (dynamicDrawer != null) {
        dynamicDrawer(canvas, currentFrame);
      }
      if (needClip) {
        canvas.restore();
      }
      if (needTransform) {
        canvas.restore();
      }
    }
  }

  void drawBitmap(Canvas canvas, String imageKey, Rect frameRect, int alpha) {
    final bitmap = videoItem.dynamicItem.dynamicImages[imageKey] ??
        videoItem.bitmapCache[imageKey];
    if (bitmap == null) return;

    final bitmapPaint = Paint();
    bitmapPaint.filterQuality = filterQuality;
    //解决bitmap锯齿问题
    bitmapPaint.isAntiAlias = true;
    bitmapPaint.color = Color.fromARGB(alpha, 0, 0, 0);

    Rect srcRect =
        Rect.fromLTRB(0, 0, bitmap.width.toDouble(), bitmap.height.toDouble());
    Rect dstRect = frameRect;
    canvas.drawImageRect(bitmap, srcRect, dstRect, bitmapPaint);
    drawTextOnBitmap(canvas, imageKey, frameRect, alpha);
  }

  void drawShape(Canvas canvas, List<ShapeEntity> shapes, int frameAlpha) {
    if (shapes.isEmpty) return;
    for (var shape in shapes) {
      final path = buildPath(shape);
      if (shape.hasTransform()) {
        canvas.save();
        canvas.transform(Float64List.fromList(<double>[
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
        ]));
      }

      final fill = shape.styles.fill;
      if (fill.isInitialized()) {
        final paint = Paint();
        paint.isAntiAlias = true;
        paint.style = PaintingStyle.fill;
        paint.color = Color.fromARGB(
          (fill.a * frameAlpha).toInt(),
          (fill.r * 255).toInt(),
          (fill.g * 255).toInt(),
          (fill.b * 255).toInt(),
        );
        canvas.drawPath(path, paint);
      }
      final strokeWidth = shape.styles.strokeWidth;
      if (strokeWidth > 0) {
        final paint = Paint();
        paint.style = PaintingStyle.stroke;
        if (shape.styles.stroke.isInitialized()) {
          paint.color = Color.fromARGB(
            (shape.styles.stroke.a * frameAlpha).toInt(),
            (shape.styles.stroke.r * 255).toInt(),
            (shape.styles.stroke.g * 255).toInt(),
            (shape.styles.stroke.b * 255).toInt(),
          );
        }
        paint.strokeWidth = strokeWidth;
        final lineCap = shape.styles.lineCap;
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
        final lineJoin = shape.styles.lineJoin;
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
        paint.strokeMiterLimit = shape.styles.miterLimit;
        List<double> lineDash = [
          shape.styles.lineDashI,
          shape.styles.lineDashII,
          shape.styles.lineDashIII
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
      }
      if (shape.hasTransform()) {
        canvas.restore();
      }
    }
  }

  static const _validMethods = 'MLHVCSQRZmlhvcsqrz';

  Path buildPath(ShapeEntity shape) {
    final path = Path();
    if (shape.type == ShapeEntity_ShapeType.SHAPE) {
      final args = shape.shape;
      final argD = args.d;
      return buildDPath(argD, path: path);
    } else if (shape.type == ShapeEntity_ShapeType.ELLIPSE) {
      final args = shape.ellipse;
      final xv = args.x;
      final yv = args.y;
      final rxv = args.radiusX;
      final ryv = args.radiusY;
      final rect = Rect.fromLTWH(xv - rxv, yv - ryv, rxv * 2, ryv * 2);
      if (!rect.isEmpty) path.addOval(rect);
    } else if (shape.type == ShapeEntity_ShapeType.RECT) {
      final args = shape.rect;
      final xv = args.x;
      final yv = args.y;
      final wv = args.width;
      final hv = args.height;
      final crv = args.cornerRadius;
      final rrect = RRect.fromRectAndRadius(
          Rect.fromLTWH(xv, yv, wv, hv), Radius.circular(crv));
      if (!rrect.isEmpty) path.addRRect(rrect);
    }
    return path;
  }

  Path buildDPath(String argD, {Path? path}) {
    if (videoItem.pathCache[argD] != null) {
      return videoItem.pathCache[argD]!;
    }
    path ??= Path();
    final d = argD.replaceAllMapped(RegExp('([a-df-zA-Z])'), (match) {
      return "|||${match.group(1)} ";
    }).replaceAll(RegExp(","), " ");
    var currentPointX = 0.0;
    var currentPointY = 0.0;
    double? currentPointX1;
    double? currentPointY1;
    double? currentPointX2;
    double? currentPointY2;
    d.split("|||").forEach((segment) {
      if (segment.isEmpty) {
        return;
      }
      final firstLetter = segment.substring(0, 1);
      if (_validMethods.contains(firstLetter)) {
        final args = segment.substring(1).trim().split(" ");
        if (firstLetter == "M") {
          currentPointX = double.parse(args[0]);
          currentPointY = double.parse(args[1]);
          path!.moveTo(currentPointX, currentPointY);
        } else if (firstLetter == "m") {
          currentPointX += double.parse(args[0]);
          currentPointY += double.parse(args[1]);
          path!.moveTo(currentPointX, currentPointY);
        } else if (firstLetter == "L") {
          currentPointX = double.parse(args[0]);
          currentPointY = double.parse(args[1]);
          path!.lineTo(currentPointX, currentPointY);
        } else if (firstLetter == "l") {
          currentPointX += double.parse(args[0]);
          currentPointY += double.parse(args[1]);
          path!.lineTo(currentPointX, currentPointY);
        } else if (firstLetter == "H") {
          currentPointX = double.parse(args[0]);
          path!.lineTo(currentPointX, currentPointY);
        } else if (firstLetter == "h") {
          currentPointX += double.parse(args[0]);
          path!.lineTo(currentPointX, currentPointY);
        } else if (firstLetter == "V") {
          currentPointY = double.parse(args[0]);
          path!.lineTo(currentPointX, currentPointY);
        } else if (firstLetter == "v") {
          currentPointY += double.parse(args[0]);
          path!.lineTo(currentPointX, currentPointY);
        } else if (firstLetter == "C") {
          currentPointX1 = double.parse(args[0]);
          currentPointY1 = double.parse(args[1]);
          currentPointX2 = double.parse(args[2]);
          currentPointY2 = double.parse(args[3]);
          currentPointX = double.parse(args[4]);
          currentPointY = double.parse(args[5]);
          path!.cubicTo(
            currentPointX1!,
            currentPointY1!,
            currentPointX2!,
            currentPointY2!,
            currentPointX,
            currentPointY,
          );
        } else if (firstLetter == "c") {
          currentPointX1 = currentPointX + double.parse(args[0]);
          currentPointY1 = currentPointY + double.parse(args[1]);
          currentPointX2 = currentPointX + double.parse(args[2]);
          currentPointY2 = currentPointY + double.parse(args[3]);
          currentPointX += double.parse(args[4]);
          currentPointY += double.parse(args[5]);
          path!.cubicTo(
            currentPointX1!,
            currentPointY1!,
            currentPointX2!,
            currentPointY2!,
            currentPointX,
            currentPointY,
          );
        } else if (firstLetter == "S") {
          if (currentPointX1 != null &&
              currentPointY1 != null &&
              currentPointX2 != null &&
              currentPointY2 != null) {
            currentPointX1 = currentPointX - currentPointX2! + currentPointX;
            currentPointY1 = currentPointY - currentPointY2! + currentPointY;
            currentPointX2 = double.parse(args[0]);
            currentPointY2 = double.parse(args[1]);
            currentPointX = double.parse(args[2]);
            currentPointY = double.parse(args[3]);
            path!.cubicTo(
              currentPointX1!,
              currentPointY1!,
              currentPointX2!,
              currentPointY2!,
              currentPointX,
              currentPointY,
            );
          } else {
            currentPointX1 = double.parse(args[0]);
            currentPointY1 = double.parse(args[1]);
            currentPointX = double.parse(args[2]);
            currentPointY = double.parse(args[3]);
            path!.quadraticBezierTo(
                currentPointX1!, currentPointY1!, currentPointX, currentPointY);
          }
        } else if (firstLetter == "s") {
          if (currentPointX1 != null &&
              currentPointY1 != null &&
              currentPointX2 != null &&
              currentPointY2 != null) {
            currentPointX1 = currentPointX - currentPointX2! + currentPointX;
            currentPointY1 = currentPointY - currentPointY2! + currentPointY;
            currentPointX2 = currentPointX + double.parse(args[0]);
            currentPointY2 = currentPointY + double.parse(args[1]);
            currentPointX += double.parse(args[2]);
            currentPointY += double.parse(args[3]);
            path!.cubicTo(
              currentPointX1!,
              currentPointY1!,
              currentPointX2!,
              currentPointY2!,
              currentPointX,
              currentPointY,
            );
          } else {
            currentPointX1 = currentPointX + double.parse(args[0]);
            currentPointY1 = currentPointY + double.parse(args[1]);
            currentPointX += double.parse(args[2]);
            currentPointY += double.parse(args[3]);
            path!.quadraticBezierTo(
              currentPointX1!,
              currentPointY1!,
              currentPointX,
              currentPointY,
            );
          }
        } else if (firstLetter == "Q") {
          currentPointX1 = double.parse(args[0]);
          currentPointY1 = double.parse(args[1]);
          currentPointX = double.parse(args[2]);
          currentPointY = double.parse(args[3]);
          path!.quadraticBezierTo(
              currentPointX1!, currentPointY1!, currentPointX, currentPointY);
        } else if (firstLetter == "q") {
          currentPointX1 = currentPointX + double.parse(args[0]);
          currentPointY1 = currentPointY + double.parse(args[1]);
          currentPointX += double.parse(args[2]);
          currentPointY += double.parse(args[3]);
          path!.quadraticBezierTo(
            currentPointX1!,
            currentPointY1!,
            currentPointX,
            currentPointY,
          );
        } else if (firstLetter == "Z" || firstLetter == "z") {
          path!.close();
        }
      }
      videoItem.pathCache[argD] = path!;
    });
    return path;
  }

  void drawTextOnBitmap(
      Canvas canvas, String imageKey, Rect frameRect, int frameAlpha) {
    var dynamicText = videoItem.dynamicItem.dynamicText;
    if (dynamicText.isEmpty) return;
    if (dynamicText[imageKey] == null) return;

    TextPainter? textPainter = dynamicText[imageKey];

    textPainter?.paint(
      canvas,
      Offset(
        (frameRect.width - textPainter.width) / 2.0,
        (frameRect.height - textPainter.height) / 2.0,
      ),
    );
  }

  @override
  bool shouldRepaint(_SVGAPainter oldDelegate) {
    if (controller._canvasNeedsClear == true) {
      return true;
    }

    return !(oldDelegate.controller == controller &&
        oldDelegate.controller.videoItem == controller.videoItem &&
        oldDelegate.fit == fit &&
        oldDelegate.filterQuality == filterQuality &&
        oldDelegate.clipRect == clipRect);
  }
}
