import 'dart:math';

import 'package:flutter/material.dart';

class CustomScrollViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomScrollViewPage();
  }
}

class _CustomScrollViewPage extends State<CustomScrollViewPage> {
  var colors = [
    Colors.redAccent,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.amberAccent,
    Colors.deepPurpleAccent,
    Colors.grey,
    Colors.pinkAccent,
  ];

  Random random;

  ScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    random = Random();

    scrollController = ScrollController(
        initialScrollOffset: 150
    )..addListener((){
      print('d = ${scrollController.offset}');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          const SliverAppBar(
            title: Text('SliverAppBar'),
            backgroundColor: Colors.amber,
            pinned: false,
            floating: false,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('FlexibleSpaceBar'),
              background: Image(
                image: AssetImage('images/pic2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: colors[random.nextInt(colors.length)],
                  child: Text(
                    'grid item $index',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        decoration: TextDecoration.none),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              height: 150,
              color: colors[random.nextInt(colors.length)],
              child: Text('list item $index',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: TextDecoration.none)),
            );
          }, childCount: 10)),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('list item $index',
                      style: TextStyle(
                          fontSize: 16, decoration: TextDecoration.none)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
