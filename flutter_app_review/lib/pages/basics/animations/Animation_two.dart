import 'package:flutter/material.dart';

class AnimTwoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AnimTwoPage();
  }
}

class _AnimTwoPage extends State<AnimTwoPage> with TickerProviderStateMixin {
  var w = 100.0;
  var h = 100.0;

  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    // 创建 AnimationController，用于控制动画
    // 必须提供动画时间
    animationController = new AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    // 创建一个插值器，关联 AnimationController，返回一个新的 Animation 对象
    animation = Tween<double>(begin: 0, end: 100.0 * 2.0).animate(animationController);

    animationController.addListener(() {
      // 当动画更新时会调用
      // 需要在这个函数中，调用 setState() 来触发视图刷新
      setState(() {});
    });
    // 开始播放动画
    animationController.addStatusListener((s) {
      if (s == AnimationStatus.completed) {
//        animationController.reverse();
//        animationController
//          ..fling(velocity: -0.000001);
      }
    });
//    animationController
//        ..fling(velocity: 1);
//    animationController.forward();
//  animationController.repeat(reverse: true, period: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Anim Demo 2'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SizedBox(
          // 获取插值器计算出的 value
          // 作为属性值
          width: animation.value,
          height: animation.value,
          child: Container(
            color: Colors.lightBlue,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // 动画使用完成后必需要销毁
    animationController.dispose();
  }
}
