import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

void main() {
  const MethodChannel channel = MethodChannel('svgaplayer_flutter');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await SvgaplayerFlutter.platformVersion, '42');
  });
}
