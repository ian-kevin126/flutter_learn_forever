import 'package:flutter/material.dart';

class AnimOnePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimOnePage();
}

class _AnimOnePage extends State<AnimOnePage> with TickerProviderStateMixin {
  var w = 100.0;
  var h = 100.0;
  var x = 0.0;
  var y = 0.0;
  var opacity = 1.0;
  var xAngle = 0.0;
  var yAngle = 0.0;
  var zAngle = 0.0;
  var scale = 1.0;
  var corner = 0.0;
  var color = Colors.lightBlueAccent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Anim Demo'),
      ),
      body: _build(context),
    );
  }

  _build(context) {
    print('screenHeight = ${MediaQuery.of(context).size.height}');
    print('screenWidth = ${MediaQuery.of(context).size.width}');
    print('aspectRatio = ${MediaQuery.of(context).size.aspectRatio}');
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            alignment: Alignment.center,
            decoration:
            BoxDecoration(border: Border.all(color: Colors.red, width: 1)),
            child: Transform(
              origin: Offset(w / 2, h / 2),
              transform: Matrix4.identity()
                ..rotateX(xAngle)
                ..rotateY(yAngle)
                ..rotateZ(zAngle)
                ..scale(scale),
              child: Opacity(
                opacity: opacity,
                child: Container(
                  width: w,
                  height: h,
                  // 有了 decoration，就不能设置颜色了
                  // 在 decoration 中设置颜色
                  decoration: BoxDecoration(
//                    color: color,
                    color: color,
                    // 设置圆角
                    borderRadius: BorderRadius.all(Radius.circular(corner)),
                  ),
                  margin: EdgeInsets.only(left: x, top: y),
                ),
              ),
            ),
          ),
          // 第一行
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                            margin: EdgeInsets.only(left: 6, right: 3),
                            child: RaisedButton(
                              onPressed: () => playTransitionAnim(),
                              textColor: Colors.white,
                              child: Text("位移动画"),
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            margin: EdgeInsets.only(left: 3, right: 3),
                            child: RaisedButton(
                              onPressed: () => playOpacityAnim(),
                              textColor: Colors.white,
                              child: Text("透明度动画"),
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            margin: EdgeInsets.only(left: 3, right: 6),
                            child: RaisedButton(
                              onPressed: () => playXRotateAnim(),
                              textColor: Colors.white,
                              child: Text("X轴旋转动画"),
                            )),
                      ),
                    ],
                  ),
                ),
                // 第二行
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                            margin: EdgeInsets.only(left: 6, right: 3),
                            child: RaisedButton(
                              onPressed: () => playYRotateAnim(),
                              textColor: Colors.white,
                              child: Text("Y轴旋转动画"),
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            margin: EdgeInsets.only(left: 3, right: 3),
                            child: RaisedButton(
                              onPressed: () => playZRotateAnim(),
                              textColor: Colors.white,
                              child: Text("Z轴旋转动画"),
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            margin: EdgeInsets.only(left: 3, right: 6),
                            child: RaisedButton(
                              onPressed: () => playScaleAnim(),
                              textColor: Colors.white,
                              child: Text("缩放动画"),
                            )),
                      ),
                    ],
                  ),
                ),
                // 第三行
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                            margin: EdgeInsets.only(left: 6, right: 3),
                            child: RaisedButton(
                              onPressed: () => playCornerAnim(),
                              textColor: Colors.white,
                              child: Text("变圆"),
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            margin: EdgeInsets.only(left: 3, right: 3),
                            child: RaisedButton(
                              onPressed: () => {},
                              textColor: Colors.white,
                              child: Text("--"),
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            margin: EdgeInsets.only(left: 3, right: 6),
                            child: RaisedButton(
                              onPressed: () => {},
                              textColor: Colors.white,
                              child: Text("--"),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // ignore: invalid_required_param
  playAnim(@required var updateFunc,
      {var begin,
        var end,
        var resetFunc,
        var duration = 800,
        var curve = Curves.linear}) {
    var controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: duration));
    var anim;
    if (begin != null || end != null) {
      anim = Tween(begin: begin, end: end).animate(controller);
    } else {
      anim = CurvedAnimation(parent: controller, curve: curve);
    }
    anim.addListener(() {
      print('value = ${anim.value}');
      setState(() => updateFunc(anim));
    });
    controller.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        controller.dispose();
        setState(() => resetFunc(anim));
      }
    });
    controller.forward();
  }

  playTransitionAnim() {
    playAnim((anim) {
      y = (anim.value) * (MediaQuery.of(context).size.height * 0.5 - h);
    }, resetFunc: (anim) {
      y = 0;
    }, duration: 1500, curve: Curves.bounceOut);
  }

  playOpacityAnim() {
    playAnim((anim) {
      opacity = 1 - anim.value;
    }, resetFunc: (anim) {
      opacity = 1.0;
    }, duration: 1000);
  }

  playXRotateAnim() {
    playAnim((anim) {
      xAngle = (1 - anim.value) * 6.28;
    }, resetFunc: (anim) {
      xAngle = 0.0;
    }, duration: 1000);
  }

  playYRotateAnim() {
    playAnim((anim) {
      yAngle = (1 - anim.value) * 6.28;
    }, resetFunc: (anim) {
      yAngle = 0.0;
    }, duration: 1000);
  }

  playZRotateAnim() {
    playAnim((anim) {
      zAngle = (1 - anim.value) * 6.28;
    }, resetFunc: (anim) {
      zAngle = 0.0;
    }, duration: 1000);
  }

  playScaleAnim() {
    playAnim((anim) {
      scale = anim.value + 1.0;
    }, resetFunc: (anim) {
      scale = 1.0;
    }, duration: 1000);
  }

  playCornerAnim() {
    playAnim((anim) {
      corner = anim.value * 500;
    }, resetFunc: (anim) {
      corner = 0;
    }, duration: 5000);
  }
}
