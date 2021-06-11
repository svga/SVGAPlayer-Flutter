///
//  Generated code. Do not modify.
//  source: svga.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use movieParamsDescriptor instead')
const MovieParams$json = const {
  '1': 'MovieParams',
  '2': const [
    const {'1': 'viewBoxWidth', '3': 1, '4': 1, '5': 2, '10': 'viewBoxWidth'},
    const {'1': 'viewBoxHeight', '3': 2, '4': 1, '5': 2, '10': 'viewBoxHeight'},
    const {'1': 'fps', '3': 3, '4': 1, '5': 5, '10': 'fps'},
    const {'1': 'frames', '3': 4, '4': 1, '5': 5, '10': 'frames'},
  ],
};

/// Descriptor for `MovieParams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List movieParamsDescriptor = $convert.base64Decode(
    'CgtNb3ZpZVBhcmFtcxIiCgx2aWV3Qm94V2lkdGgYASABKAJSDHZpZXdCb3hXaWR0aBIkCg12aWV3Qm94SGVpZ2h0GAIgASgCUg12aWV3Qm94SGVpZ2h0EhAKA2ZwcxgDIAEoBVIDZnBzEhYKBmZyYW1lcxgEIAEoBVIGZnJhbWVz');
@$core.Deprecated('Use spriteEntityDescriptor instead')
const SpriteEntity$json = const {
  '1': 'SpriteEntity',
  '2': const [
    const {'1': 'imageKey', '3': 1, '4': 1, '5': 9, '10': 'imageKey'},
    const {
      '1': 'frames',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.com.opensource.svga.FrameEntity',
      '10': 'frames'
    },
    const {'1': 'matteKey', '3': 3, '4': 1, '5': 9, '10': 'matteKey'},
  ],
};

/// Descriptor for `SpriteEntity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List spriteEntityDescriptor = $convert.base64Decode(
    'CgxTcHJpdGVFbnRpdHkSGgoIaW1hZ2VLZXkYASABKAlSCGltYWdlS2V5EjgKBmZyYW1lcxgCIAMoCzIgLmNvbS5vcGVuc291cmNlLnN2Z2EuRnJhbWVFbnRpdHlSBmZyYW1lcxIaCghtYXR0ZUtleRgDIAEoCVIIbWF0dGVLZXk=');
@$core.Deprecated('Use audioEntityDescriptor instead')
const AudioEntity$json = const {
  '1': 'AudioEntity',
  '2': const [
    const {'1': 'audioKey', '3': 1, '4': 1, '5': 9, '10': 'audioKey'},
    const {'1': 'startFrame', '3': 2, '4': 1, '5': 5, '10': 'startFrame'},
    const {'1': 'endFrame', '3': 3, '4': 1, '5': 5, '10': 'endFrame'},
    const {'1': 'startTime', '3': 4, '4': 1, '5': 5, '10': 'startTime'},
    const {'1': 'totalTime', '3': 5, '4': 1, '5': 5, '10': 'totalTime'},
  ],
};

/// Descriptor for `AudioEntity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List audioEntityDescriptor = $convert.base64Decode(
    'CgtBdWRpb0VudGl0eRIaCghhdWRpb0tleRgBIAEoCVIIYXVkaW9LZXkSHgoKc3RhcnRGcmFtZRgCIAEoBVIKc3RhcnRGcmFtZRIaCghlbmRGcmFtZRgDIAEoBVIIZW5kRnJhbWUSHAoJc3RhcnRUaW1lGAQgASgFUglzdGFydFRpbWUSHAoJdG90YWxUaW1lGAUgASgFUgl0b3RhbFRpbWU=');
@$core.Deprecated('Use layoutDescriptor instead')
const Layout$json = const {
  '1': 'Layout',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 2, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 2, '10': 'y'},
    const {'1': 'width', '3': 3, '4': 1, '5': 2, '10': 'width'},
    const {'1': 'height', '3': 4, '4': 1, '5': 2, '10': 'height'},
  ],
};

