import 'package:flutter/material.dart';
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
        "https://github.com/yyued/SVGA-Samples/blob/master/posche.svga?raw=true");
    print("start play" + DateTime.now().toString());
    this.animationController.videoItem = videoItem;
    await this.animationController.startAnimation(onFrame: (currentFrame, _){
      print(currentFrame);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: DecoratedBox(
          decoration: BoxDecoration(color: Colors.black),
          child: SVGAPlayer(
            animationController,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
