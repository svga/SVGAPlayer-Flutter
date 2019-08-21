import 'package:flutter/material.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

void main() => runApp(ExampleApp());

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  final samples = [
    "assets/angel.svga",
    "assets/pin_jump.svga",
    "https://github.com/svga/SVGA-Samples/raw/master/EmptyState.svga",
    "https://github.com/svga/SVGA-Samples/raw/master/HamburgerArrow.svga",
    "https://github.com/svga/SVGA-Samples/raw/master/PinJump.svga",
    "https://github.com/svga/SVGA-Samples/raw/master/TwitterHeart.svga",
    "https://github.com/svga/SVGA-Samples/raw/master/Walkthrough.svga",
    "https://github.com/svga/SVGA-Samples/raw/master/kingset.svga",
    "https://github.com/svga/SVGA-Samples/raw/master/halloween.svga",
    "https://github.com/svga/SVGA-Samples/raw/master/heartbeat.svga",
    "https://github.com/svga/SVGA-Samples/raw/master/matteBitmap.svga",
    "https://github.com/svga/SVGA-Samples/raw/master/matteBitmap_1.x.svga",
    "https://github.com/svga/SVGA-Samples/raw/master/matteRect.svga",
    "https://github.com/svga/SVGA-Samples/raw/master/mutiMatte.svga",
    "https://github.com/svga/SVGA-Samples/raw/master/posche.svga",
    "https://github.com/svga/SVGA-Samples/raw/master/rose.svga",
  ].map((e)=> [e.split('/').last, e]).toList(growable: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SVGA Flutter Samples')),
      body: ListView.separated(
          itemCount: samples.length,
          separatorBuilder: (_, __) => Divider(),
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(samples[index].first),
                subtitle: Text(samples[index].last),
                onTap: () => _goToSample(context, samples[index]));
          }),
    );
  }

  void _goToSample(context, List<String> sample) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return SVGASampleScreen(name: sample.first, image: sample.last);
    }));
  }
}

class SVGASampleScreen extends StatefulWidget {
  final String name;
  final String image;

  const SVGASampleScreen({Key key, @required this.image, this.name})
      : assert(image != null),
        super(key: key);

  @override
  _SVGASampleScreenState createState() => _SVGASampleScreenState();
}

class _SVGASampleScreenState extends State<SVGASampleScreen>
    with SingleTickerProviderStateMixin {
  SVGAAnimationController animationController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    this.animationController = SVGAAnimationController(vsync: this);
    this._loadAnimation();
  }

  @override
  void dispose() {
    this.animationController.videoItem = null;
    this.animationController.dispose();
    super.dispose();
  }

  void _loadAnimation() async {
    // FIXME: may throw error on loading
    final videoItem = await _loadVideoItem(widget.image);
    if (mounted)
      setState(() {
        this.isLoading = false;
        this.animationController.videoItem = videoItem;
        _playAnimation();
      });
  }

  void _playAnimation() {
    animationController
        .repeat()
        .whenComplete(() => animationController.videoItem = null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: Stack(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(8.0),
              child: Text("Url: ${widget.image}",
                  style: Theme.of(context).textTheme.subtitle)),
          Center(
            child: isLoading
                ? CircularProgressIndicator()
                : SVGAImage(this.animationController),
          )
        ],
      ),
      floatingActionButton: isLoading || animationController.videoItem == null
          ? null
          : FloatingActionButton.extended(
              label: Text(animationController.isAnimating ? "Pause" : "Play"),
              icon: Icon(animationController.isAnimating
                  ? Icons.pause
                  : Icons.play_arrow),
              onPressed: () {
                if (animationController.isAnimating) {
                  animationController.stop();
                } else {
                  _playAnimation();
                }
                setState(() {});
              }),
    );
  }
}

Future _loadVideoItem(String image) {
  Future Function(String) decoder;
  if (image.startsWith(RegExp(r'https?://'))) {
    decoder = SVGAParser.shared.decodeFromURL;
  } else {
    decoder = SVGAParser.shared.decodeFromAssets;
  }
  return decoder(image);
}
