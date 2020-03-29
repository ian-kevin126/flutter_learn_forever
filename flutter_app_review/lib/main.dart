import 'package:flutter/material.dart';
import 'package:flutterappreview/home.dart';
import 'package:flutterappreview/pages/basics/state_management/model/list_model.dart';
import 'package:flutterappreview/pages/basics/state_management/scoped_model/store/index.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  /// 创建model实例
  ListModel listModel = ListModel();

  /// 使用ScopedModel作为根布局
  runApp(ScopedModel(
    model: listModel,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyStoreScoped.init(
        context: context,
        child: Builder(builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.teal,
                // 取消TabBar的切换效果
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                accentColor: Color(0xFF27262B)
//        splashFactory: InteractiveInkFeatureFactory.
                ),
            home: MyHomePage(title: 'Flutter Review Forever'),
          );
        }));
  }
}
