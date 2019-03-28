///
//  Generated code. Do not modify.
//  source: svga.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' show int, dynamic, String, List, Map;
import 'package:protobuf/protobuf.dart' as $pb;

class ShapeEntity_ShapeType extends $pb.ProtobufEnum {
  static const ShapeEntity_ShapeType SHAPE = const ShapeEntity_ShapeType._(0, 'SHAPE');
  static const ShapeEntity_ShapeType RECT = const ShapeEntity_ShapeType._(1, 'RECT');
  static const ShapeEntity_ShapeType ELLIPSE = const ShapeEntity_ShapeType._(2, 'ELLIPSE');
  static const ShapeEntity_ShapeType KEEP = const ShapeEntity_ShapeType._(3, 'KEEP');

  static const List<ShapeEntity_ShapeType> values = const <ShapeEntity_ShapeType> [
    SHAPE,
    RECT,
    ELLIPSE,
    KEEP,
  ];

  static final Map<int, ShapeEntity_ShapeType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ShapeEntity_ShapeType valueOf(int value) => _byValue[value];
  static void $checkItem(ShapeEntity_ShapeType v) {
    if (v is! ShapeEntity_ShapeType) $pb.checkItemFailed(v, 'ShapeEntity_ShapeType');
  }

  const ShapeEntity_ShapeType._(int v, String n) : super(v, n);
}

class ShapeEntity_ShapeStyle_LineCap extends $pb.ProtobufEnum {
  static const ShapeEntity_ShapeStyle_LineCap LineCap_BUTT = const ShapeEntity_ShapeStyle_LineCap._(0, 'LineCap_BUTT');
  static const ShapeEntity_ShapeStyle_LineCap LineCap_ROUND = const ShapeEntity_ShapeStyle_LineCap._(1, 'LineCap_ROUND');
  static const ShapeEntity_ShapeStyle_LineCap LineCap_SQUARE = const ShapeEntity_ShapeStyle_LineCap._(2, 'LineCap_SQUARE');

  static const List<ShapeEntity_ShapeStyle_LineCap> values = const <ShapeEntity_ShapeStyle_LineCap> [
    LineCap_BUTT,
    LineCap_ROUND,
    LineCap_SQUARE,
  ];

  static final Map<int, ShapeEntity_ShapeStyle_LineCap> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ShapeEntity_ShapeStyle_LineCap valueOf(int value) => _byValue[value];
  static void $checkItem(ShapeEntity_ShapeStyle_LineCap v) {
    if (v is! ShapeEntity_ShapeStyle_LineCap) $pb.checkItemFailed(v, 'ShapeEntity_ShapeStyle_LineCap');
  }

  const ShapeEntity_ShapeStyle_LineCap._(int v, String n) : super(v, n);
}

class ShapeEntity_ShapeStyle_LineJoin extends $pb.ProtobufEnum {
  static const ShapeEntity_ShapeStyle_LineJoin LineJoin_MITER = const ShapeEntity_ShapeStyle_LineJoin._(0, 'LineJoin_MITER');
  static const ShapeEntity_ShapeStyle_LineJoin LineJoin_ROUND = const ShapeEntity_ShapeStyle_LineJoin._(1, 'LineJoin_ROUND');
  static const ShapeEntity_ShapeStyle_LineJoin LineJoin_BEVEL = const ShapeEntity_ShapeStyle_LineJoin._(2, 'LineJoin_BEVEL');

  static const List<ShapeEntity_ShapeStyle_LineJoin> values = const <ShapeEntity_ShapeStyle_LineJoin> [
    LineJoin_MITER,
    LineJoin_ROUND,
    LineJoin_BEVEL,
  ];

  static final Map<int, ShapeEntity_ShapeStyle_LineJoin> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ShapeEntity_ShapeStyle_LineJoin valueOf(int value) => _byValue[value];
  static void $checkItem(ShapeEntity_ShapeStyle_LineJoin v) {
    if (v is! ShapeEntity_ShapeStyle_LineJoin) $pb.checkItemFailed(v, 'ShapeEntity_ShapeStyle_LineJoin');
  }

  const ShapeEntity_ShapeStyle_LineJoin._(int v, String n) : super(v, n);
}

