import 'dart:convert';

import 'package:flutter/material.dart';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();

    // dart的数据类型：Map
    final post = {'name': 'kevinliao126', 'age': 12, 'address': 'nanjing'};

    print(post['name']); // 用[]获取Map里的值

    // dart的库convert，可以用encode方法把Map类型的数据转化为json数据格式，用于post请求。
    final postJson = json.encode(post);
    print('==encode===$postJson');
    print('===isMap?====${postJson is Map}');

    // dart的库convert，可以用decode方法把从接口返回的json类型的数据转化为Map数据格式。
    final decodePost = json.decode(postJson);
    print('==decode===$decodePost');
    print('===isMap?====${decodePost is Map}');
    print(decodePost['name']);

    // fromJson方法把json字符串转化为可以用.来访问的实体类。
    final postModel = PostModel.fromJson(decodePost);
    print('===name===${postModel.name}');
    print('===age===${postModel.age}');
    print('===address===${postModel.address}');

    // 还可以转换回去
    print('==${json.encode(postModel)}');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PostModel {
  final String name;
  final int age;
  final String address;

  PostModel(this.name, this.age, this.address);

  PostModel.fromJson(Map json)
      : name = json['name'],
        age = json['age'],
        address = json['address'];

  Map toJson() => {'name': name, 'age': age, 'address': address};
}
