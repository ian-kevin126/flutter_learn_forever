import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
//              commonRouteFunc(context, '1.Sliver家族', SliverFamily()),
        ],
      ),
    ));
  }
}
