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

  /// Used to set the filterQuality of drawing the images inside SVGA.
  ///
  /// The default is [FilterQuality.low]
  final FilterQuality filterQuality;

  /// If `true`, the SVGA painter may draw beyond the expected canvas bounds
  /// and cause additional memory overhead.
  ///
  /// For backwards compatibility, the default is `null`,
  /// which means allow drawing to overflow canvas bounds.
  final bool? allowDrawingOverflow;
  const SVGAImage(
    this._controller, {
    Key? key,
    this.fit = BoxFit.contain,
    this.filterQuality = FilterQuality.low,
    this.allowDrawingOverflow,
    this.clearsAfterStop = true,
  }) : super(key: key);

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
    assert(!_isDisposed, '$this has been disposed!');
    if (_isDisposed) return;
    if (isAnimating) {
      stop();
    }
    if (value == null) {
      clear();
    }
    if (_videoItem != null && _videoItem!.autorelease) {
      _videoItem!.dispose();
    }
    _videoItem = value;
    if (value != null) {
      final movieParams = value.params;
      assert(
          movieParams.viewBoxWidth >= 0 &&
              movieParams.viewBoxHeight >= 0 &&
              movieParams.frames >= 1,
          "Invalid SVGA file!");
      int fps = movieParams.fps;
      // avoid dividing by 0, use 20 by default
      // see https://github.com/svga/SVGAPlayer-Web/blob/1c5711db068a25006316f9890b11d6666d531c39/src/videoEntity.js#L51
      if (fps == 0) fps = 20;
      duration =
          Duration(milliseconds: (movieParams.frames / fps * 1000).toInt());
    } else {
      duration = Duration.zero;
    }
    // reset progress after videoitem changed
    reset();
  }

  MovieEntity? get videoItem => _videoItem;

  /// Current drawing frame index of [videoItem], returns 0 if [videoItem] is null.
  int get currentFrame {
    final videoItem = _videoItem;
    if (videoItem == null) return 0;
    return min(
      videoItem.params.frames - 1,
      max(0, (videoItem.params.frames.toDouble() * value).toInt()),
    );
  }

  /// Total frames of [videoItem], returns 0 if [videoItem] is null.
  int get frames {
    final videoItem = _videoItem;
    if (videoItem == null) return 0;
    return videoItem.params.frames;
  }

  /// mark [_SVGAPainter] needs clear
  void clear() {
    _canvasNeedsClear = true;
    if (!_isDisposed) notifyListeners();
  }

  @override
  TickerFuture forward({double? from}) {
    assert(_videoItem != null,
        'SVGAAnimationController.forward() called after dispose()?');
    return super.forward(from: from);
  }

  bool _isDisposed = false;
  @override
  void dispose() {
    // auto dispose _videoItem when set null
    videoItem = null;
     _isDisposed = true;
    super.dispose();
  }
}

class _SVGAImageState extends State<SVGAImage> {
  @override
  void initState() {
    super.initState();
    widget._controller.addStatusListener(_handleStatusChange);
  }

  @override
  void didUpdateWidget(SVGAImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget._controller != widget._controller) {
      oldWidget._controller.removeStatusListener(_handleStatusChange);
      widget._controller.addStatusListener(_handleStatusChange);
    }
  }

  void _handleStatusChange(AnimationStatus status) {
    if (status == AnimationStatus.completed && widget.clearsAfterStop) {
      widget._controller.clear();
    }
  }

  @override
  void dispose() {
    widget._controller.removeStatusListener(_handleStatusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget._controller;
    final video = controller.videoItem;
    final Size viewBoxSize;
    if (video == null || !video.isInitialized()) {
      viewBoxSize = Size.zero;
    } else {
      viewBoxSize = Size(video.params.viewBoxWidth, video.params.viewBoxHeight);
    }
    if (viewBoxSize.isEmpty) {
      return const SizedBox.shrink();
    }
    return IgnorePointer(
      child: CustomPaint(
        painter: _SVGAPainter(
          controller,
          fit: widget.fit,
          filterQuality: widget.filterQuality,
          // default is allowing overflow for backward compatibility
          clipRect: widget.allowDrawingOverflow == false,
        ),
        size: viewBoxSize,
      ),
    );
  }
}
