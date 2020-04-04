import 'dart:math';

import 'package:flutter/material.dart';

class SingleChildScrollViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SingleChildScrollViewPage();
  }
}

class _SingleChildScrollViewPage extends State<SingleChildScrollViewPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollView Page"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: _buildColumnItems(context),
        ),
      ),
    );
  }

  List<Widget> _buildColumnItems(BuildContext context) {
    var colors = [
      Colors.redAccent,
      Colors.greenAccent,
      Colors.blueAccent,
      Colors.amberAccent,
      Colors.deepPurpleAccent,
      Colors.grey,
      Colors.pinkAccent,
    ];
    var items = <Widget>[];
    var random = Random();
    for (var i = 0; i < 50; i++) {
      items.add(Container(
        alignment: Alignment.center,
        height: 150,
        color: colors[random.nextInt(colors.length)],
      ));
    }
    return items;
  }
}
