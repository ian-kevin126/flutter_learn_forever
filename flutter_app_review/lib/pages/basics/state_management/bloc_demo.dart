import 'dart:async';

import 'package:flutter/material.dart';

class BasicBlocDemo extends StatefulWidget {
  @override
  _BasicBlocDemoState createState() => _BasicBlocDemoState();
}

class _BasicBlocDemoState extends State<BasicBlocDemo> {
  StreamController _stream = StreamController();
  StreamSubscription _streamSubscription;
  double _count = 0.0;

  @override
  void initState() {
    super.initState();
    _streamSubscription = _stream.stream.listen((data) {
      setState(() {
        _count += data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BasicBlocDemo'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('$_count'),
            RaisedButton(
              child: Text('订阅Stream'),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('改变Stream'),
              onPressed: () {
                _stream.add(12.0);
              },
            ),
            RaisedButton(
              child: Text('取消Stream'),
              onPressed: () {
                _streamSubscription.cancel();
              },
            )
          ],
        ),
      ),
    );
  }
}