/// Descriptor for `Layout`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List layoutDescriptor = $convert.base64Decode(
    'CgZMYXlvdXQSDAoBeBgBIAEoAlIBeBIMCgF5GAIgASgCUgF5EhQKBXdpZHRoGAMgASgCUgV3aWR0aBIWCgZoZWlnaHQYBCABKAJSBmhlaWdodA==');
@$core.Deprecated('Use transformDescriptor instead')
const Transform$json = const {
  '1': 'Transform',
  '2': const [
    const {'1': 'a', '3': 1, '4': 1, '5': 2, '10': 'a'},
    const {'1': 'b', '3': 2, '4': 1, '5': 2, '10': 'b'},
    const {'1': 'c', '3': 3, '4': 1, '5': 2, '10': 'c'},
    const {'1': 'd', '3': 4, '4': 1, '5': 2, '10': 'd'},
    const {'1': 'tx', '3': 5, '4': 1, '5': 2, '10': 'tx'},
    const {'1': 'ty', '3': 6, '4': 1, '5': 2, '10': 'ty'},
  ],
};

/// Descriptor for `Transform`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transformDescriptor = $convert.base64Decode(
    'CglUcmFuc2Zvcm0SDAoBYRgBIAEoAlIBYRIMCgFiGAIgASgCUgFiEgwKAWMYAyABKAJSAWMSDAoBZBgEIAEoAlIBZBIOCgJ0eBgFIAEoAlICdHgSDgoCdHkYBiABKAJSAnR5');
@$core.Deprecated('Use shapeEntityDescriptor instead')
const ShapeEntity$json = const {
  '1': 'ShapeEntity',
  '2': const [
    const {
      '1': 'type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.com.opensource.svga.ShapeEntity.ShapeType',
      '10': 'type'
    },
    const {
      '1': 'shape',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.com.opensource.svga.ShapeEntity.ShapeArgs',
      '9': 0,
      '10': 'shape'
    },
    const {
      '1': 'rect',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.com.opensource.svga.ShapeEntity.RectArgs',
      '9': 0,
      '10': 'rect'
    },
    const {
      '1': 'ellipse',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.com.opensource.svga.ShapeEntity.EllipseArgs',
      '9': 0,
      '10': 'ellipse'
    },
    const {
      '1': 'styles',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.com.opensource.svga.ShapeEntity.ShapeStyle',
      '10': 'styles'
    },
    const {
      '1': 'transform',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.com.opensource.svga.Transform',
      '10': 'transform'
    },
  ],
  '3': const [
    ShapeEntity_ShapeArgs$json,
    ShapeEntity_RectArgs$json,
    ShapeEntity_EllipseArgs$json,
    ShapeEntity_ShapeStyle$json
  ],
  '4': const [ShapeEntity_ShapeType$json],
  '8': const [
    const {'1': 'args'},
  ],
};

@$core.Deprecated('Use shapeEntityDescriptor instead')
const ShapeEntity_ShapeArgs$json = const {
  '1': 'ShapeArgs',
  '2': const [
    const {'1': 'd', '3': 1, '4': 1, '5': 9, '10': 'd'},
  ],
};

@$core.Deprecated('Use shapeEntityDescriptor instead')
const ShapeEntity_RectArgs$json = const {
  '1': 'RectArgs',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 2, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 2, '10': 'y'},
    const {'1': 'width', '3': 3, '4': 1, '5': 2, '10': 'width'},
    const {'1': 'height', '3': 4, '4': 1, '5': 2, '10': 'height'},
    const {'1': 'cornerRadius', '3': 5, '4': 1, '5': 2, '10': 'cornerRadius'},
  ],
};

@$core.Deprecated('Use shapeEntityDescriptor instead')
const ShapeEntity_EllipseArgs$json = const {
  '1': 'EllipseArgs',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 2, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 2, '10': 'y'},
    const {'1': 'radiusX', '3': 3, '4': 1, '5': 2, '10': 'radiusX'},
    const {'1': 'radiusY', '3': 4, '4': 1, '5': 2, '10': 'radiusY'},
  ],
};

