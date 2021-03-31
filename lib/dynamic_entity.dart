import 'dart:ui' as ui show Image;
import 'package:http/http.dart';
import 'package:flutter/painting.dart';

typedef SVGACustomDrawer = Function(Canvas canvas, int frameIndex);

class SVGADynamicEntity {
  final Map<String, bool> dynamicHidden = {};
  final Map<String, ui.Image> dynamicImages = {};
  final Map<String, TextPainter> dynamicText = {};
  final Map<String, SVGACustomDrawer> dynamicDrawer = {};

  void setHidden(bool value, String forKey) {
    this.dynamicHidden[forKey] = value;
  }

  void setImage(ui.Image image, String forKey) {
    this.dynamicImages[forKey] = image;
  }

  Future<void> setImageWithUrl(String url, String forKey) async {
    this.dynamicImages[forKey] =
        await decodeImageFromList((await get(Uri.parse(url))).bodyBytes);
  }

  void setText(TextPainter textPainter, String forKey) {
    if (textPainter.textDirection == null) {
      textPainter.textDirection = TextDirection.ltr;
      textPainter.layout();
    }
    this.dynamicText[forKey] = textPainter;
  }

  void setDynamicDrawer(SVGACustomDrawer drawer, String forKey) {
    this.dynamicDrawer[forKey] = drawer;
  }

  void reset() {
    this.dynamicHidden.clear();
    this.dynamicImages.clear();
    this.dynamicText.clear();
    this.dynamicDrawer.clear();
  }
}
