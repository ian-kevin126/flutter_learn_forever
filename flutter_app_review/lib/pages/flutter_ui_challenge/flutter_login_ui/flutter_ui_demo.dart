import 'package:flutter/material.dart';

import 'background.dart';
import 'loginUi.dart';

class FlutterUiDemo extends StatefulWidget {
  @override
  _FlutterUiDemoState createState() => _FlutterUiDemoState();
}

class _FlutterUiDemoState extends State<FlutterUiDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter-Login-UI-Demo'),
        ),
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Background(),
            Login(),
          ],
        ));
  }
}
