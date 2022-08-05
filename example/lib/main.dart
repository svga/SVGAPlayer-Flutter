import 'dart:math' as math;
import 'package:flutter/foundation.dart';
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

  // callback for register dynamicItem
  final dynamicSamples = <String, void Function(MovieEntity entity)>{
    "kingset.svga": (entity) => entity.dynamicItem
      ..setText(
          TextPainter(
              text: TextSpan(
                  text: "Hello, World!",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ))),
          "banner")
    // ..setImageWithUrl(
    //     "https://github.com/PonyCui/resources/blob/master/svga_replace_avatar.png?raw=true",
    //     "99")
    // ..setDynamicDrawer((canvas, frameIndex) {
    //   canvas.drawRect(Rect.fromLTWH(0, 0, 88, 88),
    //       Paint()..color = Colors.red); // draw by yourself.
    // }, "banner"),
  };

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
      return SVGASampleScreen(
          name: sample.first,
          image: sample.last,
          dynamicCallback: dynamicSamples[sample.first]);
    }));
  }
}

class SVGASampleScreen extends StatefulWidget {
  final String? name;
  final String image;
  final void Function(MovieEntity entity)? dynamicCallback;
  const SVGASampleScreen(
      {Key? key, required this.image, this.name, this.dynamicCallback})
      : super(key: key);

  @override
  _SVGASampleScreenState createState() => _SVGASampleScreenState();
}

class _SVGASampleScreenState extends State<SVGASampleScreen>
    with SingleTickerProviderStateMixin {
  SVGAAnimationController? animationController;
  bool isLoading = true;
  Color backgroundColor = Colors.transparent;
  bool allowOverflow = true;
  // Canvaskit need FilterQuality.high
  FilterQuality filterQuality = kIsWeb ? FilterQuality.high : FilterQuality.low;
  BoxFit fit = BoxFit.contain;
  late double containerWidth;
  late double containerHeight;
  bool hideOptions = false;
  @override
  void initState() {
    super.initState();
    this.animationController = SVGAAnimationController(vsync: this);
    this._loadAnimation();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    containerWidth = math.min(350, MediaQuery.of(context).size.width);
    containerHeight = math.min(350, MediaQuery.of(context).size.height);
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
    if (widget.dynamicCallback != null) {
      widget.dynamicCallback!(videoItem);
    }
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
                : Container(
                    width: containerWidth,
                    height: containerHeight,
                    color: backgroundColor,
                    child: SVGAImage(
                      this.animationController!,
                      fit: fit,
                      clearsAfterStop: false,
                      allowDrawingOverflow: allowOverflow,
                      filterQuality: filterQuality,
                    ),
                  ),
          ),
          Positioned(bottom: 10, child: _buildOptions()),
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

  Container _buildOptions() {
    return Container(
      width: 255,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              iconSize: 40,
              onPressed: () {
                setState(() {
                  hideOptions = !hideOptions;
                });
              },
              icon: hideOptions
                  ? Icon(Icons.arrow_drop_up)
                  : Icon(Icons.arrow_drop_down)),
          if (!hideOptions) ...[
            AnimatedBuilder(
                animation: animationController!,
                builder: (context, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          'Current frame: ${animationController!.currentFrame + 1}/${animationController!.frames}'),
                      Slider(
                        min: 0,
                        max: animationController!.frames.toDouble(),
                        value: animationController!.currentFrame.toDouble(),
                        onChanged: (v) {
                          if (animationController?.isAnimating == true) {
                            animationController?.stop();
                          }
                          animationController?.value =
                              v / animationController!.frames;
                        },
                      ),
                    ],
                  );
                }),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Image filter quality'),
                const SizedBox(width: 8),
                DropdownButton<FilterQuality>(
                  value: filterQuality,
                  onChanged: (FilterQuality? newValue) {
                    setState(() {
                      filterQuality = newValue!;
                    });
                  },
                  items: FilterQuality.values.map((FilterQuality value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Box fit'),
                const SizedBox(width: 8),
                DropdownButton<BoxFit>(
                  value: fit,
                  onChanged: (BoxFit? newValue) {
                    setState(() {
                      fit = newValue!;
                    });
                  },
                  items: BoxFit.values.map((BoxFit value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                )
              ],
            ),
            Text('Container width: $containerWidth'),
            Slider(
              min: 100,
              max: MediaQuery.of(context).size.width,
              value: containerWidth,
              onChanged: (v) {
                setState(() {
                  containerWidth = v.roundToDouble();
                });
              },
            ),
            Text('Container height: $containerHeight'),
            Slider(
              min: 100,
              max: MediaQuery.of(context).size.height,
              value: containerHeight,
              onChanged: (v) {
                setState(() {
                  containerHeight = v.roundToDouble();
                });
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Allow drawing overflow'),
                const SizedBox(width: 8),
                Switch(
                  value: allowOverflow,
                  onChanged: (v) {
                    setState(() {
                      allowOverflow = v;
                    });
                  },
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Colors.transparent,
                Colors.black,
                Colors.yellow,
                Colors.red,
                Colors.blue,
                Colors.green,
              ]
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        setState(() {
                          backgroundColor = e;
                        });
                      },
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: ShapeDecoration(
                          color: e,
                          shape: CircleBorder(
                            side: backgroundColor == e
                                ? const BorderSide(
                                    color: Colors.white,
                                    width: 3,
                                  )
                                : const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ],
      ),
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
