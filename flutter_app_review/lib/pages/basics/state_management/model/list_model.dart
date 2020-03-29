import 'dart:async';
import 'dart:collection';

import 'package:scoped_model/scoped_model.dart';

class ListModel extends Model {
  bool _init = false; // 列表初始化标志
  List<String> _list = []; // 列表数据
  String _selected = '未选中'; // 选中的列表项

  bool get isInit => _init;

  UnmodifiableListView<String> get list => UnmodifiableListView(_list);

  String get selected => _selected;

  // 选中列表项
  void select(String selected) {
    _selected = selected;

    // 通知数据变更
    notifyListeners();
  }

  // 加载列表
  void loadList() async {
    // 模拟网络请求
    await Future.delayed(Duration(milliseconds: 3000));
    _list = [
      '1. Scoped Model',
      '2. Scoped Model',
      '3. Scoped Model',
      '4. Scoped Model',
      '5. Scoped Model',
      '6. Scoped Model',
      '7. Scoped Model',
      '8. Scoped Model',
      '9. Scoped Model',
      '10. Scoped Model'
    ];

    _init = true;
    // 通知数据变更
    notifyListeners();
  }
}