@$core.Deprecated('Use shapeEntityDescriptor instead')
const ShapeEntity_ShapeStyle$json = const {
  '1': 'ShapeStyle',
  '2': const [
    const {
      '1': 'fill',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.com.opensource.svga.ShapeEntity.ShapeStyle.RGBAColor',
      '10': 'fill'
    },
    const {
      '1': 'stroke',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.com.opensource.svga.ShapeEntity.ShapeStyle.RGBAColor',
      '10': 'stroke'
    },
    const {'1': 'strokeWidth', '3': 3, '4': 1, '5': 2, '10': 'strokeWidth'},
    const {
      '1': 'lineCap',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.com.opensource.svga.ShapeEntity.ShapeStyle.LineCap',
      '10': 'lineCap'
    },
    const {
      '1': 'lineJoin',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.com.opensource.svga.ShapeEntity.ShapeStyle.LineJoin',
      '10': 'lineJoin'
    },
    const {'1': 'miterLimit', '3': 6, '4': 1, '5': 2, '10': 'miterLimit'},
    const {'1': 'lineDashI', '3': 7, '4': 1, '5': 2, '10': 'lineDashI'},
    const {'1': 'lineDashII', '3': 8, '4': 1, '5': 2, '10': 'lineDashII'},
    const {'1': 'lineDashIII', '3': 9, '4': 1, '5': 2, '10': 'lineDashIII'},
  ],
  '3': const [ShapeEntity_ShapeStyle_RGBAColor$json],
  '4': const [
    ShapeEntity_ShapeStyle_LineCap$json,
    ShapeEntity_ShapeStyle_LineJoin$json
  ],
};

@$core.Deprecated('Use shapeEntityDescriptor instead')
const ShapeEntity_ShapeStyle_RGBAColor$json = const {
  '1': 'RGBAColor',
  '2': const [
    const {'1': 'r', '3': 1, '4': 1, '5': 2, '10': 'r'},
    const {'1': 'g', '3': 2, '4': 1, '5': 2, '10': 'g'},
    const {'1': 'b', '3': 3, '4': 1, '5': 2, '10': 'b'},
    const {'1': 'a', '3': 4, '4': 1, '5': 2, '10': 'a'},
  ],
};

@$core.Deprecated('Use shapeEntityDescriptor instead')
const ShapeEntity_ShapeStyle_LineCap$json = const {
  '1': 'LineCap',
  '2': const [
    const {'1': 'LineCap_BUTT', '2': 0},
    const {'1': 'LineCap_ROUND', '2': 1},
    const {'1': 'LineCap_SQUARE', '2': 2},
  ],
};

@$core.Deprecated('Use shapeEntityDescriptor instead')
const ShapeEntity_ShapeStyle_LineJoin$json = const {
  '1': 'LineJoin',
  '2': const [
    const {'1': 'LineJoin_MITER', '2': 0},
    const {'1': 'LineJoin_ROUND', '2': 1},
    const {'1': 'LineJoin_BEVEL', '2': 2},
  ],
};

@$core.Deprecated('Use shapeEntityDescriptor instead')
const ShapeEntity_ShapeType$json = const {
  '1': 'ShapeType',
  '2': const [
    const {'1': 'SHAPE', '2': 0},
    const {'1': 'RECT', '2': 1},
    const {'1': 'ELLIPSE', '2': 2},
    const {'1': 'KEEP', '2': 3},
  ],
};

