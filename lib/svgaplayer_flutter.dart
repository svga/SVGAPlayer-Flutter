import 'dart:async';
import 'package:flutter/services.dart';
export 'parser.dart';
export 'player.dart';

class SvgaplayerFlutter {
  static const MethodChannel _channel =
      const MethodChannel('svgaplayer_flutter');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
