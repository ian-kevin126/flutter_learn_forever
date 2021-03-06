/*
*
**/

import 'package:flutter/material.dart';

import 'tabbarview_page1.dart';
import 'tabbarview_page2.dart';
import 'tabbarview_page3.dart';

class TabBarDemo extends StatefulWidget {
  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('tabbarview'),
            bottom: TabBar(
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(
                  child: Text('这是tab1'),
                ),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Page1(),
              Page2(),
              Page3(),
            ],
            physics: NeverScrollableScrollPhysics(),
          ),
        ));
  }
}
