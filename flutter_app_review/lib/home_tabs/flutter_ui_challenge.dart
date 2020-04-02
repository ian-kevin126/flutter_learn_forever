import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterUIChallenge extends StatefulWidget {
  @override
  _FlutterUIChallengeState createState() => _FlutterUIChallengeState();
}

class _FlutterUIChallengeState extends State<FlutterUIChallenge> {
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
