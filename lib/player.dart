library svgaplayer_flutter_player;

import 'dart:math';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:svgaplayer_flutter/proto/svga.pb.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'proto/svga.pbserver.dart';
import 'dart:typed_data';
import 'package:path_drawing/path_drawing.dart';
import 'parser.dart';
part 'painter.dart';
part 'simple_player.dart';

class SVGAImage extends StatefulWidget {
  final SVGAAnimationController _controller;
  final BoxFit fit;
  final bool clearsAfterStop;

  SVGAImage(
    this._controller, {
    this.fit = BoxFit.contain,
    this.clearsAfterStop = true,
  });

  @override
  State<StatefulWidget> createState() => _SVGAImageState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Listenable>('controller', _controller));
  }
}

class SVGAAnimationController extends AnimationController {
  MovieEntity? _videoItem;
  bool _canvasNeedsClear = false;

  SVGAAnimationController({
    required TickerProvider vsync,
  }) : super(vsync: vsync, duration: Duration.zero);

  set videoItem(MovieEntity? value) {
    if (isAnimating) {
      stop();
    }
    if (value == null) {
      clear();
    }
    if (this._videoItem != null && this._videoItem!.autorelease) {
      this._videoItem!.dispose();
    }
    this._videoItem = value;
    if (value != null) {
      final movieParams = value.params;
      assert(movieParams.viewBoxWidth >= 0 || movieParams.viewBoxHeight >= 0,
          "Invalid SVGA file!");
      this.duration = Duration(
          milliseconds: (movieParams.frames / movieParams.fps * 1000).toInt());
    } else {
      this.duration = Duration.zero;
    }
  }

  MovieEntity? get videoItem => this._videoItem;

  /// mark [_SVGAPainter] needs clear
  void clear() {
    this._canvasNeedsClear = true;
    this.notifyListeners();
  }

  @override
  TickerFuture forward({double? from}) {
    assert(_videoItem != null,
        'SVGAAnimationController.forward() called after dispose()?');
    return super.forward(from: from);
  }

  @override
  void dispose() {
    for (var item in _listeners) {
      removeListener(item);
    }
    for (var item in _statusListeners) {
      removeStatusListener(item);
    }
    if (videoItem != null && videoItem!.autorelease) {
      videoItem!.dispose();
    }
    videoItem = null;
    super.dispose();
  }

  List<Function()> _listeners = [];
  List<AnimationStatusListener> _statusListeners = [];

  @override
  void addListener(listener) {
    super.addListener(listener);
    _listeners.add(listener);
  }

  @override
  void addStatusListener(listener) {
    super.addStatusListener(listener);
    _statusListeners.add(listener);
  }
}

class _SVGAImageState extends State<SVGAImage> {
  @override
  void initState() {
    super.initState();
    widget._controller.addListener(_handleChange);
    widget._controller.addStatusListener(_handleStatusChange);
  }

  @override
  void didUpdateWidget(SVGAImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget._controller != widget._controller) {
      oldWidget._controller.removeListener(_handleChange);
      oldWidget._controller.removeStatusListener(_handleStatusChange);
      widget._controller.addListener(_handleChange);
      widget._controller.addStatusListener(_handleStatusChange);
    }
  }

  void _handleChange() {
    if (mounted) {
      setState(() {
        // rebuild
      });
    }
  }

  void _handleStatusChange(AnimationStatus status) {
    if (status == AnimationStatus.completed && widget.clearsAfterStop) {
      widget._controller.clear();
    }
  }

  @override
  void dispose() {
    widget._controller.removeListener(_handleChange);
    widget._controller.removeStatusListener(_handleStatusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget._controller;
    final video = controller.videoItem;
    if (video == null || widget._controller.videoItem == null) {
      return Container();
    }
    final needsClear = controller._canvasNeedsClear;
    controller._canvasNeedsClear = false;
    return IgnorePointer(
      child: CustomPaint(
        painter: _SVGAPainter(
          video,
          _SVGAPainter.calculateCurrentFrame(video, controller.value),
          fit: widget.fit,
          clear: needsClear,
        ),
        size: Size(
          video.params.viewBoxWidth,
          video.params.viewBoxHeight,
        ),
      ),
    );
  }
}
