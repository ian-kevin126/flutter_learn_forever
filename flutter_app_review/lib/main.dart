import 'package:flutter/material.dart';
import 'package:flutterappreview/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          highlightColor: Colors.white,
          splashColor: Color(0xFF44a08d),
          accentColor: Colors.blue
//        splashFactory: InteractiveInkFeatureFactory.
          ),
      home: MyHomePage(title: 'Flutter Review Forever'),
    );
  }
}
