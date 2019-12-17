import 'package:flutter_test/flutter_test.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

void main() {
  test("decodeFromURL", () async {
    var decoded = await SVGAParser.shared.decodeFromURL(
        "https://github.com/svga/SVGA-Samples/raw/master/EmptyState.svga");
    decoded.check();
  });
}
