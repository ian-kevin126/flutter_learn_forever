import 'package:flutter/material.dart';

class InheritedWidgetDemo extends StatefulWidget {
  @override
  _InheritedWidgetDemoState createState() => _InheritedWidgetDemoState();
}

class _InheritedWidgetDemoState extends State<InheritedWidgetDemo> {
  int _count = 0;

  void _increaseCount() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShareDataWidget(
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('InheritedWidgetDemo'),
        ),
        body: ChildWidgetWrapper(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _increaseCount,
        ),
      ),
    );
  }
}

// 组件树第二层
class ChildWidgetWrapper extends StatelessWidget {
  const ChildWidgetWrapper();

  @override
  Widget build(BuildContext context) {
    return Center(child: ChildWidget());
  }
}

// 组件树第三层
class ChildWidget extends StatelessWidget {
  const ChildWidget();

  @override
  Widget build(BuildContext context) {
    var count = ShareDataWidget.of(context).count;
    var increaseCount = ShareDataWidget.of(context).increaseCount;
    return ActionChip(
      label: Text('$count'),
      onPressed: increaseCount,
    );
  }
}

// 共享数据组件
class ShareDataWidget extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  ShareDataWidget({
    @required this.count,
    this.increaseCount,
    this.child,
  }) : super(child: child);

  // 定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  // 该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    // 如果返回true，则子树中依赖(build函数中有调用)本widget
    // 的子widget的`state.didChangeDependencies`会被调用
    return old.count != count;
  }
}