/// Descriptor for `ShapeEntity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shapeEntityDescriptor = $convert.base64Decode(
    'CgtTaGFwZUVudGl0eRI+CgR0eXBlGAEgASgOMiouY29tLm9wZW5zb3VyY2Uuc3ZnYS5TaGFwZUVudGl0eS5TaGFwZVR5cGVSBHR5cGUSQgoFc2hhcGUYAiABKAsyKi5jb20ub3BlbnNvdXJjZS5zdmdhLlNoYXBlRW50aXR5LlNoYXBlQXJnc0gAUgVzaGFwZRI/CgRyZWN0GAMgASgLMikuY29tLm9wZW5zb3VyY2Uuc3ZnYS5TaGFwZUVudGl0eS5SZWN0QXJnc0gAUgRyZWN0EkgKB2VsbGlwc2UYBCABKAsyLC5jb20ub3BlbnNvdXJjZS5zdmdhLlNoYXBlRW50aXR5LkVsbGlwc2VBcmdzSABSB2VsbGlwc2USQwoGc3R5bGVzGAogASgLMisuY29tLm9wZW5zb3VyY2Uuc3ZnYS5TaGFwZUVudGl0eS5TaGFwZVN0eWxlUgZzdHlsZXMSPAoJdHJhbnNmb3JtGAsgASgLMh4uY29tLm9wZW5zb3VyY2Uuc3ZnYS5UcmFuc2Zvcm1SCXRyYW5zZm9ybRoZCglTaGFwZUFyZ3MSDAoBZBgBIAEoCVIBZBp4CghSZWN0QXJncxIMCgF4GAEgASgCUgF4EgwKAXkYAiABKAJSAXkSFAoFd2lkdGgYAyABKAJSBXdpZHRoEhYKBmhlaWdodBgEIAEoAlIGaGVpZ2h0EiIKDGNvcm5lclJhZGl1cxgFIAEoAlIMY29ybmVyUmFkaXVzGl0KC0VsbGlwc2VBcmdzEgwKAXgYASABKAJSAXgSDAoBeRgCIAEoAlIBeRIYCgdyYWRpdXNYGAMgASgCUgdyYWRpdXNYEhgKB3JhZGl1c1kYBCABKAJSB3JhZGl1c1kaugUKClNoYXBlU3R5bGUSSQoEZmlsbBgBIAEoCzI1LmNvbS5vcGVuc291cmNlLnN2Z2EuU2hhcGVFbnRpdHkuU2hhcGVTdHlsZS5SR0JBQ29sb3JSBGZpbGwSTQoGc3Ryb2tlGAIgASgLMjUuY29tLm9wZW5zb3VyY2Uuc3ZnYS5TaGFwZUVudGl0eS5TaGFwZVN0eWxlLlJHQkFDb2xvclIGc3Ryb2tlEiAKC3N0cm9rZVdpZHRoGAMgASgCUgtzdHJva2VXaWR0aBJNCgdsaW5lQ2FwGAQgASgOMjMuY29tLm9wZW5zb3VyY2Uuc3ZnYS5TaGFwZUVudGl0eS5TaGFwZVN0eWxlLkxpbmVDYXBSB2xpbmVDYXASUAoIbGluZUpvaW4YBSABKA4yNC5jb20ub3BlbnNvdXJjZS5zdmdhLlNoYXBlRW50aXR5LlNoYXBlU3R5bGUuTGluZUpvaW5SCGxpbmVKb2luEh4KCm1pdGVyTGltaXQYBiABKAJSCm1pdGVyTGltaXQSHAoJbGluZURhc2hJGAcgASgCUglsaW5lRGFzaEkSHgoKbGluZURhc2hJSRgIIAEoAlIKbGluZURhc2hJSRIgCgtsaW5lRGFzaElJSRgJIAEoAlILbGluZURhc2hJSUkaQwoJUkdCQUNvbG9yEgwKAXIYASABKAJSAXISDAoBZxgCIAEoAlIBZxIMCgFiGAMgASgCUgFiEgwKAWEYBCABKAJSAWEiQgoHTGluZUNhcBIQCgxMaW5lQ2FwX0JVVFQQABIRCg1MaW5lQ2FwX1JPVU5EEAESEgoOTGluZUNhcF9TUVVBUkUQAiJGCghMaW5lSm9pbhISCg5MaW5lSm9pbl9NSVRFUhAAEhIKDkxpbmVKb2luX1JPVU5EEAESEgoOTGluZUpvaW5fQkVWRUwQAiI3CglTaGFwZVR5cGUSCQoFU0hBUEUQABIICgRSRUNUEAESCwoHRUxMSVBTRRACEggKBEtFRVAQA0IGCgRhcmdz');
