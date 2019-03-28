import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final animationController = SVGAPlayerController();

  @override
  void initState() {
    super.initState();
    this.loadAnimation();
  }

  void loadAnimation() async {
    final videoItem = await SVGAParser.shared.decodeFromURL(
        "https://github.com/yyued/SVGA-Samples/blob/master/angel.svga?raw=true");
    print("start play" + DateTime.now().toString());
    this.animationController.videoItem = videoItem;
    this.animationController.startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.black),
            child: ClipRect(
              child: SizedBox(
                width: 300,
                height: 500,
                child: SVGAPlayer(
                  animationController,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
