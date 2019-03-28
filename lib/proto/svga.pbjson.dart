///
//  Generated code. Do not modify.
//  source: svga.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

const MovieParams$json = const {
  '1': 'MovieParams',
  '2': const [
    const {'1': 'viewBoxWidth', '3': 1, '4': 1, '5': 2, '10': 'viewBoxWidth'},
    const {'1': 'viewBoxHeight', '3': 2, '4': 1, '5': 2, '10': 'viewBoxHeight'},
    const {'1': 'fps', '3': 3, '4': 1, '5': 5, '10': 'fps'},
    const {'1': 'frames', '3': 4, '4': 1, '5': 5, '10': 'frames'},
  ],
};

const SpriteEntity$json = const {
  '1': 'SpriteEntity',
  '2': const [
    const {'1': 'imageKey', '3': 1, '4': 1, '5': 9, '10': 'imageKey'},
    const {'1': 'frames', '3': 2, '4': 3, '5': 11, '6': '.com.opensource.svga.FrameEntity', '10': 'frames'},
  ],
};

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

const Layout$json = const {
  '1': 'Layout',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 2, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 2, '10': 'y'},
    const {'1': 'width', '3': 3, '4': 1, '5': 2, '10': 'width'},
    const {'1': 'height', '3': 4, '4': 1, '5': 2, '10': 'height'},
  ],
};

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

const ShapeEntity$json = const {
  '1': 'ShapeEntity',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.com.opensource.svga.ShapeEntity.ShapeType', '10': 'type'},
    const {'1': 'shape', '3': 2, '4': 1, '5': 11, '6': '.com.opensource.svga.ShapeEntity.ShapeArgs', '9': 0, '10': 'shape'},
    const {'1': 'rect', '3': 3, '4': 1, '5': 11, '6': '.com.opensource.svga.ShapeEntity.RectArgs', '9': 0, '10': 'rect'},
    const {'1': 'ellipse', '3': 4, '4': 1, '5': 11, '6': '.com.opensource.svga.ShapeEntity.EllipseArgs', '9': 0, '10': 'ellipse'},
    const {'1': 'styles', '3': 10, '4': 1, '5': 11, '6': '.com.opensource.svga.ShapeEntity.ShapeStyle', '10': 'styles'},
    const {'1': 'transform', '3': 11, '4': 1, '5': 11, '6': '.com.opensource.svga.Transform', '10': 'transform'},
  ],
  '3': const [ShapeEntity_ShapeArgs$json, ShapeEntity_RectArgs$json, ShapeEntity_EllipseArgs$json, ShapeEntity_ShapeStyle$json],
  '4': const [ShapeEntity_ShapeType$json],
  '8': const [
    const {'1': 'args'},
  ],
};

const ShapeEntity_ShapeArgs$json = const {
  '1': 'ShapeArgs',
  '2': const [
    const {'1': 'd', '3': 1, '4': 1, '5': 9, '10': 'd'},
  ],
};

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

const ShapeEntity_EllipseArgs$json = const {
  '1': 'EllipseArgs',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 2, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 2, '10': 'y'},
    const {'1': 'radiusX', '3': 3, '4': 1, '5': 2, '10': 'radiusX'},
    const {'1': 'radiusY', '3': 4, '4': 1, '5': 2, '10': 'radiusY'},
  ],
};

