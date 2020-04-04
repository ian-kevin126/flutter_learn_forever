import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class FileDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FileDemoPage();
  }
}

class _FileDemoPage extends State<FileDemoPage> {
  String content;
  var inputController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('File Demo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 1.0)),
            child: Text(content ?? ''),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: TextField(
                  controller: inputController,
                  decoration: InputDecoration(hintText: '输出要储存的内容'),
                )),
                RaisedButton(
//                  onPressed: () => _writeToCache(inputController.text),
                  child: Text('保存'),
                )
              ],
            ),
          ),
          RaisedButton(
//            onPressed: () {
//              _readFromCache().then((value) {
//                setState(() {
//                  content = value;
//                  print('read = $content');
//                });
//              });
//            },
            child: Text('读取'),
          )
        ],
      ),
    );
  }

//  Future<File> _getCacheFile() async {
//    // 获取应用目录
////    String dir = (await getTemporaryDirectory()).path;
////    String dir = (await getApplicationDocumentsDirectory()).path;
//    String dir;
//    if (Platform.isAndroid) {
//      dir = (await getExternalStorageDirectory()).path;
//    }
//    print('ios_external_path = $dir');
//    return new File('$dir/cache.txt');
//  }

//  Future _writeToCache(String content) async {
////    File f = await _getCacheFile();
////    await f.writeAsString(content);
//
////    SharedPreferences prefs = await SharedPreferences.getInstance();
//    await prefs.setString('content', content);
//  }

//  Future<String> _readFromCache() async {
//    try {
////      File f = await _getCacheFile();
////      String r = await f.readAsString();
//
////      SharedPreferences prefs = await SharedPreferences.getInstance();
////      String r = await prefs.get('content');
//      return r;
//    } on Exception {
//      return "";
//    }
//  }
}
