import 'dart:io';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart';
import 'proto/svga.pbserver.dart';

class SVGAParser {
  static final shared = SVGAParser();

  final _zLibCodec = ZLibCodec();

  Future<MovieEntity> decodeFromURL(String url) async {
    final response = await get(url);
    return await this.decodeFromBuffer(response.bodyBytes);
  }

  Future<MovieEntity> decodeFromAssets(String path) async {
    return this.decodeFromBuffer((await rootBundle.load("assets/pin_jump.svga")).buffer.asUint8List());
  }

  Future<MovieEntity> decodeFromBuffer(List<int> bytes) async {
    final inflatedBytes = this._zLibCodec.decode(bytes);
    return await prepareResources(
        processShapeItems(MovieEntity.fromBuffer(inflatedBytes)));
  }

  MovieEntity processShapeItems(MovieEntity movieItem) {
    movieItem.sprites.forEach((sprite) {
      List<ShapeEntity> lastShape;
      sprite.frames.forEach((frame) {
        if (frame.shapes != null && frame.shapes.length > 0) {
          if (frame.shapes[0].type == ShapeEntity_ShapeType.KEEP &&
              lastShape != null) {
            frame.shapes = lastShape;
          } else if (frame.shapes != null) {
            lastShape = frame.shapes;
          }
        }
      });
    });
    return movieItem;
  }

  Future<MovieEntity> prepareResources(MovieEntity movieItem) async {
    for (var item in movieItem.images.entries) {
      try {
        movieItem.bitmapCache[item.key] = await decodeImageFromList(item.value);
      } catch (e) {}
    }
    return movieItem;
  }
}
