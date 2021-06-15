part of svgaplayer_flutter_player;

class SVGASimpleImage extends StatefulWidget {
  final String? resUrl;
  final String? assetsName;

  SVGASimpleImage({Key? key, this.resUrl, this.assetsName}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SVGASimpleImageState();
  }
}

class _SVGASimpleImageState extends State<SVGASimpleImage>
    with SingleTickerProviderStateMixin {
  SVGAAnimationController? animationController;

  @override
  void initState() {
    super.initState();
    this.animationController = SVGAAnimationController(vsync: this);
    Future? decode;
    if (widget.resUrl != null) {
      decode = SVGAParser.shared.decodeFromURL(widget.resUrl!);
    } else if (widget.assetsName != null) {
      decode = SVGAParser.shared.decodeFromAssets(widget.assetsName!);
    }
    decode?.then((videoItem) {
      if (mounted && this.animationController != null) {
        this.animationController!
          ..videoItem = videoItem
          ..repeat();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this.animationController == null) {
      return Container();
    }
    return SVGAImage(this.animationController!);
  }

  @override
  void dispose() {
    this.animationController?.dispose();
    super.dispose();
  }
}
