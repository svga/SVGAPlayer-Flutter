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
  final samples = const <String>[
    "assets/angel.svga",
    "assets/pin_jump.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/EmptyState.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/HamburgerArrow.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/PinJump.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/TwitterHeart.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/Walkthrough.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/kingset.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/halloween.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/heartbeat.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/matteBitmap.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/matteBitmap_1.x.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/matteRect.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/mutiMatte.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/posche.svga",
    "https://cdn.jsdelivr.net/gh/svga/SVGA-Samples@master/rose.svga",
  ].map((e) => [e.split('/').last, e]).toList(growable: false);

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
  final String? name;
  final String image;

  const SVGASampleScreen({Key? key, required this.image, this.name})
      : super(key: key);

  @override
  _SVGASampleScreenState createState() => _SVGASampleScreenState();
}

class _SVGASampleScreenState extends State<SVGASampleScreen>
    with SingleTickerProviderStateMixin {
  SVGAAnimationController? animationController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    this.animationController = SVGAAnimationController(vsync: this)
      ..addListener(() {
        // refresh
        if (mounted) {
          setState(() {});
        }
      });
    this._loadAnimation();
  }

  @override
  void dispose() {
    this.animationController?.dispose();
    this.animationController = null;
    super.dispose();
  }

  void _loadAnimation() async {
    // FIXME: may throw error on loading
    final videoItem = await _loadVideoItem(widget.image);
    if (mounted)
      setState(() {
        this.isLoading = false;
        this.animationController?.videoItem = videoItem;
        _playAnimation();
      });
  }

  void _playAnimation() {
    if (animationController?.isCompleted == true) {
      animationController?.reset();
    }
    animationController?.repeat(); // or animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (this.animationController == null) return Container();
    return Scaffold(
      appBar: AppBar(title: Text(widget.name ?? "")),
      body: Stack(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(8.0),
              child: Text("Url: ${widget.image}",
                  style: Theme.of(context).textTheme.subtitle2)),
          Center(
            child: isLoading
                ? CircularProgressIndicator()
                : SVGAImage(this.animationController!),
          ),
          Positioned(
              bottom: 0,
              child: Slider(
                value: animationController!.value,
                onChanged: (v) {
                  if (animationController?.isAnimating == true) {
                    animationController?.stop();
                  }
                  setState(() {
                    animationController?.value = v;
                  });
                },
              )),
        ],
      ),
      floatingActionButton: isLoading || animationController!.videoItem == null
          ? null
          : FloatingActionButton.extended(
              label: Text(animationController!.isAnimating ? "Pause" : "Play"),
              icon: Icon(animationController!.isAnimating
                  ? Icons.pause
                  : Icons.play_arrow),
              onPressed: () {
                if (animationController?.isAnimating == true) {
                  animationController?.stop();
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
