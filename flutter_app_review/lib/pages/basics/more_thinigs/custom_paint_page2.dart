import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPainterPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomPainterPage2();
  }
}

class _CustomPainterPage2 extends State<CustomPainterPage2>
    with TickerProviderStateMixin {
  ui.Image background;
  ui.Image maliao;
  ui.Size deviceSize;
  Point position = Point(0, 0);
  double ratio = ui.window.devicePixelRatio;

  @override
  void initState() {
    super.initState();
    deviceSize = ui.window.physicalSize / ratio;
    ImageLoader.load("images/game_bg_1.png").then((img) {
      setState(() {
        background = img;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Center(
            child: CustomPaint(
              isComplex: true,
              willChange: true,
              size: Size(deviceSize.width, deviceSize.height / 2),
              painter: MyPainter.images(background),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).padding.bottom,
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  ui.Image background;

  MyPainter.images(this.background);

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    Paint paint = Paint()
          ..isAntiAlias = true
          ..color = Colors.grey[300]
          ..strokeWidth = 3
          ..style = PaintingStyle.fill
          ..filterQuality = FilterQuality.high
          ..strokeCap = StrokeCap.round
//      ..strokeJoin = StrokeJoin.round
//      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 50)
//      ..invertColors = false
//      ..blendMode = BlendMode.color
//      ..shader = ui.Gradient.linear(
//          Offset(0, 0), Offset(100, 100), [Colors.red, Colors.blueAccent])
        ;

//    canvas.drawLine(Offset(50, 100), Offset(250, 250), paint);

//    canvas.drawPoints(
//        ui.PointMode.polygon,
//        [Offset(200, 200), Offset(250, 250), Offset(50, 200), Offset(100, 250)],
//        paint);
//    Path path = Path();
//    path.moveTo(100, 100);
//    path.lineTo(200, 200);
//    path.lineTo(250, 200);
//    path.lineTo(200, 250);
//    path.close();
//    canvas.drawPath(path, paint);
//    Rect rect1 = Rect.fromCircle(
//        center: Offset(size.width / 2, size.height / 2), radius: 140);
//    Rect rect2 = Rect.fromCircle(
//        center: Offset(size.width / 2, size.height / 2), radius: 160);
//    RRect rRect1 = RRect.fromRectAndRadius(rect1, Radius.circular(20));
//    RRect rRect2 = RRect.fromRectAndRadius(rect2, Radius.circular(20));
//    canvas.drawRRect(rRect, paint);

//    canvas.drawDRRect(rRect2, rRect1, paint);

//    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 100, paint);
//    Rect rect = Rect.fromLTRB(size.width / 2 - 100, size.height / 2 - 50,
//        size.width / 2 + 100, size.height / 2 + 50);
//    canvas.drawOval(rect, paint);
//    paint..color = Colors.blueAccent;
//    paint..style = PaintingStyle.stroke;
//    canvas.drawRect(rect, paint);

//    Rect rect = Rect.fromCircle(
//        center: Offset(size.width / 2, size.height / 2), radius: 140);
//    canvas.drawArc(rect, 0, math.pi * 2, true, paint);

//    Path path = Path()..addRect(rect.translate(20, 0));
//    canvas.drawShadow(path, Colors.amberAccent, 20, true);

//    canvas.drawRect(rect, paint);
//
//    canvas.drawColor(Colors.redAccent, BlendMode.color);
//    if (background != null) {
    Size imgSize =
        Size(background.width.toDouble(), background.height.toDouble());
    Rect dstRect = Rect.fromLTWH(0, 0, size.width, size.height);
//      // 根据适配模式，计算适合的缩放信息
//      FittedSizes fittedSizes = applyBoxFit(
//          BoxFit.cover, imgSize, dstRect.size);
//      // 获得一个图片区域中，指定大小的，居中位置处的 Rect
//      Rect inputRect = Alignment.center.inscribe(
//          fittedSizes.source, Offset.zero & imgSize);
//      // 获得一个绘制区域内，指定大小的，居中位置处的 Rect
//      Rect outputRect = Alignment.center.inscribe(
//          fittedSizes.destination, dstRect);
//      canvas.drawImageRect(background, inputRect, outputRect, paint);
//      canvas.drawImageRect(background, Rect.fromLTWH(0, 0, 100, 100), dstRect, paint);
//      canvas.save();
//      canvas.translate(Alignment.center
//          .inscribe(imgSize, Offset.zero & size)
//          .left, Alignment.center
//          .inscribe(imgSize, Offset.zero & size)
//          .top);
//      canvas.drawImage(background, Offset.zero, paint);
//      canvas.drawRect(Rect.fromLTWH(0, 0, 100, 100), paint);
//      canvas.restore();

//    canvas.drawImageNine(background, Offset.zero & imgSize, dstRect, paint);

//    canvas.saveLayer(dstRect, Paint());
//    canvas.saveLayer(dstRect, paint);
//    canvas.drawImage(background, Offset.zero, paint);
//    var paint2 = new Paint()..blendMode = BlendMode.hue
//    ..color = Colors.amber;
//    canvas.saveLayer(Rect.fromLTWH(0, 0, 100, 100), paint2);
//    canvas.drawColor(Colors.amber, BlendMode.lighten);
//    canvas.drawPaint(paint2);
//    canvas.drawRect(Rect.fromLTWH(0, 0, 50, 50), Paint()..color=Colors.white);
//    canvas.drawColor(Colors.amber, BlendMode.srcOut);
//    canvas.drawRect(Rect.fromLTWH(100, 100, 50, 50), Paint()..color=Colors.red);
//    canvas.save();
//    canvas.restore();
//    canvas.restore();
//    canvas.restore();

//    canvas.saveLayer(Rect.fromCircle(
//        center: Offset(size.width / 2, size.height / 2), radius: 100), paint);
//    // 用颜色填充整个绘制区域
//    canvas.drawPaint(Paint()..color = Colors.blue);
//    // 在绘制区域以外绘制一个矩形
//    canvas.drawRect(Rect.fromLTWH(0, 0, 100, 100), Paint()..color = Colors.red);
//    canvas.restore();

//    canvas.drawImageRect(background, Offset.zero & imgSize, Rect.fromCircle(
//        center: Offset(size.width / 2, size.height / 2), radius: 150), paint);
//
//    canvas.saveLayer(Rect.fromCircle(
//        center: Offset(size.width / 2, size.height / 2), radius: 60), Paint()..color = Colors.red);
//    canvas.drawPaint(Paint()..color = Colors.amber);
//    canvas.restore();
    canvas.drawRect(Offset.zero & size, paint);
//    canvas.save();
//    double r = sqrt(pow(size.width, 2) + pow(size.height, 2));
//    print('r = $r');
//    print('p = ${Point(r * cos(0), r * sin(0)).x}');
//    double startAngle = atan(size.height / size.width);
//    print('offsetAngle = ${startAngle}, pi/2=${pi / 2}');
//    double tAngle = pi/2;
//    Point p0 = Point(r * cos(startAngle), r * sin(startAngle));
//    print('p0 = $p0');
//    Point px = Point(r * cos(tAngle + startAngle), r * sin(tAngle + startAngle));
//    print('px = $px');
//    canvas.translate((p0.x - px.x)/2, (p0.y - px.y)/2);
//    canvas.rotate(tAngle);
//    print('p0.x - px.x = ${p0.x - px.x}, p0.y - px.y = ${p0.y - px.y}');
//    canvas.drawRect(Offset.zero & size, Paint()
//      ..color = Colors.pinkAccent);
//    canvas.drawImage(background, Offset.zero, paint);
//    canvas.restore();

//    canvas.save();
//    double r = sqrt(pow(size.width, 2) + pow(size.height, 2));
//    double startAngle = atan(size.height / size.width);
//    Point p0 = Point(r * cos(startAngle), r * sin(startAngle));
//    double xAngle = pi / 4;
//    Point px = Point(
//        r * cos(xAngle + startAngle), r * sin(xAngle + startAngle));
//    canvas.translate((p0.x - px.x) / 2, (p0.y - px.y) / 2);
//    canvas.rotate(xAngle);
//    canvas.drawRect(Rect.fromCircle(
//        center: Offset(size.width / 2, size.height / 2), radius: 100), Paint()
//      ..color = Colors.amber);
//    canvas.restore();

    canvas.save();
    canvas.skew(0.2, 0);
    canvas.drawImageRect(background, Offset.zero & imgSize,
        Alignment.center.inscribe(imgSize, Offset.zero & size), paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ImageLoader {
  static AssetBundle getAssetBundle() => (rootBundle != null)
      ? rootBundle
      : new NetworkAssetBundle(new Uri.directory(Uri.base.origin));

  static Future<ui.Image> load(String url) async {
    ImageStream stream = AssetImage(url, bundle: getAssetBundle())
        .resolve(ImageConfiguration.empty);
    Completer<ui.Image> completer = Completer<ui.Image>();
    void listener(ImageInfo frame, bool synchronousCall) {
      final ui.Image image = frame.image;
      completer.complete(image);
      stream.removeListener(ImageStreamListener(listener));
    }

    stream.addListener(ImageStreamListener(listener));
    return completer.future;
  }
}
