import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemoTwo extends StatefulWidget {
  @override
  _StreamDemoTwoState createState() => _StreamDemoTwoState();
}

class _StreamDemoTwoState extends State<StreamDemoTwo> {
  StreamSubscription _streamSubscription;

  @override
  void initState() {
    super.initState();

    // 初始化Stream
    print('====initStream=====');
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());

    // 监听stream，会返回一个StreamSubscription的实例
    print('====listenStream=====');
    _streamSubscription = _streamDemo.listen(onData, onError: onError, onDone: onDone);
  }

  void onError(error) {
    print('======error====$error===');
  }

  void onDone() {
    print('======done!===');
  }

  void onData(String data) {
    print('====data=====$data');
  }

  // 模拟获取数据
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    throw 'Something happened!'; // 模拟异常
//    return 'hello~';
  }

  // 暂停Stream，之后是可以恢复的
  void _pauseStream() {
    print('====pauseStream====');
    _streamSubscription.pause();
  }

  // 恢复Stream
  void _resumeStream() {
    print('====resumeStream====');
    _streamSubscription.resume();
  }

  // 取消Stream，需要注意的是，取消之后是是无法再恢复的
  void _cancelStream() {
    print('====cancelStream====');
    _streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('暂停Stream'),
              onPressed: _pauseStream,
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              child: Text('恢复Stream'),
              onPressed: _resumeStream,
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              child: Text('删除Stream'),
              onPressed: _cancelStream,
            )
          ],
        ),
      ),
    );
  }
}
