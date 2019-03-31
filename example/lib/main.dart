import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
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
    // final videoItem = await SVGAParser.shared.decodeFromURL(
    //     "https://github.com/yyued/SVGA-Samples/blob/master/kingset.svga?raw=true");
    final videoItem = await SVGAParser.shared.decodeFromAssets("assets/pin_jump.svga");
    videoItem.dynamicItem.setImageWithUrl(
        "https://github.com/PonyCui/resources/blob/master/svga_replace_avatar.png?raw=true",
        "99");
    videoItem.dynamicItem.setText(
        TextPainter(
            text: TextSpan(
          text: "Hello, World!",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
        "banner");
    this.animationController.videoItem = videoItem;
    this
        .animationController
        .repeat()
        .whenComplete(() => this.animationController.videoItem = null);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.black),
            child: SVGAImage(this.animationController),
          ),
        ),
      ),
    );
  }
}
