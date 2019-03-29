import 'package:flutter/material.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  SVGAAnimationController animationController;

  @override
  void initState() {
    this.animationController = SVGAAnimationController(vsync: this);
    this.loadAnimation();
    super.initState();
  }

  @override
  void dispose() {
    this.animationController.dispose();
    super.dispose();
  }

  void loadAnimation() async {
    final videoItem = await SVGAParser.shared.decodeFromURL(
        "https://github.com/yyued/SVGA-Samples/blob/master/rose.svga?raw=true");
    print("start play" + DateTime.now().toString());
    this.animationController.videoItem = videoItem;
    this.animationController.repeat();
    // this.animationController.stepToFrame(40, false);
    await Future.delayed(Duration(milliseconds: 1000));
    this.animationController.value = 0.5;
    this.animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: DecoratedBox(
          decoration: BoxDecoration(color: Colors.black),
          child: SVGAImageView(
            animationController,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
