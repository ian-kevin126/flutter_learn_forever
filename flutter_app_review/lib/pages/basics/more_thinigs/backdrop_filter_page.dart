import 'dart:ui';

import 'package:flutter/material.dart';

class BackDropFilterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BackDropFilterPage();
  }
}

class _BackDropFilterPage extends State<BackDropFilterPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    print(
        'statusBarHeight = ${mediaQueryData.padding.top}'
        ',padding.bottom = ${mediaQueryData.padding.bottom}'
            ', screenHeight = ${mediaQueryData.size.height}');
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ClipXXX Page'),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset('images/pic1.jpg'),
          ),
          BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0),
              )),
        ],
      ),
    );
  }
}
