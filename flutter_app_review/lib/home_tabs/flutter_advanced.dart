import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappreview/common/common.dart';
import 'package:flutterappreview/pages/advanced/Bloc/counter_bloc.dart';
import 'package:flutterappreview/pages/advanced/canvas/canvas_test.dart';
import 'package:flutterappreview/pages/advanced/screenshot_share.dart';
import 'package:flutterappreview/pages/flutter_advanced/TabBarViewDemo/tabbarview_main.dart';

class FlutterAdvanced extends StatefulWidget {
  @override
  _FlutterAdvancedState createState() => _FlutterAdvancedState();
}

class _FlutterAdvancedState extends State<FlutterAdvanced> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Wrap(
        children: <Widget>[
          commonRouteFunc(context, '1.TabBar切换tab避免initState重复调用', TabBarDemo()),
          commonRouteFunc(context, '2.Bloc', BlocDemo()),
          commonRouteFunc(context, '3.canvas', CustomPaintRoute()),
          commonRouteFunc(context, '4.分享截图', ScreenShotShare()),
        ],
      ),
    ));
  }
}
