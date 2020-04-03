/*
*
**/
/// 切换tab后保留tab的状态，避免initState方法重复调用
/// 添加AutomaticKeepAliveClientMixin，并实现对应的方法bool get wantKeepAlive => true;，
/// 同时build方法实现父方法 super.build(context);

import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {

  static final String sName = "page3";

  @override
  State createState() => _Page3State();
}

class _Page3State extends State<Page3> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
    print("Page 3 init");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Text("Page 3");
  }

  @override
  bool get wantKeepAlive => true;

}