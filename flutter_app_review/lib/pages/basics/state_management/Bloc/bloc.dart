import 'dart:async';

import 'package:flutter/material.dart';

class BlocDemo extends StatefulWidget {
  @override
  _BlocDemoState createState() => _BlocDemoState();
}

class _BlocDemoState extends State<BlocDemo> {
  StreamController _streamController = StreamController.broadcast();
  StreamSubscription _streamSubscription;

  @override
  void initState() {
    super.initState();
    _streamSubscription = _streamController.stream.where((item) => item % 2 == 0).listen((value) {
      print(value);
    });

    for (var i = 0; i < 11; i++) {
      _streamController.sink.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