const ShapeEntity_ShapeStyle$json = const {
  '1': 'ShapeStyle',
  '2': const [
    const {'1': 'fill', '3': 1, '4': 1, '5': 11, '6': '.com.opensource.svga.ShapeEntity.ShapeStyle.RGBAColor', '10': 'fill'},
    const {'1': 'stroke', '3': 2, '4': 1, '5': 11, '6': '.com.opensource.svga.ShapeEntity.ShapeStyle.RGBAColor', '10': 'stroke'},
    const {'1': 'strokeWidth', '3': 3, '4': 1, '5': 2, '10': 'strokeWidth'},
    const {'1': 'lineCap', '3': 4, '4': 1, '5': 14, '6': '.com.opensource.svga.ShapeEntity.ShapeStyle.LineCap', '10': 'lineCap'},
    const {'1': 'lineJoin', '3': 5, '4': 1, '5': 14, '6': '.com.opensource.svga.ShapeEntity.ShapeStyle.LineJoin', '10': 'lineJoin'},
    const {'1': 'miterLimit', '3': 6, '4': 1, '5': 2, '10': 'miterLimit'},
    const {'1': 'lineDashI', '3': 7, '4': 1, '5': 2, '10': 'lineDashI'},
    const {'1': 'lineDashII', '3': 8, '4': 1, '5': 2, '10': 'lineDashII'},
    const {'1': 'lineDashIII', '3': 9, '4': 1, '5': 2, '10': 'lineDashIII'},
  ],
  '3': const [ShapeEntity_ShapeStyle_RGBAColor$json],
  '4': const [ShapeEntity_ShapeStyle_LineCap$json, ShapeEntity_ShapeStyle_LineJoin$json],
};

const ShapeEntity_ShapeStyle_RGBAColor$json = const {
  '1': 'RGBAColor',
  '2': const [
    const {'1': 'r', '3': 1, '4': 1, '5': 2, '10': 'r'},
    const {'1': 'g', '3': 2, '4': 1, '5': 2, '10': 'g'},
    const {'1': 'b', '3': 3, '4': 1, '5': 2, '10': 'b'},
    const {'1': 'a', '3': 4, '4': 1, '5': 2, '10': 'a'},
  ],
};

const ShapeEntity_ShapeStyle_LineCap$json = const {
  '1': 'LineCap',
  '2': const [
    const {'1': 'LineCap_BUTT', '2': 0},
    const {'1': 'LineCap_ROUND', '2': 1},
    const {'1': 'LineCap_SQUARE', '2': 2},
  ],
};

const ShapeEntity_ShapeStyle_LineJoin$json = const {
  '1': 'LineJoin',
  '2': const [
    const {'1': 'LineJoin_MITER', '2': 0},
    const {'1': 'LineJoin_ROUND', '2': 1},
    const {'1': 'LineJoin_BEVEL', '2': 2},
  ],
};

const ShapeEntity_ShapeType$json = const {
  '1': 'ShapeType',
  '2': const [
    const {'1': 'SHAPE', '2': 0},
    const {'1': 'RECT', '2': 1},
    const {'1': 'ELLIPSE', '2': 2},
    const {'1': 'KEEP', '2': 3},
  ],
};

const FrameEntity$json = const {
  '1': 'FrameEntity',
  '2': const [
    const {'1': 'alpha', '3': 1, '4': 1, '5': 2, '10': 'alpha'},
    const {'1': 'layout', '3': 2, '4': 1, '5': 11, '6': '.com.opensource.svga.Layout', '10': 'layout'},
    const {'1': 'transform', '3': 3, '4': 1, '5': 11, '6': '.com.opensource.svga.Transform', '10': 'transform'},
    const {'1': 'clipPath', '3': 4, '4': 1, '5': 9, '10': 'clipPath'},
    const {'1': 'shapes', '3': 5, '4': 3, '5': 11, '6': '.com.opensource.svga.ShapeEntity', '10': 'shapes'},
  ],
};

const MovieEntity$json = const {
  '1': 'MovieEntity',
  '2': const [
    const {'1': 'version', '3': 1, '4': 1, '5': 9, '10': 'version'},
    const {'1': 'params', '3': 2, '4': 1, '5': 11, '6': '.com.opensource.svga.MovieParams', '10': 'params'},
    const {'1': 'images', '3': 3, '4': 3, '5': 11, '6': '.com.opensource.svga.MovieEntity.ImagesEntry', '10': 'images'},
    const {'1': 'sprites', '3': 4, '4': 3, '5': 11, '6': '.com.opensource.svga.SpriteEntity', '10': 'sprites'},
    const {'1': 'audios', '3': 5, '4': 3, '5': 11, '6': '.com.opensource.svga.AudioEntity', '10': 'audios'},
  ],
  '3': const [MovieEntity_ImagesEntry$json],
};

const MovieEntity_ImagesEntry$json = const {
  '1': 'ImagesEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
  '7': const {'7': true},
};

