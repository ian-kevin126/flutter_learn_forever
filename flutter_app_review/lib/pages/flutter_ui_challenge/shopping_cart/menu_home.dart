import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterappreview/pages/flutter_ui_challenge/shopping_cart/screens/pager.dart';

class MenuHomePage extends StatelessWidget {
  MenuHomePage() {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        alignment: AlignmentDirectional.topEnd,
        children: <Widget>[
          new MenuPager(),
        ],
      ),
    );
  }
}