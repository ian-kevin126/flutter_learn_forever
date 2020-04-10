import 'package:flutter/material.dart';
import 'package:random_pk/random_pk.dart';

class ScrollableControllerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollableControllerHome(),
    );
  }
}

class ScrollableControllerHome extends StatefulWidget {
  @override
  _ScrollableControllerHomeState createState() => new _ScrollableControllerHomeState();
}

class _ScrollableControllerHomeState extends State<ScrollableControllerHome> {
  ScrollController scrollController = new ScrollController();
  bool showTopBtn = false;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset >= 500 && showTopBtn == false) {
        setState(() {
          showTopBtn = true;
        });
      }
      if (scrollController.offset < 500 && showTopBtn == true) {
        setState(() {
          showTopBtn = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ScrollableControllerDemo'),
      ),
      body: new Container(
          child: new ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) {
          return new RandomContainer(
            height: 100,
            child: new Text("$index"),
          );
        },
        itemCount: 20,
      )),
      floatingActionButton: !showTopBtn
          ? null
          : new FloatingActionButton(
              onPressed: () {
                //点击返回顶部执行动画,jumpTo(double offset)、animateTo(double offset,...)：
                // 这两个方法用于跳转到指定的位置，它们不同之处在于，前者在跳转时会执行一个动画，而前者不会
                if (scrollController != null) {
//            scrollController.animateTo(0, duration: Duration(seconds: 1), curve: Curves.ease);
                  scrollController.jumpTo(0);
                }
              },
              child: new Icon(Icons.arrow_upward),
            ),
    );
  }
}
