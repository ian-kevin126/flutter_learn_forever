import 'package:flutter/material.dart';

//class StateManagementDemo extends StatelessWidget {
//  int _count = 0;
////  final int _count = 0;     在StatelessWidget里定义的变量都必须是不可变的变量。因为StatelessWidget表示的是状态不可变的组件
//  @override
//  // build方法表示的是构建用户的界面
//  Widget build(BuildContext context) {
//    // Scaffold相当于是页面的架子
//    return Scaffold(
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.add),
//        onPressed: (){
//          _count += 1;
//          print('$_count');  // 发现控制台的_count值在变，而界面上的_count却没变。
//        },
//      ),
//      appBar: AppBar(
//        title: Text('StateManagementDemo'),
//      ),
//      body: Center(
//        child: Text('$_count'),
//      ),
//    );
//  }
//}

// StatefulWidget本身也是immutable的，它的状态也是要放在state组件里面，又createState()方法创建。
class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;

  void _increaseCount() {
    _count += 1;
    setState(() {});
    print('$_count');
  }

//  final int _count = 0;     在StatelessWidget里定义的变量都必须是不可变的变量。因为StatelessWidget表示的是状态不可变的组件
  @override
  // build方法表示的是构建用户的界面
  Widget build(BuildContext context) {
    // Scaffold相当于是页面的架子
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _increaseCount,
      ),
      appBar: AppBar(
        title: Text('StateManagementDemo'),
      ),
      // 父子组件通信
      body: CounterWrapper(_count, _increaseCount),
    );
  }
}

class CounterWrapper extends StatelessWidget {
  final int count;
  final VoidCallback _increaseCount;

  CounterWrapper(this.count, this._increaseCount);

  @override
  Widget build(BuildContext context) {
    return Counter(count, _increaseCount);
  }
}

class Counter extends StatelessWidget {
  final int count;
  final VoidCallback _increaseCount;

  // 加了大括号{}的构造函数，表示非必传，在传值的时候就要写成Counter(params：value)的形式，
  // 不加就表示必传，传值就直接Counter(value)
  Counter(this.count, this._increaseCount);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        label: Text('$count'),
        onPressed: _increaseCount,
      ),
    );
  }
}
