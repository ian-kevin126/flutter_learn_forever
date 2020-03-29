import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('StreamDemo'),
        ),
        body: StreamDemoHome());
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamDemoSubscription;

  @override
  void initState() {
    super.initState();

    print('初始化stream');
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    print('开始监听stream');
    // 监听会返回一个StreamSubscription
    _streamDemoSubscription =
        _streamDemo.listen(onData, onError: onError, onDone: onDone);
    print('初始化完成！');
  }

  void onError(error) {
    print('===error===$error==');
  }

  void onDone() {
    print('====Done!====');
  }

  void onData(String data) {
    print('=====data=====$data');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
//    throw 'get a error'; // onError要处理的事情
    return 'hello~';
  }

  void _pauseStream() {
    print('Pause Stream.');
    _streamDemoSubscription.pause();
  }

  void _resumeStream() {
    print('Resume Stream.');
    // 暂停后可以恢复
    _streamDemoSubscription.resume();
  }

  void _cancelStream() {
    print('Cancel Stream.');
    // 取消Stream后无法再恢复
    _streamDemoSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Pause'),
              onPressed: _pauseStream,
            ),
            RaisedButton(
              child: Text('Resume'),
              onPressed: _resumeStream,
            ),
            RaisedButton(
              child: Text('cancel'),
              onPressed: _cancelStream,
            )
          ],
        ),
      ),
    );
  }
}
