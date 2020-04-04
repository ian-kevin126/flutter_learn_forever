import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPainterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomPainterPage();
  }
}

class _CustomPainterPage extends State<CustomPainterPage>
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
    Future.wait([
      ImageLoader.load("images/game_bg_1.png").then((img) {
        return img;
      }),
      ImageLoader.load("images/maliao_1.png").then((img) {
        return img;
      }),
    ]).then((images) {
      setState(() {
        this.background = images[0];
        this.maliao = images[1];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              onTap();
            },
            child: CustomPaint(
              isComplex: true,
              willChange: true,
              size: Size(deviceSize.width, deviceSize.height),
              painter: GamePainter(background, maliao, position),
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

  onTap() {
    var controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    var anim = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    anim.addListener(() {
      setState(() {
        var x = anim.value * (deviceSize.width * 0.5);
        var y = anim.value * (deviceSize.height * 0.7);
        position = Point(x, y);
      });
    });
    controller.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        controller.dispose();
        Timer(Duration(milliseconds: 1000), () {
          setState(() {
            position = Point(0, 0);
          });
        });
      }
    });
    controller.forward();
  }
}

class GamePainter extends CustomPainter {
  ui.Image background;
  ui.Image maliao;

  ui.Size screenSize = ui.window.physicalSize;

  Point position;

  GamePainter(this.background, this.maliao, this.position);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      // 开启抗锯齿
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
    ..maskFilter = MaskFilter.blur(BlurStyle.inner, 500)
    ;
    // 画背景
    Rect backgroundPaintArea = Offset(0, 0) & Size(size.width, size.height);
    Rect backgroundImageArea = Offset(0, 0) &
        Size(background.width.toDouble(), background.height.toDouble());
    if (background != null) {
      canvas.drawImageRect(
          background, backgroundImageArea, backgroundPaintArea, paint);
    }
    // 画马里奥
    var maliaoRealWidth = size.width / 6;
    var maliaoRealHeight = size.height / 10;
    Rect maliaoPaintArea =
        Offset(0, 0) & Size(maliaoRealWidth, maliaoRealHeight);
    Rect maliaoImageArea =
        Offset(0, 0) & Size(maliao.width.toDouble(), maliao.height.toDouble());
    canvas.save();
    double relativeZeroX = 8;
    double relativeZeroY = size.height - maliaoRealHeight - 50;
    canvas.translate(relativeZeroX + position.x, relativeZeroY - position.y);
    if (maliao != null) {
      canvas.drawImageRect(maliao, maliaoImageArea, maliaoPaintArea, paint);
    }
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
    ImageStream stream2 = FileImage(new File("/Users/gs/Downloads/1.jpeg")).resolve(ImageConfiguration.empty);
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
