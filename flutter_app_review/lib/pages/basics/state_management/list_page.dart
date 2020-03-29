import 'package:flutter/material.dart';
import 'package:flutterappreview/pages/basics/state_management/model/list_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListPageState();
  }
}

class ListPageState extends State<ListPage> {
  @override
  void initState() {
    super.initState();
    ListModel model = ScopedModel.of<ListModel>(context); // 获取ListModel
    if (!model.isInit) {
      model.loadList(); // 加载列表
    }
  }

  @override
  Widget build(BuildContext context) {
    buildLoad() {
      return Center(
        child: Text('正在加载中...'),
      );
    }

    buildList(list) {
      return ListView.builder(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(list[index]),
              onTap: () {
                ListModel model = ScopedModel.of<ListModel>(context);
                model.select(list[index]);
                // 返回到上一级页面
                Navigator.pop(context);
              },
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: ScopedModelDescendant<ListModel>(builder: (context, child, model) {
        // 根据状态显示界面
        if (!model.isInit) {
          // 显示loading界面
          return buildLoad();
        } else {
          // 显示列表界面
          var list = model.list;
          return buildList(list);
        }
      }),
    );
    ;
  }
}
