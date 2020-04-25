import 'dart:io' show zlib;
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart' show decodeImageFromList;
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' show get;
import 'proto/svga.pbserver.dart';

class SVGAParser {
  const SVGAParser();
  static const shared = SVGAParser();

  Future<MovieEntity> decodeFromURL(String url) async {
    final response = await get(url);
    return decodeFromBuffer(response.bodyBytes);
  }

  Future<MovieEntity> decodeFromAssets(String path) async {
    return decodeFromBuffer((await rootBundle.load(path)).buffer.asUint8List());
  }

  Future<MovieEntity> decodeFromBuffer(List<int> bytes) {
    final inflatedBytes = zlib.decode(bytes);
    return prepareResources(
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
      } catch (e, stack) {
        assert(() {
          FlutterError.reportError(FlutterErrorDetails(
            exception: e,
            stack: stack,
            library: 'svgaplayer',
            context: ErrorDescription('during prepare resource'),
            informationCollector: () sync* {
              yield ErrorSummary('Decoding image failed.');
            },
          ));
          return true;
        }());
      }
    }
    return movieItem;
  }
}
