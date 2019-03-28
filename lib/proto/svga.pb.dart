///
//  Generated code. Do not modify.
//  source: svga.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, Map, override;

import 'package:protobuf/protobuf.dart' as $pb;

import 'svga.pbenum.dart';

export 'svga.pbenum.dart';

class MovieParams extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('MovieParams', package: const $pb.PackageName('com.opensource.svga'))
    ..a<double>(1, 'viewBoxWidth', $pb.PbFieldType.OF)
    ..a<double>(2, 'viewBoxHeight', $pb.PbFieldType.OF)
    ..a<int>(3, 'fps', $pb.PbFieldType.O3)
    ..a<int>(4, 'frames', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  MovieParams() : super();
  MovieParams.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  MovieParams.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  MovieParams clone() => new MovieParams()..mergeFromMessage(this);
  MovieParams copyWith(void Function(MovieParams) updates) => super.copyWith((message) => updates(message as MovieParams));
  $pb.BuilderInfo get info_ => _i;
  static MovieParams create() => new MovieParams();
  MovieParams createEmptyInstance() => create();
  static $pb.PbList<MovieParams> createRepeated() => new $pb.PbList<MovieParams>();
  static MovieParams getDefault() => _defaultInstance ??= create()..freeze();
  static MovieParams _defaultInstance;
  static void $checkItem(MovieParams v) {
    if (v is! MovieParams) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  double get viewBoxWidth => $_getN(0);
  set viewBoxWidth(double v) { $_setFloat(0, v); }
  bool hasViewBoxWidth() => $_has(0);
  void clearViewBoxWidth() => clearField(1);

  double get viewBoxHeight => $_getN(1);
  set viewBoxHeight(double v) { $_setFloat(1, v); }
  bool hasViewBoxHeight() => $_has(1);
  void clearViewBoxHeight() => clearField(2);

  int get fps => $_get(2, 0);
  set fps(int v) { $_setSignedInt32(2, v); }
  bool hasFps() => $_has(2);
  void clearFps() => clearField(3);

  int get frames => $_get(3, 0);
  set frames(int v) { $_setSignedInt32(3, v); }
  bool hasFrames() => $_has(3);
  void clearFrames() => clearField(4);
}

class SpriteEntity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('SpriteEntity', package: const $pb.PackageName('com.opensource.svga'))
    ..aOS(1, 'imageKey')
    ..pp<FrameEntity>(2, 'frames', $pb.PbFieldType.PM, FrameEntity.$checkItem, FrameEntity.create)
    ..hasRequiredFields = false
  ;

  SpriteEntity() : super();
  SpriteEntity.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  SpriteEntity.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  SpriteEntity clone() => new SpriteEntity()..mergeFromMessage(this);
  SpriteEntity copyWith(void Function(SpriteEntity) updates) => super.copyWith((message) => updates(message as SpriteEntity));
  $pb.BuilderInfo get info_ => _i;
  static SpriteEntity create() => new SpriteEntity();
  SpriteEntity createEmptyInstance() => create();
  static $pb.PbList<SpriteEntity> createRepeated() => new $pb.PbList<SpriteEntity>();
  static SpriteEntity getDefault() => _defaultInstance ??= create()..freeze();
  static SpriteEntity _defaultInstance;
  static void $checkItem(SpriteEntity v) {
    if (v is! SpriteEntity) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get imageKey => $_getS(0, '');
  set imageKey(String v) { $_setString(0, v); }
  bool hasImageKey() => $_has(0);
  void clearImageKey() => clearField(1);

  List<FrameEntity> get frames => $_getList(1);
}

class AudioEntity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('AudioEntity', package: const $pb.PackageName('com.opensource.svga'))
    ..aOS(1, 'audioKey')
    ..a<int>(2, 'startFrame', $pb.PbFieldType.O3)
    ..a<int>(3, 'endFrame', $pb.PbFieldType.O3)
    ..a<int>(4, 'startTime', $pb.PbFieldType.O3)
    ..a<int>(5, 'totalTime', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  AudioEntity() : super();
  AudioEntity.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  AudioEntity.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  AudioEntity clone() => new AudioEntity()..mergeFromMessage(this);
  AudioEntity copyWith(void Function(AudioEntity) updates) => super.copyWith((message) => updates(message as AudioEntity));
  $pb.BuilderInfo get info_ => _i;
  static AudioEntity create() => new AudioEntity();
  AudioEntity createEmptyInstance() => create();
  static $pb.PbList<AudioEntity> createRepeated() => new $pb.PbList<AudioEntity>();
  static AudioEntity getDefault() => _defaultInstance ??= create()..freeze();
  static AudioEntity _defaultInstance;
  static void $checkItem(AudioEntity v) {
    if (v is! AudioEntity) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get audioKey => $_getS(0, '');
  set audioKey(String v) { $_setString(0, v); }
  bool hasAudioKey() => $_has(0);
  void clearAudioKey() => clearField(1);

  int get startFrame => $_get(1, 0);
  set startFrame(int v) { $_setSignedInt32(1, v); }
  bool hasStartFrame() => $_has(1);
  void clearStartFrame() => clearField(2);

  int get endFrame => $_get(2, 0);
  set endFrame(int v) { $_setSignedInt32(2, v); }
  bool hasEndFrame() => $_has(2);
  void clearEndFrame() => clearField(3);

  int get startTime => $_get(3, 0);
  set startTime(int v) { $_setSignedInt32(3, v); }
  bool hasStartTime() => $_has(3);
  void clearStartTime() => clearField(4);

  int get totalTime => $_get(4, 0);
  set totalTime(int v) { $_setSignedInt32(4, v); }
  bool hasTotalTime() => $_has(4);
  void clearTotalTime() => clearField(5);
}

class Layout extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Layout', package: const $pb.PackageName('com.opensource.svga'))
    ..a<double>(1, 'x', $pb.PbFieldType.OF)
    ..a<double>(2, 'y', $pb.PbFieldType.OF)
    ..a<double>(3, 'width', $pb.PbFieldType.OF)
    ..a<double>(4, 'height', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  Layout() : super();
  Layout.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Layout.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Layout clone() => new Layout()..mergeFromMessage(this);
  Layout copyWith(void Function(Layout) updates) => super.copyWith((message) => updates(message as Layout));
  $pb.BuilderInfo get info_ => _i;
  static Layout create() => new Layout();
  Layout createEmptyInstance() => create();
  static $pb.PbList<Layout> createRepeated() => new $pb.PbList<Layout>();
  static Layout getDefault() => _defaultInstance ??= create()..freeze();
  static Layout _defaultInstance;
  static void $checkItem(Layout v) {
    if (v is! Layout) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  double get x => $_getN(0);
  set x(double v) { $_setFloat(0, v); }
  bool hasX() => $_has(0);
  void clearX() => clearField(1);

  double get y => $_getN(1);
  set y(double v) { $_setFloat(1, v); }
  bool hasY() => $_has(1);
  void clearY() => clearField(2);

  double get width => $_getN(2);
  set width(double v) { $_setFloat(2, v); }
  bool hasWidth() => $_has(2);
  void clearWidth() => clearField(3);

  double get height => $_getN(3);
  set height(double v) { $_setFloat(3, v); }
  bool hasHeight() => $_has(3);
  void clearHeight() => clearField(4);
}

class Transform extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Transform', package: const $pb.PackageName('com.opensource.svga'))
    ..a<double>(1, 'a', $pb.PbFieldType.OF)
    ..a<double>(2, 'b', $pb.PbFieldType.OF)
    ..a<double>(3, 'c', $pb.PbFieldType.OF)
    ..a<double>(4, 'd', $pb.PbFieldType.OF)
    ..a<double>(5, 'tx', $pb.PbFieldType.OF)
    ..a<double>(6, 'ty', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  Transform() : super();
  Transform.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Transform.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Transform clone() => new Transform()..mergeFromMessage(this);
  Transform copyWith(void Function(Transform) updates) => super.copyWith((message) => updates(message as Transform));
  $pb.BuilderInfo get info_ => _i;
  static Transform create() => new Transform();
  Transform createEmptyInstance() => create();
  static $pb.PbList<Transform> createRepeated() => new $pb.PbList<Transform>();
  static Transform getDefault() => _defaultInstance ??= create()..freeze();
  static Transform _defaultInstance;
  static void $checkItem(Transform v) {
    if (v is! Transform) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  double get a => $_getN(0);
  set a(double v) { $_setFloat(0, v); }
  bool hasA() => $_has(0);
  void clearA() => clearField(1);

  double get b => $_getN(1);
  set b(double v) { $_setFloat(1, v); }
  bool hasB() => $_has(1);
  void clearB() => clearField(2);

  double get c => $_getN(2);
  set c(double v) { $_setFloat(2, v); }
  bool hasC() => $_has(2);
  void clearC() => clearField(3);

  double get d => $_getN(3);
  set d(double v) { $_setFloat(3, v); }
  bool hasD() => $_has(3);
  void clearD() => clearField(4);

  double get tx => $_getN(4);
  set tx(double v) { $_setFloat(4, v); }
  bool hasTx() => $_has(4);
  void clearTx() => clearField(5);

  double get ty => $_getN(5);
  set ty(double v) { $_setFloat(5, v); }
  bool hasTy() => $_has(5);
  void clearTy() => clearField(6);
}

class ShapeEntity_ShapeArgs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ShapeEntity.ShapeArgs', package: const $pb.PackageName('com.opensource.svga'))
    ..aOS(1, 'd')
    ..hasRequiredFields = false
  ;

  ShapeEntity_ShapeArgs() : super();
  ShapeEntity_ShapeArgs.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ShapeEntity_ShapeArgs.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ShapeEntity_ShapeArgs clone() => new ShapeEntity_ShapeArgs()..mergeFromMessage(this);
  ShapeEntity_ShapeArgs copyWith(void Function(ShapeEntity_ShapeArgs) updates) => super.copyWith((message) => updates(message as ShapeEntity_ShapeArgs));
  $pb.BuilderInfo get info_ => _i;
  static ShapeEntity_ShapeArgs create() => new ShapeEntity_ShapeArgs();
  ShapeEntity_ShapeArgs createEmptyInstance() => create();
  static $pb.PbList<ShapeEntity_ShapeArgs> createRepeated() => new $pb.PbList<ShapeEntity_ShapeArgs>();
  static ShapeEntity_ShapeArgs getDefault() => _defaultInstance ??= create()..freeze();
  static ShapeEntity_ShapeArgs _defaultInstance;
  static void $checkItem(ShapeEntity_ShapeArgs v) {
    if (v is! ShapeEntity_ShapeArgs) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get d => $_getS(0, '');
  set d(String v) { $_setString(0, v); }
  bool hasD() => $_has(0);
  void clearD() => clearField(1);
}

class ShapeEntity_RectArgs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ShapeEntity.RectArgs', package: const $pb.PackageName('com.opensource.svga'))
    ..a<double>(1, 'x', $pb.PbFieldType.OF)
    ..a<double>(2, 'y', $pb.PbFieldType.OF)
    ..a<double>(3, 'width', $pb.PbFieldType.OF)
    ..a<double>(4, 'height', $pb.PbFieldType.OF)
    ..a<double>(5, 'cornerRadius', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  ShapeEntity_RectArgs() : super();
  ShapeEntity_RectArgs.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ShapeEntity_RectArgs.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ShapeEntity_RectArgs clone() => new ShapeEntity_RectArgs()..mergeFromMessage(this);
  ShapeEntity_RectArgs copyWith(void Function(ShapeEntity_RectArgs) updates) => super.copyWith((message) => updates(message as ShapeEntity_RectArgs));
  $pb.BuilderInfo get info_ => _i;
  static ShapeEntity_RectArgs create() => new ShapeEntity_RectArgs();
  ShapeEntity_RectArgs createEmptyInstance() => create();
  static $pb.PbList<ShapeEntity_RectArgs> createRepeated() => new $pb.PbList<ShapeEntity_RectArgs>();
  static ShapeEntity_RectArgs getDefault() => _defaultInstance ??= create()..freeze();
  static ShapeEntity_RectArgs _defaultInstance;
  static void $checkItem(ShapeEntity_RectArgs v) {
    if (v is! ShapeEntity_RectArgs) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  double get x => $_getN(0);
  set x(double v) { $_setFloat(0, v); }
  bool hasX() => $_has(0);
  void clearX() => clearField(1);

  double get y => $_getN(1);
  set y(double v) { $_setFloat(1, v); }
  bool hasY() => $_has(1);
  void clearY() => clearField(2);

  double get width => $_getN(2);
  set width(double v) { $_setFloat(2, v); }
  bool hasWidth() => $_has(2);
  void clearWidth() => clearField(3);

  double get height => $_getN(3);
  set height(double v) { $_setFloat(3, v); }
  bool hasHeight() => $_has(3);
  void clearHeight() => clearField(4);

  double get cornerRadius => $_getN(4);
  set cornerRadius(double v) { $_setFloat(4, v); }
  bool hasCornerRadius() => $_has(4);
  void clearCornerRadius() => clearField(5);
}

class ShapeEntity_EllipseArgs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ShapeEntity.EllipseArgs', package: const $pb.PackageName('com.opensource.svga'))
    ..a<double>(1, 'x', $pb.PbFieldType.OF)
    ..a<double>(2, 'y', $pb.PbFieldType.OF)
    ..a<double>(3, 'radiusX', $pb.PbFieldType.OF)
    ..a<double>(4, 'radiusY', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  ShapeEntity_EllipseArgs() : super();
  ShapeEntity_EllipseArgs.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ShapeEntity_EllipseArgs.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ShapeEntity_EllipseArgs clone() => new ShapeEntity_EllipseArgs()..mergeFromMessage(this);
  ShapeEntity_EllipseArgs copyWith(void Function(ShapeEntity_EllipseArgs) updates) => super.copyWith((message) => updates(message as ShapeEntity_EllipseArgs));
  $pb.BuilderInfo get info_ => _i;
  static ShapeEntity_EllipseArgs create() => new ShapeEntity_EllipseArgs();
  ShapeEntity_EllipseArgs createEmptyInstance() => create();
  static $pb.PbList<ShapeEntity_EllipseArgs> createRepeated() => new $pb.PbList<ShapeEntity_EllipseArgs>();
  static ShapeEntity_EllipseArgs getDefault() => _defaultInstance ??= create()..freeze();
  static ShapeEntity_EllipseArgs _defaultInstance;
  static void $checkItem(ShapeEntity_EllipseArgs v) {
    if (v is! ShapeEntity_EllipseArgs) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  double get x => $_getN(0);
  set x(double v) { $_setFloat(0, v); }
  bool hasX() => $_has(0);
  void clearX() => clearField(1);

  double get y => $_getN(1);
  set y(double v) { $_setFloat(1, v); }
  bool hasY() => $_has(1);
  void clearY() => clearField(2);

  double get radiusX => $_getN(2);
  set radiusX(double v) { $_setFloat(2, v); }
  bool hasRadiusX() => $_has(2);
  void clearRadiusX() => clearField(3);

  double get radiusY => $_getN(3);
  set radiusY(double v) { $_setFloat(3, v); }
  bool hasRadiusY() => $_has(3);
  void clearRadiusY() => clearField(4);
}

class ShapeEntity_ShapeStyle_RGBAColor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ShapeEntity.ShapeStyle.RGBAColor', package: const $pb.PackageName('com.opensource.svga'))
    ..a<double>(1, 'r', $pb.PbFieldType.OF)
    ..a<double>(2, 'g', $pb.PbFieldType.OF)
    ..a<double>(3, 'b', $pb.PbFieldType.OF)
    ..a<double>(4, 'a', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  ShapeEntity_ShapeStyle_RGBAColor() : super();
  ShapeEntity_ShapeStyle_RGBAColor.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ShapeEntity_ShapeStyle_RGBAColor.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ShapeEntity_ShapeStyle_RGBAColor clone() => new ShapeEntity_ShapeStyle_RGBAColor()..mergeFromMessage(this);
  ShapeEntity_ShapeStyle_RGBAColor copyWith(void Function(ShapeEntity_ShapeStyle_RGBAColor) updates) => super.copyWith((message) => updates(message as ShapeEntity_ShapeStyle_RGBAColor));
  $pb.BuilderInfo get info_ => _i;
  static ShapeEntity_ShapeStyle_RGBAColor create() => new ShapeEntity_ShapeStyle_RGBAColor();
  ShapeEntity_ShapeStyle_RGBAColor createEmptyInstance() => create();
  static $pb.PbList<ShapeEntity_ShapeStyle_RGBAColor> createRepeated() => new $pb.PbList<ShapeEntity_ShapeStyle_RGBAColor>();
  static ShapeEntity_ShapeStyle_RGBAColor getDefault() => _defaultInstance ??= create()..freeze();
  static ShapeEntity_ShapeStyle_RGBAColor _defaultInstance;
  static void $checkItem(ShapeEntity_ShapeStyle_RGBAColor v) {
    if (v is! ShapeEntity_ShapeStyle_RGBAColor) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  double get r => $_getN(0);
  set r(double v) { $_setFloat(0, v); }
  bool hasR() => $_has(0);
  void clearR() => clearField(1);

  double get g => $_getN(1);
  set g(double v) { $_setFloat(1, v); }
  bool hasG() => $_has(1);
  void clearG() => clearField(2);

  double get b => $_getN(2);
  set b(double v) { $_setFloat(2, v); }
  bool hasB() => $_has(2);
  void clearB() => clearField(3);

  double get a => $_getN(3);
  set a(double v) { $_setFloat(3, v); }
  bool hasA() => $_has(3);
  void clearA() => clearField(4);
}

class ShapeEntity_ShapeStyle extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ShapeEntity.ShapeStyle', package: const $pb.PackageName('com.opensource.svga'))
    ..a<ShapeEntity_ShapeStyle_RGBAColor>(1, 'fill', $pb.PbFieldType.OM, ShapeEntity_ShapeStyle_RGBAColor.getDefault, ShapeEntity_ShapeStyle_RGBAColor.create)
    ..a<ShapeEntity_ShapeStyle_RGBAColor>(2, 'stroke', $pb.PbFieldType.OM, ShapeEntity_ShapeStyle_RGBAColor.getDefault, ShapeEntity_ShapeStyle_RGBAColor.create)
    ..a<double>(3, 'strokeWidth', $pb.PbFieldType.OF)
    ..e<ShapeEntity_ShapeStyle_LineCap>(4, 'lineCap', $pb.PbFieldType.OE, ShapeEntity_ShapeStyle_LineCap.LineCap_BUTT, ShapeEntity_ShapeStyle_LineCap.valueOf, ShapeEntity_ShapeStyle_LineCap.values)
    ..e<ShapeEntity_ShapeStyle_LineJoin>(5, 'lineJoin', $pb.PbFieldType.OE, ShapeEntity_ShapeStyle_LineJoin.LineJoin_MITER, ShapeEntity_ShapeStyle_LineJoin.valueOf, ShapeEntity_ShapeStyle_LineJoin.values)
    ..a<double>(6, 'miterLimit', $pb.PbFieldType.OF)
    ..a<double>(7, 'lineDashI', $pb.PbFieldType.OF)
    ..a<double>(8, 'lineDashII', $pb.PbFieldType.OF)
    ..a<double>(9, 'lineDashIII', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  ShapeEntity_ShapeStyle() : super();
  ShapeEntity_ShapeStyle.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ShapeEntity_ShapeStyle.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ShapeEntity_ShapeStyle clone() => new ShapeEntity_ShapeStyle()..mergeFromMessage(this);
  ShapeEntity_ShapeStyle copyWith(void Function(ShapeEntity_ShapeStyle) updates) => super.copyWith((message) => updates(message as ShapeEntity_ShapeStyle));
  $pb.BuilderInfo get info_ => _i;
  static ShapeEntity_ShapeStyle create() => new ShapeEntity_ShapeStyle();
  ShapeEntity_ShapeStyle createEmptyInstance() => create();
  static $pb.PbList<ShapeEntity_ShapeStyle> createRepeated() => new $pb.PbList<ShapeEntity_ShapeStyle>();
  static ShapeEntity_ShapeStyle getDefault() => _defaultInstance ??= create()..freeze();
  static ShapeEntity_ShapeStyle _defaultInstance;
  static void $checkItem(ShapeEntity_ShapeStyle v) {
    if (v is! ShapeEntity_ShapeStyle) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  ShapeEntity_ShapeStyle_RGBAColor get fill => $_getN(0);
  set fill(ShapeEntity_ShapeStyle_RGBAColor v) { setField(1, v); }
  bool hasFill() => $_has(0);
  void clearFill() => clearField(1);

  ShapeEntity_ShapeStyle_RGBAColor get stroke => $_getN(1);
  set stroke(ShapeEntity_ShapeStyle_RGBAColor v) { setField(2, v); }
  bool hasStroke() => $_has(1);
  void clearStroke() => clearField(2);

  double get strokeWidth => $_getN(2);
  set strokeWidth(double v) { $_setFloat(2, v); }
  bool hasStrokeWidth() => $_has(2);
  void clearStrokeWidth() => clearField(3);

  ShapeEntity_ShapeStyle_LineCap get lineCap => $_getN(3);
  set lineCap(ShapeEntity_ShapeStyle_LineCap v) { setField(4, v); }
  bool hasLineCap() => $_has(3);
  void clearLineCap() => clearField(4);

  ShapeEntity_ShapeStyle_LineJoin get lineJoin => $_getN(4);
  set lineJoin(ShapeEntity_ShapeStyle_LineJoin v) { setField(5, v); }
  bool hasLineJoin() => $_has(4);
  void clearLineJoin() => clearField(5);

  double get miterLimit => $_getN(5);
  set miterLimit(double v) { $_setFloat(5, v); }
  bool hasMiterLimit() => $_has(5);
  void clearMiterLimit() => clearField(6);

  double get lineDashI => $_getN(6);
  set lineDashI(double v) { $_setFloat(6, v); }
  bool hasLineDashI() => $_has(6);
  void clearLineDashI() => clearField(7);

  double get lineDashII => $_getN(7);
  set lineDashII(double v) { $_setFloat(7, v); }
  bool hasLineDashII() => $_has(7);
  void clearLineDashII() => clearField(8);

  double get lineDashIII => $_getN(8);
  set lineDashIII(double v) { $_setFloat(8, v); }
  bool hasLineDashIII() => $_has(8);
  void clearLineDashIII() => clearField(9);
}

enum ShapeEntity_Args {
  shape, 
  rect, 
  ellipse, 
  notSet
}

class ShapeEntity extends $pb.GeneratedMessage {
  static const Map<int, ShapeEntity_Args> _ShapeEntity_ArgsByTag = {
    2 : ShapeEntity_Args.shape,
    3 : ShapeEntity_Args.rect,
    4 : ShapeEntity_Args.ellipse,
    0 : ShapeEntity_Args.notSet
  };
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ShapeEntity', package: const $pb.PackageName('com.opensource.svga'))
    ..e<ShapeEntity_ShapeType>(1, 'type', $pb.PbFieldType.OE, ShapeEntity_ShapeType.SHAPE, ShapeEntity_ShapeType.valueOf, ShapeEntity_ShapeType.values)
    ..a<ShapeEntity_ShapeArgs>(2, 'shape', $pb.PbFieldType.OM, ShapeEntity_ShapeArgs.getDefault, ShapeEntity_ShapeArgs.create)
    ..a<ShapeEntity_RectArgs>(3, 'rect', $pb.PbFieldType.OM, ShapeEntity_RectArgs.getDefault, ShapeEntity_RectArgs.create)
    ..a<ShapeEntity_EllipseArgs>(4, 'ellipse', $pb.PbFieldType.OM, ShapeEntity_EllipseArgs.getDefault, ShapeEntity_EllipseArgs.create)
    ..a<ShapeEntity_ShapeStyle>(10, 'styles', $pb.PbFieldType.OM, ShapeEntity_ShapeStyle.getDefault, ShapeEntity_ShapeStyle.create)
    ..a<Transform>(11, 'transform', $pb.PbFieldType.OM, Transform.getDefault, Transform.create)
    ..oo(0, [2, 3, 4])
    ..hasRequiredFields = false
  ;

  ShapeEntity() : super();
  ShapeEntity.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ShapeEntity.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ShapeEntity clone() => new ShapeEntity()..mergeFromMessage(this);
  ShapeEntity copyWith(void Function(ShapeEntity) updates) => super.copyWith((message) => updates(message as ShapeEntity));
  $pb.BuilderInfo get info_ => _i;
  static ShapeEntity create() => new ShapeEntity();
  ShapeEntity createEmptyInstance() => create();
  static $pb.PbList<ShapeEntity> createRepeated() => new $pb.PbList<ShapeEntity>();
  static ShapeEntity getDefault() => _defaultInstance ??= create()..freeze();
  static ShapeEntity _defaultInstance;
  static void $checkItem(ShapeEntity v) {
    if (v is! ShapeEntity) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  ShapeEntity_Args whichArgs() => _ShapeEntity_ArgsByTag[$_whichOneof(0)];
  void clearArgs() => clearField($_whichOneof(0));

  ShapeEntity_ShapeType get type => $_getN(0);
  set type(ShapeEntity_ShapeType v) { setField(1, v); }
  bool hasType() => $_has(0);
  void clearType() => clearField(1);

  ShapeEntity_ShapeArgs get shape => $_getN(1);
  set shape(ShapeEntity_ShapeArgs v) { setField(2, v); }
  bool hasShape() => $_has(1);
  void clearShape() => clearField(2);

  ShapeEntity_RectArgs get rect => $_getN(2);
  set rect(ShapeEntity_RectArgs v) { setField(3, v); }
  bool hasRect() => $_has(2);
  void clearRect() => clearField(3);

  ShapeEntity_EllipseArgs get ellipse => $_getN(3);
  set ellipse(ShapeEntity_EllipseArgs v) { setField(4, v); }
  bool hasEllipse() => $_has(3);
  void clearEllipse() => clearField(4);

  ShapeEntity_ShapeStyle get styles => $_getN(4);
  set styles(ShapeEntity_ShapeStyle v) { setField(10, v); }
  bool hasStyles() => $_has(4);
  void clearStyles() => clearField(10);

  Transform get transform => $_getN(5);
  set transform(Transform v) { setField(11, v); }
  bool hasTransform() => $_has(5);
  void clearTransform() => clearField(11);
}

class FrameEntity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('FrameEntity', package: const $pb.PackageName('com.opensource.svga'))
    ..a<double>(1, 'alpha', $pb.PbFieldType.OF)
    ..a<Layout>(2, 'layout', $pb.PbFieldType.OM, Layout.getDefault, Layout.create)
    ..a<Transform>(3, 'transform', $pb.PbFieldType.OM, Transform.getDefault, Transform.create)
    ..aOS(4, 'clipPath')
    ..pp<ShapeEntity>(5, 'shapes', $pb.PbFieldType.PM, ShapeEntity.$checkItem, ShapeEntity.create)
    ..hasRequiredFields = false
  ;

  FrameEntity() : super();
  FrameEntity.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  FrameEntity.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  FrameEntity clone() => new FrameEntity()..mergeFromMessage(this);
  FrameEntity copyWith(void Function(FrameEntity) updates) => super.copyWith((message) => updates(message as FrameEntity));
  $pb.BuilderInfo get info_ => _i;
  static FrameEntity create() => new FrameEntity();
  FrameEntity createEmptyInstance() => create();
  static $pb.PbList<FrameEntity> createRepeated() => new $pb.PbList<FrameEntity>();
  static FrameEntity getDefault() => _defaultInstance ??= create()..freeze();
  static FrameEntity _defaultInstance;
  static void $checkItem(FrameEntity v) {
    if (v is! FrameEntity) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  double get alpha => $_getN(0);
  set alpha(double v) { $_setFloat(0, v); }
  bool hasAlpha() => $_has(0);
  void clearAlpha() => clearField(1);

  Layout get layout => $_getN(1);
  set layout(Layout v) { setField(2, v); }
  bool hasLayout() => $_has(1);
  void clearLayout() => clearField(2);

  Transform get transform => $_getN(2);
  set transform(Transform v) { setField(3, v); }
  bool hasTransform() => $_has(2);
  void clearTransform() => clearField(3);

  String get clipPath => $_getS(3, '');
  set clipPath(String v) { $_setString(3, v); }
  bool hasClipPath() => $_has(3);
  void clearClipPath() => clearField(4);

  List<ShapeEntity> get shapes => $_getList(4);
}

class MovieEntity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('MovieEntity', package: const $pb.PackageName('com.opensource.svga'))
    ..aOS(1, 'version')
    ..a<MovieParams>(2, 'params', $pb.PbFieldType.OM, MovieParams.getDefault, MovieParams.create)
    ..m<String, List<int>>(3, 'images', 'MovieEntity.ImagesEntry',$pb.PbFieldType.OS, $pb.PbFieldType.OY, null, null, null , const $pb.PackageName('com.opensource.svga'))
    ..pp<SpriteEntity>(4, 'sprites', $pb.PbFieldType.PM, SpriteEntity.$checkItem, SpriteEntity.create)
    ..pp<AudioEntity>(5, 'audios', $pb.PbFieldType.PM, AudioEntity.$checkItem, AudioEntity.create)
    ..hasRequiredFields = false
  ;

  MovieEntity() : super();
  MovieEntity.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  MovieEntity.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  MovieEntity clone() => new MovieEntity()..mergeFromMessage(this);
  MovieEntity copyWith(void Function(MovieEntity) updates) => super.copyWith((message) => updates(message as MovieEntity));
  $pb.BuilderInfo get info_ => _i;
  static MovieEntity create() => new MovieEntity();
  MovieEntity createEmptyInstance() => create();
  static $pb.PbList<MovieEntity> createRepeated() => new $pb.PbList<MovieEntity>();
  static MovieEntity getDefault() => _defaultInstance ??= create()..freeze();
  static MovieEntity _defaultInstance;
  static void $checkItem(MovieEntity v) {
    if (v is! MovieEntity) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get version => $_getS(0, '');
  set version(String v) { $_setString(0, v); }
  bool hasVersion() => $_has(0);
  void clearVersion() => clearField(1);

  MovieParams get params => $_getN(1);
  set params(MovieParams v) { setField(2, v); }
  bool hasParams() => $_has(1);
  void clearParams() => clearField(2);

  Map<String, List<int>> get images => $_getMap(2);

  List<SpriteEntity> get sprites => $_getList(3);

  List<AudioEntity> get audios => $_getList(4);
}

