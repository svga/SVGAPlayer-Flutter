///
//  Generated code. Do not modify.
//  source: svga.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ShapeEntity_ShapeType extends $pb.ProtobufEnum {
  static const ShapeEntity_ShapeType SHAPE = ShapeEntity_ShapeType._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'SHAPE');
  static const ShapeEntity_ShapeType RECT = ShapeEntity_ShapeType._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'RECT');
  static const ShapeEntity_ShapeType ELLIPSE = ShapeEntity_ShapeType._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'ELLIPSE');
  static const ShapeEntity_ShapeType KEEP = ShapeEntity_ShapeType._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'KEEP');

  static const $core.List<ShapeEntity_ShapeType> values =
      <ShapeEntity_ShapeType>[
    SHAPE,
    RECT,
    ELLIPSE,
    KEEP,
  ];

  static final $core.Map<$core.int, ShapeEntity_ShapeType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ShapeEntity_ShapeType? valueOf($core.int value) => _byValue[value];

  const ShapeEntity_ShapeType._($core.int v, $core.String n) : super(v, n);
}

class ShapeEntity_ShapeStyle_LineCap extends $pb.ProtobufEnum {
  static const ShapeEntity_ShapeStyle_LineCap LineCap_BUTT =
      ShapeEntity_ShapeStyle_LineCap._(
          0,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'LineCap_BUTT');
  static const ShapeEntity_ShapeStyle_LineCap LineCap_ROUND =
      ShapeEntity_ShapeStyle_LineCap._(
          1,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'LineCap_ROUND');
  static const ShapeEntity_ShapeStyle_LineCap LineCap_SQUARE =
      ShapeEntity_ShapeStyle_LineCap._(
          2,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'LineCap_SQUARE');

  static const $core.List<ShapeEntity_ShapeStyle_LineCap> values =
      <ShapeEntity_ShapeStyle_LineCap>[
    LineCap_BUTT,
    LineCap_ROUND,
    LineCap_SQUARE,
  ];

  static final $core.Map<$core.int, ShapeEntity_ShapeStyle_LineCap> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ShapeEntity_ShapeStyle_LineCap? valueOf($core.int value) =>
      _byValue[value];

  const ShapeEntity_ShapeStyle_LineCap._($core.int v, $core.String n)
      : super(v, n);
}

class ShapeEntity_ShapeStyle_LineJoin extends $pb.ProtobufEnum {
  static const ShapeEntity_ShapeStyle_LineJoin LineJoin_MITER =
      ShapeEntity_ShapeStyle_LineJoin._(
          0,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'LineJoin_MITER');
  static const ShapeEntity_ShapeStyle_LineJoin LineJoin_ROUND =
      ShapeEntity_ShapeStyle_LineJoin._(
          1,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'LineJoin_ROUND');
  static const ShapeEntity_ShapeStyle_LineJoin LineJoin_BEVEL =
      ShapeEntity_ShapeStyle_LineJoin._(
          2,
          const $core.bool.fromEnvironment('protobuf.omit_enum_names')
              ? ''
              : 'LineJoin_BEVEL');

  static const $core.List<ShapeEntity_ShapeStyle_LineJoin> values =
      <ShapeEntity_ShapeStyle_LineJoin>[
    LineJoin_MITER,
    LineJoin_ROUND,
    LineJoin_BEVEL,
  ];

  static final $core.Map<$core.int, ShapeEntity_ShapeStyle_LineJoin> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ShapeEntity_ShapeStyle_LineJoin? valueOf($core.int value) =>
      _byValue[value];

  const ShapeEntity_ShapeStyle_LineJoin._($core.int v, $core.String n)
      : super(v, n);
}
