import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemoFour extends StatefulWidget {
  @override
  _StreamDemoFourState createState() => _StreamDemoFourState();
}

class _StreamDemoFourState extends State<StreamDemoFour> {
  int _count = 0;
  final StreamController<int> _streamController = StreamController<int>();

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemoFour'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _streamController.stream,
          initialData: _count,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text('You hit me ${snapshot.data} times!');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _streamController.sink.add(++_count);
        },
      ),
    );
  }
}
