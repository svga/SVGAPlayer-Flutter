# SVGAPlayer-Flutter

## 介绍

`SVGAPlayer` 是一个轻量的动画渲染库。你可以使用[工具](https://svga.io/designer.html)从 `Adobe Animate CC` 或者 `Adobe After Effects` 中导出动画文件，然后使用 `SVGAPlayer` 在移动设备上渲染并播放。

`SVGAPlayer-Flutter` 通过 Flutter CustomPainter 原生渲染动画，为您带来高性能，低成本的动画体验。

如果你想要了解更多细节，请访问[官方网站](https://svga.io/)。

* SVGAPlayer-Flutter 只支持 2.0 版本格式.

## 用法

我们在这里介绍 `SVGAPlayer-Flutter` 的用法。想要知道如何导出动画，点击[这里](https://svga.io/designer.html)。

### 添加依赖

```
dependencies:
  svgaplayer_flutter: ^2.0.0  #latest version
```

### 放置 svga 文件

SVGAPlayer 可以从本地 `assets` 目录，或者远端服务器上加载动画文件。

### 简易用法

使用 `SVGASimpleImage` 组件进行动画渲染是最简单的。

```dart
class MyWidget extends Widget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SVGASimpleImage(
          resUrl: "https://github.com/yyued/SVGA-Samples/blob/master/angel.svga?raw=true"),
    );
  }

}
```

动画将会循环播放，如果你希望更直接地控制动画，可以使用代码方式。

### 使用代码

为了控制动画的渲染操作，你需要创建一个 `SVGAAnimationController` 实例，这和普通的 Flutter 动画并没有什么区别。将这个实例赋予 `SVGAImage`，使用 `SVGAParser` 加载并解码资源，然后使用 Controller 播放动画。

```dart
import 'package:flutter/material.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  SVGAAnimationController animationController;

  @override
  void initState() {
    this.animationController = SVGAAnimationController(vsync: this);
    this.loadAnimation();
    super.initState();
  }

  @override
  void dispose() {
    this.animationController.dispose();
    super.dispose();
  }

  void loadAnimation() async {
    final videoItem = await SVGAParser.shared.decodeFromURL(
        "https://github.com/yyued/SVGA-Samples/blob/master/angel.svga?raw=true");
    this.animationController.videoItem = videoItem;
    this
        .animationController
        .repeat() // Try to use .forward() .reverse()
        .whenComplete(() => this.animationController.videoItem = null);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SVGAImage(this.animationController),
    );
  }
}
```

### 复用 MovieEntity

`MovieEntity` 对象会在 `AnimationController` dispose 调用后，或 `AnimationController::videoItem` 赋值后，执行 `dispose` 操作。

在 dispose 以后 `MovieEntity` 不可复用。

如果你需要复用 `MovieEntity` 对象，赋值 `MovieEntity::autorelease` 为 `false` 即可。

```dart
final videoItem = await SVGAParser.shared.decodeFromURL(
        "https://github.com/yyued/SVGA-Samples/blob/master/angel.svga?raw=true");
videoItem.autorelease = false;
```

当不再需要使用资源时，你需要自行调用 `MovieEntity::dispose()` 方法。

### 缓存

动画库不会管理任何缓存，你需要使用 `dio` 等网络库自行处理。

使用 `SVGAParser.decodeFromBytes` 方法解码数据。

## 功能示例

* [使用位图替换指定元素。](https://github.com/yyued/SVGAPlayer-Flutter/wiki/Dynamic-Image)
* [在指定元素上绘制文本。](https://github.com/yyued/SVGAPlayer-Flutter/wiki/Dynamic-Text)
* [隐藏指定元素。](https://github.com/yyued/SVGAPlayer-Flutter/wiki/Dynamic-Hidden)
* [在指定元素上自由绘制。](https://github.com/yyued/SVGAPlayer-Flutter/wiki/Dynamic-Drawer)
