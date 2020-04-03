import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemoTwo extends StatefulWidget {
  @override
  _StreamDemoTwoState createState() => _StreamDemoTwoState();
}

class _StreamDemoTwoState extends State<StreamDemoTwo> {
  StreamController _streamDemo;
  StreamSubscription _streamSubscription;
  StreamSink _sinkDemo;
  String _data = '...';

  @override
  void initState() {
    super.initState();

    // 初始化Stream
    print('====initStream=====');
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    // 创建单次订阅的Stream
    // _streamDemo = StreamController<String>();

    // 创建可以多次订阅的Stream
    _streamDemo = StreamController.broadcast();

    // 给Stream增加数据的方法sink
    _sinkDemo = _streamDemo.sink;

    // 监听stream，会返回一个StreamSubscription的实例
    print('====listenStream=====');
    _streamSubscription = _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
    // 添加第二次订阅
    _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);
  }

  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  void onError(error) {
    print('======error====$error===');
  }

  void onDone() {
    print('======done!===');
  }

  void onData(dynamic data) {
    print('====onDataOne=====$data');
    setState(() {
      _data = data;
    });
  }

  void onDataTwo(dynamic data) {
    print('====onDataTwo=====$data');
  }

  // 模拟获取数据
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
//    throw 'Something happened!'; // 模拟异常
    return 'hello~';
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

  void _addDataToStream() async {
    print('====add data to stream====');
    String data = await fetchData();
//     _streamDemo.add(data);
    _sinkDemo.add(data);
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
            // 这种是原来的获取值的方式，需要setState方法去刷新页面
            Text('Stream值：$_data'),
            StreamBuilder(
              stream: _streamDemo.stream,
              initialData: '...',
              builder: (context, snapshot) {
                return Text('${snapshot.data}');
              },
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              child: Text('添加事件到Stream'),
              onPressed: _addDataToStream,
            ),
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
