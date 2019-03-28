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
     return MovieEntity.fromBuffer(bytes);
  }

}