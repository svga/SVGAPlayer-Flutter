import 'dart:io';
import 'package:http/http.dart';
import 'proto/svga.pbserver.dart';

class SVGAParser {
  static final shared = SVGAParser();

  final _zLibCodec = ZLibCodec();

  Future<MovieEntity> decodeFromURL(String url) async {
    print("start get" + DateTime.now().toString());
    final response = await get(url);
    print("start inflated" + DateTime.now().toString());
    final inflatedBytes = this._zLibCodec.decode(response.bodyBytes);
    print("start decode buffer" + DateTime.now().toString());
    return await this.decodeFromBuffer(inflatedBytes);
  }

  Future<MovieEntity> decodeFromBuffer(List<int> bytes) async {
    return processShapeItems(MovieEntity.fromBuffer(bytes));
  }

  MovieEntity processShapeItems(MovieEntity movieItem) {
    movieItem.sprites.forEach((sprite) {
      List<ShapeEntity> lastShape;
      sprite.frames.forEach((frame) {
        if (frame.shapes != null && frame.shapes.length > 0) {
          if (frame.shapes[0].type == ShapeEntity_ShapeType.KEEP &&
              lastShape != null) {
            frame.shapes = lastShape;
          } else if (frame.shapes !=null) {
            lastShape = frame.shapes;
          }
        }
      });
    });
    return movieItem;
  }
}