@$core.Deprecated('Use frameEntityDescriptor instead')
const FrameEntity$json = const {
  '1': 'FrameEntity',
  '2': const [
    const {'1': 'alpha', '3': 1, '4': 1, '5': 2, '10': 'alpha'},
    const {
      '1': 'layout',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.com.opensource.svga.Layout',
      '10': 'layout'
    },
    const {
      '1': 'transform',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.com.opensource.svga.Transform',
      '10': 'transform'
    },
    const {'1': 'clipPath', '3': 4, '4': 1, '5': 9, '10': 'clipPath'},
    const {
      '1': 'shapes',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.com.opensource.svga.ShapeEntity',
      '10': 'shapes'
    },
  ],
};

/// Descriptor for `FrameEntity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List frameEntityDescriptor = $convert.base64Decode(
    'CgtGcmFtZUVudGl0eRIUCgVhbHBoYRgBIAEoAlIFYWxwaGESMwoGbGF5b3V0GAIgASgLMhsuY29tLm9wZW5zb3VyY2Uuc3ZnYS5MYXlvdXRSBmxheW91dBI8Cgl0cmFuc2Zvcm0YAyABKAsyHi5jb20ub3BlbnNvdXJjZS5zdmdhLlRyYW5zZm9ybVIJdHJhbnNmb3JtEhoKCGNsaXBQYXRoGAQgASgJUghjbGlwUGF0aBI4CgZzaGFwZXMYBSADKAsyIC5jb20ub3BlbnNvdXJjZS5zdmdhLlNoYXBlRW50aXR5UgZzaGFwZXM=');
@$core.Deprecated('Use movieEntityDescriptor instead')
const MovieEntity$json = const {
  '1': 'MovieEntity',
  '2': const [
    const {'1': 'version', '3': 1, '4': 1, '5': 9, '10': 'version'},
    const {
      '1': 'params',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.com.opensource.svga.MovieParams',
      '10': 'params'
    },
    const {
      '1': 'images',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.com.opensource.svga.MovieEntity.ImagesEntry',
      '10': 'images'
    },
    const {
      '1': 'sprites',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.com.opensource.svga.SpriteEntity',
      '10': 'sprites'
    },
    const {
      '1': 'audios',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.com.opensource.svga.AudioEntity',
      '10': 'audios'
    },
  ],
  '3': const [MovieEntity_ImagesEntry$json],
};

@$core.Deprecated('Use movieEntityDescriptor instead')
const MovieEntity_ImagesEntry$json = const {
  '1': 'ImagesEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `MovieEntity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List movieEntityDescriptor = $convert.base64Decode(
    'CgtNb3ZpZUVudGl0eRIYCgd2ZXJzaW9uGAEgASgJUgd2ZXJzaW9uEjgKBnBhcmFtcxgCIAEoCzIgLmNvbS5vcGVuc291cmNlLnN2Z2EuTW92aWVQYXJhbXNSBnBhcmFtcxJECgZpbWFnZXMYAyADKAsyLC5jb20ub3BlbnNvdXJjZS5zdmdhLk1vdmllRW50aXR5LkltYWdlc0VudHJ5UgZpbWFnZXMSOwoHc3ByaXRlcxgEIAMoCzIhLmNvbS5vcGVuc291cmNlLnN2Z2EuU3ByaXRlRW50aXR5UgdzcHJpdGVzEjgKBmF1ZGlvcxgFIAMoCzIgLmNvbS5vcGVuc291cmNlLnN2Z2EuQXVkaW9FbnRpdHlSBmF1ZGlvcxo5CgtJbWFnZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoDFIFdmFsdWU6AjgB');
