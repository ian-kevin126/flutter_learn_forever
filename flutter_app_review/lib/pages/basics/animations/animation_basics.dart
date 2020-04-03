import 'package:flutter/material.dart';

class AnimationBasics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimationBasicsHome();
  }
}

class AnimationBasicsHome extends StatefulWidget {
  @override
  _AnimationBasicsHomeState createState() => _AnimationBasicsHomeState();
}

class _AnimationBasicsHomeState extends State<AnimationBasicsHome> with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationStatus _status;
  Animation _animation;
  Animation _animationColor;
  CurvedAnimation _curve;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      // 初始值
//      value: 32.0,
//      lowerBound: 32.0,
//      upperBound: 100.0,
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    // 动画曲线
    _curve = CurvedAnimation(parent: _animationController, curve: Curves.bounceOut);
    // 用来设定动画的起止参数
    _animation = Tween(begin: 32.0, end: 100.0).animate(_curve);
    _animationColor = ColorTween(begin: Colors.redAccent, end: Colors.black).animate(_curve);

//    _animationController.addListener(() {
//      print('====${_animationController.value}');
//      setState(() {});
//    });
//
//    _animationController.addStatusListener((AnimationStatus status) {
//      setState(() {
//        _status = status;
//      });
//    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationBasicsHome'),
      ),
      body: Center(
        child: AnimationHeart(animationList: [_animation, _animationColor], animationController: _animationController),
      ),
    );
  }
}

class AnimationHeart extends AnimatedWidget {
  final List animationList;
  final AnimationController animationController;

  AnimationHeart({this.animationList, this.animationController}) : super(listenable: animationController);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      color: animationList[1].value,
      iconSize: animationList[0].value,
      onPressed: () {
        if (animationController.status == AnimationStatus.completed) {
          animationController.reverse();
        } else {
          animationController.forward();
        }
      },
    );
  }
}
