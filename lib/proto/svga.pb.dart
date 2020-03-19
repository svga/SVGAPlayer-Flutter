///
//  Generated code. Do not modify.
//  source: svga.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'dart:core' show int, bool, double, String, List, Map, override;
import 'dart:ui' as ui show Image, Path;

import 'package:protobuf/protobuf.dart' as $pb;

import 'svga.pbenum.dart';

export 'svga.pbenum.dart';

import '../dynamic_entity.dart';

class MovieParams extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MovieParams', package: const $pb.PackageName('com.opensource.svga'), createEmptyInstance: create)
    ..a<$core.double>(1, 'viewBoxWidth', $pb.PbFieldType.OF, protoName: 'viewBoxWidth')
    ..a<$core.double>(2, 'viewBoxHeight', $pb.PbFieldType.OF, protoName: 'viewBoxHeight')
    ..a<$core.int>(3, 'fps', $pb.PbFieldType.O3)
    ..a<$core.int>(4, 'frames', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  MovieParams._() : super();
  factory MovieParams() => create();
  factory MovieParams.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MovieParams.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  MovieParams clone() => MovieParams()..mergeFromMessage(this);
  MovieParams copyWith(void Function(MovieParams) updates) => super.copyWith((message) => updates(message as MovieParams));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MovieParams create() => MovieParams._();
  MovieParams createEmptyInstance() => create();
  static $pb.PbList<MovieParams> createRepeated() => $pb.PbList<MovieParams>();
  @$core.pragma('dart2js:noInline')
  static MovieParams getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MovieParams>(create);
  static MovieParams _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get viewBoxWidth => $_getN(0);
  @$pb.TagNumber(1)
  set viewBoxWidth($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasViewBoxWidth() => $_has(0);
  @$pb.TagNumber(1)
  void clearViewBoxWidth() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get viewBoxHeight => $_getN(1);
  @$pb.TagNumber(2)
  set viewBoxHeight($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasViewBoxHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearViewBoxHeight() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get fps => $_getIZ(2);
  @$pb.TagNumber(3)
  set fps($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFps() => $_has(2);
  @$pb.TagNumber(3)
  void clearFps() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get frames => $_getIZ(3);
  @$pb.TagNumber(4)
  set frames($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFrames() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrames() => clearField(4);
}

class SpriteEntity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('SpriteEntity', package: const $pb.PackageName('com.opensource.svga'), createEmptyInstance: create)
    ..aOS(1, 'imageKey', protoName: 'imageKey')
    ..pc<FrameEntity>(2, 'frames', $pb.PbFieldType.PM, subBuilder: FrameEntity.create)
    ..aOS(3, 'matteKey', protoName: 'matteKey')
    ..hasRequiredFields = false
  ;

  SpriteEntity._() : super();
  factory SpriteEntity() => create();
  factory SpriteEntity.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SpriteEntity.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  SpriteEntity clone() => SpriteEntity()..mergeFromMessage(this);
  SpriteEntity copyWith(void Function(SpriteEntity) updates) => super.copyWith((message) => updates(message as SpriteEntity));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SpriteEntity create() => SpriteEntity._();
  SpriteEntity createEmptyInstance() => create();
  static $pb.PbList<SpriteEntity> createRepeated() => $pb.PbList<SpriteEntity>();
  @$core.pragma('dart2js:noInline')
  static SpriteEntity getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SpriteEntity>(create);
  static SpriteEntity _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get imageKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set imageKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasImageKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearImageKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<FrameEntity> get frames => $_getList(1);

  @$pb.TagNumber(3)
  $core.String get matteKey => $_getSZ(2);
  @$pb.TagNumber(3)
  set matteKey($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMatteKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearMatteKey() => clearField(3);
}

class AudioEntity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AudioEntity', package: const $pb.PackageName('com.opensource.svga'), createEmptyInstance: create)
    ..aOS(1, 'audioKey', protoName: 'audioKey')
    ..a<$core.int>(2, 'startFrame', $pb.PbFieldType.O3, protoName: 'startFrame')
    ..a<$core.int>(3, 'endFrame', $pb.PbFieldType.O3, protoName: 'endFrame')
    ..a<$core.int>(4, 'startTime', $pb.PbFieldType.O3, protoName: 'startTime')
    ..a<$core.int>(5, 'totalTime', $pb.PbFieldType.O3, protoName: 'totalTime')
    ..hasRequiredFields = false
  ;

  AudioEntity._() : super();
  factory AudioEntity() => create();
  factory AudioEntity.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AudioEntity.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AudioEntity clone() => AudioEntity()..mergeFromMessage(this);
  AudioEntity copyWith(void Function(AudioEntity) updates) => super.copyWith((message) => updates(message as AudioEntity));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AudioEntity create() => AudioEntity._();
  AudioEntity createEmptyInstance() => create();
  static $pb.PbList<AudioEntity> createRepeated() => $pb.PbList<AudioEntity>();
  @$core.pragma('dart2js:noInline')
  static AudioEntity getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AudioEntity>(create);
  static AudioEntity _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get audioKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set audioKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAudioKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearAudioKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get startFrame => $_getIZ(1);
  @$pb.TagNumber(2)
  set startFrame($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStartFrame() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartFrame() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get endFrame => $_getIZ(2);
  @$pb.TagNumber(3)
  set endFrame($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEndFrame() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndFrame() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get startTime => $_getIZ(3);
  @$pb.TagNumber(4)
  set startTime($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStartTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get totalTime => $_getIZ(4);
  @$pb.TagNumber(5)
  set totalTime($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTotalTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalTime() => clearField(5);
}

class Layout extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Layout', package: const $pb.PackageName('com.opensource.svga'), createEmptyInstance: create)
    ..a<$core.double>(1, 'x', $pb.PbFieldType.OF)
    ..a<$core.double>(2, 'y', $pb.PbFieldType.OF)
    ..a<$core.double>(3, 'width', $pb.PbFieldType.OF)
    ..a<$core.double>(4, 'height', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  Layout._() : super();
  factory Layout() => create();
  factory Layout.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Layout.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Layout clone() => Layout()..mergeFromMessage(this);
  Layout copyWith(void Function(Layout) updates) => super.copyWith((message) => updates(message as Layout));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Layout create() => Layout._();
  Layout createEmptyInstance() => create();
  static $pb.PbList<Layout> createRepeated() => $pb.PbList<Layout>();
  @$core.pragma('dart2js:noInline')
  static Layout getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Layout>(create);
  static Layout _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get x => $_getN(0);
  @$pb.TagNumber(1)
  set x($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get y => $_getN(1);
  @$pb.TagNumber(2)
  set y($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get width => $_getN(2);
  @$pb.TagNumber(3)
  set width($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get height => $_getN(3);
  @$pb.TagNumber(4)
  set height($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => clearField(4);
}

class Transform extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Transform', package: const $pb.PackageName('com.opensource.svga'), createEmptyInstance: create)
    ..a<$core.double>(1, 'a', $pb.PbFieldType.OF)
    ..a<$core.double>(2, 'b', $pb.PbFieldType.OF)
    ..a<$core.double>(3, 'c', $pb.PbFieldType.OF)
    ..a<$core.double>(4, 'd', $pb.PbFieldType.OF)
    ..a<$core.double>(5, 'tx', $pb.PbFieldType.OF)
    ..a<$core.double>(6, 'ty', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  Transform._() : super();
  factory Transform() => create();
  factory Transform.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transform.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Transform clone() => Transform()..mergeFromMessage(this);
  Transform copyWith(void Function(Transform) updates) => super.copyWith((message) => updates(message as Transform));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Transform create() => Transform._();
  Transform createEmptyInstance() => create();
  static $pb.PbList<Transform> createRepeated() => $pb.PbList<Transform>();
  @$core.pragma('dart2js:noInline')
  static Transform getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transform>(create);
  static Transform _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get a => $_getN(0);
  @$pb.TagNumber(1)
  set a($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasA() => $_has(0);
  @$pb.TagNumber(1)
  void clearA() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get b => $_getN(1);
  @$pb.TagNumber(2)
  set b($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasB() => $_has(1);
  @$pb.TagNumber(2)
  void clearB() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get c => $_getN(2);
  @$pb.TagNumber(3)
  set c($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasC() => $_has(2);
  @$pb.TagNumber(3)
  void clearC() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get d => $_getN(3);
  @$pb.TagNumber(4)
  set d($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasD() => $_has(3);
  @$pb.TagNumber(4)
  void clearD() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get tx => $_getN(4);
  @$pb.TagNumber(5)
  set tx($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTx() => $_has(4);
  @$pb.TagNumber(5)
  void clearTx() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get ty => $_getN(5);
  @$pb.TagNumber(6)
  set ty($core.double v) { $_setFloat(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTy() => $_has(5);
  @$pb.TagNumber(6)
  void clearTy() => clearField(6);
}

class ShapeEntity_ShapeArgs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ShapeEntity.ShapeArgs', package: const $pb.PackageName('com.opensource.svga'), createEmptyInstance: create)
    ..aOS(1, 'd')
    ..hasRequiredFields = false
  ;

  ShapeEntity_ShapeArgs._() : super();
  factory ShapeEntity_ShapeArgs() => create();
  factory ShapeEntity_ShapeArgs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShapeEntity_ShapeArgs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ShapeEntity_ShapeArgs clone() => ShapeEntity_ShapeArgs()..mergeFromMessage(this);
  ShapeEntity_ShapeArgs copyWith(void Function(ShapeEntity_ShapeArgs) updates) => super.copyWith((message) => updates(message as ShapeEntity_ShapeArgs));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShapeEntity_ShapeArgs create() => ShapeEntity_ShapeArgs._();
  ShapeEntity_ShapeArgs createEmptyInstance() => create();
  static $pb.PbList<ShapeEntity_ShapeArgs> createRepeated() => $pb.PbList<ShapeEntity_ShapeArgs>();
  @$core.pragma('dart2js:noInline')
  static ShapeEntity_ShapeArgs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShapeEntity_ShapeArgs>(create);
  static ShapeEntity_ShapeArgs _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get d => $_getSZ(0);
  @$pb.TagNumber(1)
  set d($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasD() => $_has(0);
  @$pb.TagNumber(1)
  void clearD() => clearField(1);
}

class ShapeEntity_RectArgs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ShapeEntity.RectArgs', package: const $pb.PackageName('com.opensource.svga'), createEmptyInstance: create)
    ..a<$core.double>(1, 'x', $pb.PbFieldType.OF)
    ..a<$core.double>(2, 'y', $pb.PbFieldType.OF)
    ..a<$core.double>(3, 'width', $pb.PbFieldType.OF)
    ..a<$core.double>(4, 'height', $pb.PbFieldType.OF)
    ..a<$core.double>(5, 'cornerRadius', $pb.PbFieldType.OF, protoName: 'cornerRadius')
    ..hasRequiredFields = false
  ;

  ShapeEntity_RectArgs._() : super();
  factory ShapeEntity_RectArgs() => create();
  factory ShapeEntity_RectArgs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShapeEntity_RectArgs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ShapeEntity_RectArgs clone() => ShapeEntity_RectArgs()..mergeFromMessage(this);
  ShapeEntity_RectArgs copyWith(void Function(ShapeEntity_RectArgs) updates) => super.copyWith((message) => updates(message as ShapeEntity_RectArgs));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShapeEntity_RectArgs create() => ShapeEntity_RectArgs._();
  ShapeEntity_RectArgs createEmptyInstance() => create();
  static $pb.PbList<ShapeEntity_RectArgs> createRepeated() => $pb.PbList<ShapeEntity_RectArgs>();
  @$core.pragma('dart2js:noInline')
  static ShapeEntity_RectArgs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShapeEntity_RectArgs>(create);
  static ShapeEntity_RectArgs _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get x => $_getN(0);
  @$pb.TagNumber(1)
  set x($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get y => $_getN(1);
  @$pb.TagNumber(2)
  set y($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get width => $_getN(2);
  @$pb.TagNumber(3)
  set width($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get height => $_getN(3);
  @$pb.TagNumber(4)
  set height($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get cornerRadius => $_getN(4);
  @$pb.TagNumber(5)
  set cornerRadius($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCornerRadius() => $_has(4);
  @$pb.TagNumber(5)
  void clearCornerRadius() => clearField(5);
}

class ShapeEntity_EllipseArgs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ShapeEntity.EllipseArgs', package: const $pb.PackageName('com.opensource.svga'), createEmptyInstance: create)
    ..a<$core.double>(1, 'x', $pb.PbFieldType.OF)
    ..a<$core.double>(2, 'y', $pb.PbFieldType.OF)
    ..a<$core.double>(3, 'radiusX', $pb.PbFieldType.OF, protoName: 'radiusX')
    ..a<$core.double>(4, 'radiusY', $pb.PbFieldType.OF, protoName: 'radiusY')
    ..hasRequiredFields = false
  ;

  ShapeEntity_EllipseArgs._() : super();
  factory ShapeEntity_EllipseArgs() => create();
  factory ShapeEntity_EllipseArgs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShapeEntity_EllipseArgs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ShapeEntity_EllipseArgs clone() => ShapeEntity_EllipseArgs()..mergeFromMessage(this);
  ShapeEntity_EllipseArgs copyWith(void Function(ShapeEntity_EllipseArgs) updates) => super.copyWith((message) => updates(message as ShapeEntity_EllipseArgs));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShapeEntity_EllipseArgs create() => ShapeEntity_EllipseArgs._();
  ShapeEntity_EllipseArgs createEmptyInstance() => create();
  static $pb.PbList<ShapeEntity_EllipseArgs> createRepeated() => $pb.PbList<ShapeEntity_EllipseArgs>();
  @$core.pragma('dart2js:noInline')
  static ShapeEntity_EllipseArgs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShapeEntity_EllipseArgs>(create);
  static ShapeEntity_EllipseArgs _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get x => $_getN(0);
  @$pb.TagNumber(1)
  set x($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get y => $_getN(1);
  @$pb.TagNumber(2)
  set y($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get radiusX => $_getN(2);
  @$pb.TagNumber(3)
  set radiusX($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRadiusX() => $_has(2);
  @$pb.TagNumber(3)
  void clearRadiusX() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get radiusY => $_getN(3);
  @$pb.TagNumber(4)
  set radiusY($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRadiusY() => $_has(3);
  @$pb.TagNumber(4)
  void clearRadiusY() => clearField(4);
}

class ShapeEntity_ShapeStyle_RGBAColor extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ShapeEntity.ShapeStyle.RGBAColor', package: const $pb.PackageName('com.opensource.svga'), createEmptyInstance: create)
    ..a<$core.double>(1, 'r', $pb.PbFieldType.OF)
    ..a<$core.double>(2, 'g', $pb.PbFieldType.OF)
    ..a<$core.double>(3, 'b', $pb.PbFieldType.OF)
    ..a<$core.double>(4, 'a', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  ShapeEntity_ShapeStyle_RGBAColor._() : super();
  factory ShapeEntity_ShapeStyle_RGBAColor() => create();
  factory ShapeEntity_ShapeStyle_RGBAColor.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShapeEntity_ShapeStyle_RGBAColor.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ShapeEntity_ShapeStyle_RGBAColor clone() => ShapeEntity_ShapeStyle_RGBAColor()..mergeFromMessage(this);
  ShapeEntity_ShapeStyle_RGBAColor copyWith(void Function(ShapeEntity_ShapeStyle_RGBAColor) updates) => super.copyWith((message) => updates(message as ShapeEntity_ShapeStyle_RGBAColor));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShapeEntity_ShapeStyle_RGBAColor create() => ShapeEntity_ShapeStyle_RGBAColor._();
  ShapeEntity_ShapeStyle_RGBAColor createEmptyInstance() => create();
  static $pb.PbList<ShapeEntity_ShapeStyle_RGBAColor> createRepeated() => $pb.PbList<ShapeEntity_ShapeStyle_RGBAColor>();
  @$core.pragma('dart2js:noInline')
  static ShapeEntity_ShapeStyle_RGBAColor getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShapeEntity_ShapeStyle_RGBAColor>(create);
  static ShapeEntity_ShapeStyle_RGBAColor _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get r => $_getN(0);
  @$pb.TagNumber(1)
  set r($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasR() => $_has(0);
  @$pb.TagNumber(1)
  void clearR() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get g => $_getN(1);
  @$pb.TagNumber(2)
  set g($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasG() => $_has(1);
  @$pb.TagNumber(2)
  void clearG() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get b => $_getN(2);
  @$pb.TagNumber(3)
  set b($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasB() => $_has(2);
  @$pb.TagNumber(3)
  void clearB() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get a => $_getN(3);
  @$pb.TagNumber(4)
  set a($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasA() => $_has(3);
  @$pb.TagNumber(4)
  void clearA() => clearField(4);
}

class ShapeEntity_ShapeStyle extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ShapeEntity.ShapeStyle', package: const $pb.PackageName('com.opensource.svga'), createEmptyInstance: create)
    ..aOM<ShapeEntity_ShapeStyle_RGBAColor>(1, 'fill', subBuilder: ShapeEntity_ShapeStyle_RGBAColor.create)
    ..aOM<ShapeEntity_ShapeStyle_RGBAColor>(2, 'stroke', subBuilder: ShapeEntity_ShapeStyle_RGBAColor.create)
    ..a<$core.double>(3, 'strokeWidth', $pb.PbFieldType.OF, protoName: 'strokeWidth')
    ..e<ShapeEntity_ShapeStyle_LineCap>(4, 'lineCap', $pb.PbFieldType.OE, protoName: 'lineCap', defaultOrMaker: ShapeEntity_ShapeStyle_LineCap.LineCap_BUTT, valueOf: ShapeEntity_ShapeStyle_LineCap.valueOf, enumValues: ShapeEntity_ShapeStyle_LineCap.values)
    ..e<ShapeEntity_ShapeStyle_LineJoin>(5, 'lineJoin', $pb.PbFieldType.OE, protoName: 'lineJoin', defaultOrMaker: ShapeEntity_ShapeStyle_LineJoin.LineJoin_MITER, valueOf: ShapeEntity_ShapeStyle_LineJoin.valueOf, enumValues: ShapeEntity_ShapeStyle_LineJoin.values)
    ..a<$core.double>(6, 'miterLimit', $pb.PbFieldType.OF, protoName: 'miterLimit')
    ..a<$core.double>(7, 'lineDashI', $pb.PbFieldType.OF, protoName: 'lineDashI')
    ..a<$core.double>(8, 'lineDashII', $pb.PbFieldType.OF, protoName: 'lineDashII')
    ..a<$core.double>(9, 'lineDashIII', $pb.PbFieldType.OF, protoName: 'lineDashIII')
    ..hasRequiredFields = false
  ;

  ShapeEntity_ShapeStyle._() : super();
  factory ShapeEntity_ShapeStyle() => create();
  factory ShapeEntity_ShapeStyle.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShapeEntity_ShapeStyle.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ShapeEntity_ShapeStyle clone() => ShapeEntity_ShapeStyle()..mergeFromMessage(this);
  ShapeEntity_ShapeStyle copyWith(void Function(ShapeEntity_ShapeStyle) updates) => super.copyWith((message) => updates(message as ShapeEntity_ShapeStyle));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShapeEntity_ShapeStyle create() => ShapeEntity_ShapeStyle._();
  ShapeEntity_ShapeStyle createEmptyInstance() => create();
  static $pb.PbList<ShapeEntity_ShapeStyle> createRepeated() => $pb.PbList<ShapeEntity_ShapeStyle>();
  @$core.pragma('dart2js:noInline')
  static ShapeEntity_ShapeStyle getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShapeEntity_ShapeStyle>(create);
  static ShapeEntity_ShapeStyle _defaultInstance;

  @$pb.TagNumber(1)
  ShapeEntity_ShapeStyle_RGBAColor get fill => $_getN(0);
  @$pb.TagNumber(1)
  set fill(ShapeEntity_ShapeStyle_RGBAColor v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFill() => $_has(0);
  @$pb.TagNumber(1)
  void clearFill() => clearField(1);
  @$pb.TagNumber(1)
  ShapeEntity_ShapeStyle_RGBAColor ensureFill() => $_ensure(0);

  @$pb.TagNumber(2)
  ShapeEntity_ShapeStyle_RGBAColor get stroke => $_getN(1);
  @$pb.TagNumber(2)
  set stroke(ShapeEntity_ShapeStyle_RGBAColor v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStroke() => $_has(1);
  @$pb.TagNumber(2)
  void clearStroke() => clearField(2);
  @$pb.TagNumber(2)
  ShapeEntity_ShapeStyle_RGBAColor ensureStroke() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.double get strokeWidth => $_getN(2);
  @$pb.TagNumber(3)
  set strokeWidth($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStrokeWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearStrokeWidth() => clearField(3);

  @$pb.TagNumber(4)
  ShapeEntity_ShapeStyle_LineCap get lineCap => $_getN(3);
  @$pb.TagNumber(4)
  set lineCap(ShapeEntity_ShapeStyle_LineCap v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasLineCap() => $_has(3);
  @$pb.TagNumber(4)
  void clearLineCap() => clearField(4);

  @$pb.TagNumber(5)
  ShapeEntity_ShapeStyle_LineJoin get lineJoin => $_getN(4);
  @$pb.TagNumber(5)
  set lineJoin(ShapeEntity_ShapeStyle_LineJoin v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasLineJoin() => $_has(4);
  @$pb.TagNumber(5)
  void clearLineJoin() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get miterLimit => $_getN(5);
  @$pb.TagNumber(6)
  set miterLimit($core.double v) { $_setFloat(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMiterLimit() => $_has(5);
  @$pb.TagNumber(6)
  void clearMiterLimit() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get lineDashI => $_getN(6);
  @$pb.TagNumber(7)
  set lineDashI($core.double v) { $_setFloat(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLineDashI() => $_has(6);
  @$pb.TagNumber(7)
  void clearLineDashI() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get lineDashII => $_getN(7);
  @$pb.TagNumber(8)
  set lineDashII($core.double v) { $_setFloat(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLineDashII() => $_has(7);
  @$pb.TagNumber(8)
  void clearLineDashII() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get lineDashIII => $_getN(8);
  @$pb.TagNumber(9)
  set lineDashIII($core.double v) { $_setFloat(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLineDashIII() => $_has(8);
  @$pb.TagNumber(9)
  void clearLineDashIII() => clearField(9);
}

enum ShapeEntity_Args {
  shape, 
  rect, 
  ellipse, 
  notSet
}

class ShapeEntity extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ShapeEntity_Args> _ShapeEntity_ArgsByTag = {
    2 : ShapeEntity_Args.shape,
    3 : ShapeEntity_Args.rect,
    4 : ShapeEntity_Args.ellipse,
    0 : ShapeEntity_Args.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ShapeEntity', package: const $pb.PackageName('com.opensource.svga'), createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..e<ShapeEntity_ShapeType>(1, 'type', $pb.PbFieldType.OE, defaultOrMaker: ShapeEntity_ShapeType.SHAPE, valueOf: ShapeEntity_ShapeType.valueOf, enumValues: ShapeEntity_ShapeType.values)
    ..aOM<ShapeEntity_ShapeArgs>(2, 'shape', subBuilder: ShapeEntity_ShapeArgs.create)
    ..aOM<ShapeEntity_RectArgs>(3, 'rect', subBuilder: ShapeEntity_RectArgs.create)
    ..aOM<ShapeEntity_EllipseArgs>(4, 'ellipse', subBuilder: ShapeEntity_EllipseArgs.create)
    ..aOM<ShapeEntity_ShapeStyle>(10, 'styles', subBuilder: ShapeEntity_ShapeStyle.create)
    ..aOM<Transform>(11, 'transform', subBuilder: Transform.create)
    ..hasRequiredFields = false
  ;

  ShapeEntity._() : super();
  factory ShapeEntity() => create();
  factory ShapeEntity.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShapeEntity.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ShapeEntity clone() => ShapeEntity()..mergeFromMessage(this);
  ShapeEntity copyWith(void Function(ShapeEntity) updates) => super.copyWith((message) => updates(message as ShapeEntity));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShapeEntity create() => ShapeEntity._();
  ShapeEntity createEmptyInstance() => create();
  static $pb.PbList<ShapeEntity> createRepeated() => $pb.PbList<ShapeEntity>();
  @$core.pragma('dart2js:noInline')
  static ShapeEntity getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShapeEntity>(create);
  static ShapeEntity _defaultInstance;

  ShapeEntity_Args whichArgs() => _ShapeEntity_ArgsByTag[$_whichOneof(0)];
  void clearArgs() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ShapeEntity_ShapeType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(ShapeEntity_ShapeType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  ShapeEntity_ShapeArgs get shape => $_getN(1);
  @$pb.TagNumber(2)
  set shape(ShapeEntity_ShapeArgs v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasShape() => $_has(1);
  @$pb.TagNumber(2)
  void clearShape() => clearField(2);
  @$pb.TagNumber(2)
  ShapeEntity_ShapeArgs ensureShape() => $_ensure(1);

  @$pb.TagNumber(3)
  ShapeEntity_RectArgs get rect => $_getN(2);
  @$pb.TagNumber(3)
  set rect(ShapeEntity_RectArgs v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRect() => $_has(2);
  @$pb.TagNumber(3)
  void clearRect() => clearField(3);
  @$pb.TagNumber(3)
  ShapeEntity_RectArgs ensureRect() => $_ensure(2);

  @$pb.TagNumber(4)
  ShapeEntity_EllipseArgs get ellipse => $_getN(3);
  @$pb.TagNumber(4)
  set ellipse(ShapeEntity_EllipseArgs v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasEllipse() => $_has(3);
  @$pb.TagNumber(4)
  void clearEllipse() => clearField(4);
  @$pb.TagNumber(4)
  ShapeEntity_EllipseArgs ensureEllipse() => $_ensure(3);

  @$pb.TagNumber(10)
  ShapeEntity_ShapeStyle get styles => $_getN(4);
  @$pb.TagNumber(10)
  set styles(ShapeEntity_ShapeStyle v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasStyles() => $_has(4);
  @$pb.TagNumber(10)
  void clearStyles() => clearField(10);
  @$pb.TagNumber(10)
  ShapeEntity_ShapeStyle ensureStyles() => $_ensure(4);

  @$pb.TagNumber(11)
  Transform get transform => $_getN(5);
  @$pb.TagNumber(11)
  set transform(Transform v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasTransform() => $_has(5);
  @$pb.TagNumber(11)
  void clearTransform() => clearField(11);
  @$pb.TagNumber(11)
  Transform ensureTransform() => $_ensure(5);
}

class FrameEntity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('FrameEntity', package: const $pb.PackageName('com.opensource.svga'), createEmptyInstance: create)
    ..a<$core.double>(1, 'alpha', $pb.PbFieldType.OF)
    ..aOM<Layout>(2, 'layout', subBuilder: Layout.create)
    ..aOM<Transform>(3, 'transform', subBuilder: Transform.create)
    ..aOS(4, 'clipPath', protoName: 'clipPath')
    ..pc<ShapeEntity>(5, 'shapes', $pb.PbFieldType.PM, subBuilder: ShapeEntity.create)
    ..hasRequiredFields = false
  ;

  FrameEntity._() : super();
  factory FrameEntity() => create();
  factory FrameEntity.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FrameEntity.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  FrameEntity clone() => FrameEntity()..mergeFromMessage(this);
  FrameEntity copyWith(void Function(FrameEntity) updates) => super.copyWith((message) => updates(message as FrameEntity));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FrameEntity create() => FrameEntity._();
  FrameEntity createEmptyInstance() => create();
  static $pb.PbList<FrameEntity> createRepeated() => $pb.PbList<FrameEntity>();
  @$core.pragma('dart2js:noInline')
  static FrameEntity getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FrameEntity>(create);
  static FrameEntity _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get alpha => $_getN(0);
  @$pb.TagNumber(1)
  set alpha($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAlpha() => $_has(0);
  @$pb.TagNumber(1)
  void clearAlpha() => clearField(1);

  @$pb.TagNumber(2)
  Layout get layout => $_getN(1);
  @$pb.TagNumber(2)
  set layout(Layout v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLayout() => $_has(1);
  @$pb.TagNumber(2)
  void clearLayout() => clearField(2);
  @$pb.TagNumber(2)
  Layout ensureLayout() => $_ensure(1);

  @$pb.TagNumber(3)
  Transform get transform => $_getN(2);
  @$pb.TagNumber(3)
  set transform(Transform v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTransform() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransform() => clearField(3);
  @$pb.TagNumber(3)
  Transform ensureTransform() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get clipPath => $_getSZ(3);
  @$pb.TagNumber(4)
  set clipPath($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasClipPath() => $_has(3);
  @$pb.TagNumber(4)
  void clearClipPath() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<ShapeEntity> get shapes => this._shapes ?? $_getList(4);

  List<ShapeEntity> _shapes;
  set shapes(List<ShapeEntity> value) => this._shapes =value;
}

class MovieEntity extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MovieEntity', package: const $pb.PackageName('com.opensource.svga'), createEmptyInstance: create)
    ..aOS(1, 'version')
    ..aOM<MovieParams>(2, 'params', subBuilder: MovieParams.create)
    ..m<$core.String, $core.List<$core.int>>(3, 'images', entryClassName: 'MovieEntity.ImagesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OY, packageName: const $pb.PackageName('com.opensource.svga'))
    ..pc<SpriteEntity>(4, 'sprites', $pb.PbFieldType.PM, subBuilder: SpriteEntity.create)
    ..pc<AudioEntity>(5, 'audios', $pb.PbFieldType.PM, subBuilder: AudioEntity.create)
    ..hasRequiredFields = false
  ;

  MovieEntity._() : super();
  factory MovieEntity() => create();
  factory MovieEntity.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MovieEntity.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  MovieEntity clone() => MovieEntity()..mergeFromMessage(this);
  MovieEntity copyWith(void Function(MovieEntity) updates) => super.copyWith((message) => updates(message as MovieEntity));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MovieEntity create() => MovieEntity._();
  MovieEntity createEmptyInstance() => create();
  static $pb.PbList<MovieEntity> createRepeated() => $pb.PbList<MovieEntity>();
  @$core.pragma('dart2js:noInline')
  static MovieEntity getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MovieEntity>(create);
  static MovieEntity _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get version => $_getSZ(0);
  @$pb.TagNumber(1)
  set version($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  @$pb.TagNumber(2)
  MovieParams get params => $_getN(1);
  @$pb.TagNumber(2)
  set params(MovieParams v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasParams() => $_has(1);
  @$pb.TagNumber(2)
  void clearParams() => clearField(2);
  @$pb.TagNumber(2)
  MovieParams ensureParams() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.Map<$core.String, $core.List<$core.int>> get images => $_getMap(2);

  @$pb.TagNumber(4)
  $core.List<SpriteEntity> get sprites => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<AudioEntity> get audios => $_getList(4);

  SVGADynamicEntity dynamicItem = SVGADynamicEntity();
  Map<String, ui.Image> bitmapCache = {};
  Map<String, ui.Path> pathCache = {};

}

