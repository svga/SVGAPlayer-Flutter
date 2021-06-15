part of svgaplayer_flutter_player;

class _SVGAPainter extends CustomPainter {
  final MovieEntity videoItem;
  final int currentFrame;
  final BoxFit fit;
  final bool clear;

  static int calculateCurrentFrame(
      MovieEntity videoItem, double animationProcess) {
    return min(
      videoItem.params.frames - 1,
      max(0, (videoItem.params.frames.toDouble() * animationProcess).toInt()),
    );
  }

  const _SVGAPainter(this.videoItem, this.currentFrame,
      {this.fit = BoxFit.contain, this.clear = false});

  @override
  void paint(Canvas canvas, Size size) {
    if (this.clear) return;
    canvas.save();
    this.scaleToFit(canvas, size);
    this.drawSprites(canvas, size);
    canvas.restore();
  }

  void scaleToFit(Canvas canvas, Size size) {
    final double imageWidth = this.videoItem.params.viewBoxWidth.toDouble();
    final double imageHeight = this.videoItem.params.viewBoxHeight.toDouble();
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

  void drawSprites(Canvas canvas, Size size) {
    this.videoItem.sprites.forEach((sprite) {
      drawBitmap(sprite, canvas, size);
      drawShape(sprite, canvas, size);
      drawText(sprite, canvas, size);
    });
  }

  void drawBitmap(SpriteEntity sprite, Canvas canvas, Size size) {
    if (sprite.imageKey.isEmpty) return;
    if (this.videoItem.dynamicItem.dynamicHidden[sprite.imageKey] == true)
      return;
    final frameItem = sprite.frames[this.currentFrame];
    final bitmap = this.videoItem.dynamicItem.dynamicImages[sprite.imageKey] ??
        this.videoItem.bitmapCache[sprite.imageKey];
    if (bitmap == null) return;
    canvas.save();
    if (frameItem.hasTransform()) {
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
    }
    final bitmapPaint = Paint();
    bitmapPaint.filterQuality = FilterQuality.low; //解决bitmap锯齿问题
    bitmapPaint.isAntiAlias = true;
    bitmapPaint.color =
        Color.fromARGB((frameItem.alpha * 255.0).toInt(), 255, 255, 255);
    if (frameItem.hasClipPath()) {
      canvas.clipPath(this.buildDPath(frameItem.clipPath));
    }
    // canvas.drawImage(bitmap, Offset.zero, bitmapPaint);
    Rect srcRect =
        Rect.fromLTRB(0, 0, bitmap.width.toDouble(), bitmap.height.toDouble());
    Rect dstRect =
        Rect.fromLTRB(0, 0, frameItem.layout.width, frameItem.layout.height);
    canvas.drawImageRect(bitmap, srcRect, dstRect, bitmapPaint);
    if (this.videoItem.dynamicItem.dynamicDrawer[sprite.imageKey] != null) {
      this.videoItem.dynamicItem.dynamicDrawer[sprite.imageKey]!(
          canvas, this.currentFrame);
    }
    canvas.restore();
  }

  void drawShape(SpriteEntity sprite, Canvas canvas, Size size) {
    if (sprite.imageKey.isNotEmpty &&
        this.videoItem.dynamicItem.dynamicHidden[sprite.imageKey] == true)
      return;
    final frameItem = sprite.frames[this.currentFrame];
    if (frameItem.shapes.isEmpty || frameItem.shapes.length == 0) return;
    canvas.save();
    if (frameItem.hasTransform()) {
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
    }
    frameItem.shapes.forEach((shape) {
      final path = this.buildPath(shape);
      if (shape.hasTransform() || frameItem.hasClipPath()) {
        canvas.save();
      }
      if (shape.hasTransform()) {
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
      if (frameItem.hasClipPath()) {
        canvas.clipPath(this.buildDPath(frameItem.clipPath));
      }
      final fill = shape.styles.fill;
      if (fill.isInitialized()) {
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
      final strokeWidth = shape.styles.strokeWidth;
      if (strokeWidth > 0) {
        final paint = Paint();
        paint.style = PaintingStyle.stroke;
        if (shape.styles.stroke.isInitialized()) {
          paint.color = Color.fromARGB(
            (shape.styles.stroke.a * frameItem.alpha * 255).toInt(),
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
        if (sprite.imageKey.isNotEmpty &&
            this.videoItem.dynamicItem.dynamicDrawer[sprite.imageKey] != null) {
          this.videoItem.dynamicItem.dynamicDrawer[sprite.imageKey]!(
              canvas, this.currentFrame);
        }
      }
      if (shape.hasTransform() || frameItem.hasClipPath()) {
        canvas.restore();
      }
    });
    canvas.restore();
  }

  static const _validMethods = 'MLHVCSQRZmlhvcsqrz';

  Path buildPath(ShapeEntity shape) {
    final path = Path();
    if (shape.type == ShapeEntity_ShapeType.SHAPE) {
      final args = shape.shape;
      final argD = args.d;
      return this.buildDPath(argD, path: path);
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
    if (this.videoItem.pathCache[argD] != null) {
      return this.videoItem.pathCache[argD]!;
    }
    if (path == null) {
      path = Path();
    }
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
      if (segment.length == 0) {
        return;
      }
      final firstLetter = segment.substring(0, 1);
      if (_validMethods.indexOf(firstLetter) >= 0) {
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
      this.videoItem.pathCache[argD] = path!;
    });
    return path;
  }

  void drawText(SpriteEntity sprite, Canvas canvas, Size size) {
    if (this.videoItem.dynamicItem.dynamicText.length == 0) return;
    if (sprite.imageKey.isEmpty) return;
    if (this.videoItem.dynamicItem.dynamicHidden[sprite.imageKey] == true)
      return;
    if (this.videoItem.dynamicItem.dynamicText[sprite.imageKey] == null) return;
    final frameItem = sprite.frames[this.currentFrame];
    if (frameItem.layout.width <= 0 || frameItem.layout.height <= 0) return;
    canvas.save();
    if (frameItem.hasTransform()) {
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
    }
    TextPainter? textPainter =
        this.videoItem.dynamicItem.dynamicText[sprite.imageKey];
    textPainter?.paint(
      canvas,
      Offset(
        (frameItem.layout.width - textPainter.width) / 2.0,
        (frameItem.layout.height - textPainter.height) / 2.0,
      ),
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    if (this.clear == true) {
      return true;
    } else if (oldDelegate is _SVGAPainter) {
      return !(oldDelegate.videoItem == this.videoItem &&
          oldDelegate.currentFrame == this.currentFrame);
    }
    return true;
  }
}
