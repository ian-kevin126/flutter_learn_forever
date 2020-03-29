import 'package:flutter/material.dart';
import 'package:flutterappreview/pages/basics/state_management/show_page.dart';

class ScopedModelDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScopedModel'),
      ),
      body: ShowPage(),
    );
  }
}
