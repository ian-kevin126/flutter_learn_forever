import 'package:flutter/material.dart';

import 'datas/page_data.dart';

class MessagePage extends StatelessWidget {
  final PageData data;

  // 带所需参数的构造函数
  const MessagePage({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Page'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context, 'Hi, this is MessagePage!');
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return Center(
      child: Text(
        data != null ? "Message：" + data.data : 'There is no data!',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
