part of svgaplayer_flutter_player;

class SVGASimpleImage extends StatefulWidget {
  final String resUrl;
  final String assetsName;
  final File file;

  SVGASimpleImage({this.resUrl, this.assetsName, this.file})
      : super(key: Key(resUrl ?? assetsName ?? file.toString()));

  @override
  State<StatefulWidget> createState() {
    return _SVGASimpleImageState(
      resUrl: this.resUrl,
      assetsName: this.assetsName,
      file: file,
    );
  }
}

class _SVGASimpleImageState extends State<SVGASimpleImage>
    with SingleTickerProviderStateMixin {
  SVGAAnimationController animationController;

  _SVGASimpleImageState({String resUrl, String assetsName, File file}) {
    if (resUrl != null) {
      SVGAParser.shared.decodeFromURL(resUrl).then((videoItem) {
        this.animationController
          ..videoItem = videoItem
          ..repeat();
      });
    } else if (assetsName != null) {
      SVGAParser.shared.decodeFromAssets(assetsName).then((videoItem) {
        this.animationController
          ..videoItem = videoItem
          ..repeat();
      });
    } else if (file != null) {
      SVGAParser.shared
          .decodeFromBuffer(file.readAsBytesSync())
          .then((videoItem) {
        this.animationController
          ..videoItem = videoItem
          ..repeat();
      });
    }
  }

  @override
  void initState() {
    this.animationController = SVGAAnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SVGAImage(this.animationController);
  }
}
