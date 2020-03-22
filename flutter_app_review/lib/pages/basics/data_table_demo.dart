import 'package:flutter/material.dart';
import 'package:flutterappreview/common/common.dart';
import 'package:flutterappreview/model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  bool _sortAscending = true;
  int _sortColumnIndex = 0;

  //默認的行數
  int _defaultRowPageCount = PaginatedDataTable.defaultRowsPerPage;
  MyTable table = MyTable();

//排序關聯_sortColumnIndex,_sortAscending
  void _sort<T>(Comparable<T> getField(Shop s), int index, bool b) {
    table._sort(getField, b);
    setState(() {
      this._sortColumnIndex = index;
      this._sortAscending = b;
    });
  }

  List<DataColumn> getColumn() {
    return [
      DataColumn(
          label: Text('商品名'),
          onSort: (i, b) {
            _sort<String>((Shop p) => p.name, i, b);
          }),
      DataColumn(
          label: Text('價格'),
          onSort: (i, b) {
            _sort<num>((Shop p) => p.price, i, b);
          }),
      DataColumn(
          label: Text('庫存'),
          onSort: (i, b) {
            _sort<num>((Shop p) => p.number, i, b);
          }),
      DataColumn(
          label: Text('類型'),
          onSort: (i, b) {
            _sort<String>((Shop p) => p.type, i, b);
          }),
    ];
  }

  /// 带分页的DataTable
  Widget getPaginatedDataTable() {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        rowsPerPage: _defaultRowPageCount,
        onRowsPerPageChanged: (value) {
          setState(() {
            _defaultRowPageCount = value;
          });
        },
        sortColumnIndex: _sortColumnIndex,
        initialFirstRowIndex: 0,
        sortAscending: _sortAscending,
        availableRowsPerPage: [5, 10],
        onPageChanged: (value) {
          print('$value');
        },
        onSelectAll: table.selectAll,
        header: Text('商品庫存'),
        columns: getColumn(),
        source: table,
      ),
    );
  }

  /// 普通的表格
  Widget dataTableWidget() {
    List<DataRow> dateRows = [];
    for (int i = 0; i < userData.length; i++) {
      dateRows.add(DataRow(
        selected: userData[i].selected,
        onSelectChanged: (selected) {
          setState(() {
            userData[i].selected = selected;
          });
        },
        cells: [
          DataCell(Text('${userData[i].name}'), showEditIcon: true, onTap: () {
            print('DataCell onTap');
          }, placeholder: true),
          DataCell(Text('${userData[i].age}')),
        ],
      ));
    }
    return DataTable(columns: [
      DataColumn(label: Text('姓名')),
      DataColumn(
        label: Text('年龄'),
      ),
    ], rows: dateRows);
  }

  /// 有排序功能的表格
  Widget sortDataTable() {
    return DataTable(
        sortColumnIndex: _sortColumnIndex,
        sortAscending: _sortAscending,
        columns: [
          DataColumn(
              label: Text('姓名'),
              onSort: (int columnIndex, bool ascending) {
                setState(() {
                  _sortColumnIndex = columnIndex;
                  _sortAscending = ascending;
                  if (ascending) {
                    userData.sort((a, b) => a.name.compareTo(b.name));
                  } else {
                    userData.sort((a, b) => b.name.compareTo(a.name));
                  }
                });
              }),
          DataColumn(
              label: Text('年龄'),
              onSort: (int columnIndex, bool ascending) {
                setState(() {
                  _sortColumnIndex = columnIndex;
                  _sortAscending = ascending;
                  if (ascending) {
                    userData.sort((a, b) => a.age.compareTo(b.age));
                  } else {
                    userData.sort((a, b) => b.age.compareTo(a.age));
                  }
                });
              }),
        ],
        rows: userData.map((user) {
          return DataRow(cells: [
            DataCell(Text('${user.name}')),
            DataCell(Text('${user.age}')),
          ]);
        }).toList());
  }

  /// 带滚动的表格
  Widget scrollableDataTable() {
    List<DataRow> dateRows = [];
    for (int i = 0; i < userData.length; i++) {
      dateRows.add(DataRow(
        cells: [
          DataCell(Text('${userData[i].name}')),
          DataCell(Text('${userData[i].age}')),
          DataCell(Text('男')),
          DataCell(Text('2020')),
          DataCell(Text('10')),
        ],
      ));
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(columns: [
        DataColumn(label: Text('姓名')),
        DataColumn(
          label: Text('年龄'),
        ),
        DataColumn(
          label: Text('性别'),
        ),
        DataColumn(
          label: Text('出生年份'),
        ),
        DataColumn(
          label: Text('出生月份'),
        ),
      ], rows: dateRows),
    );
  }

  /// 带分页的表格
  Widget paginatedDataTable() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
      ),
      body: ListView(
        children: <Widget>[
          commonTitle('1.构建普通的DataTable：'),
          dataTableWidget(),
          SizedBox(
            height: 30.0,
          ),
          commonTitle('2.构建排序的DataTable：'),
          sortDataTable(),
          SizedBox(
            height: 30.0,
          ),
          commonTitle('3.带滚动功能的DataTable'),
          scrollableDataTable(),
          SizedBox(
            height: 30.0,
          ),
          commonTitle(('4.带分页功能的DataTable')),
          getPaginatedDataTable()
        ],
      ),
    );
  }
}

class Shop {
  final String name;
  final int number;
  final String type;
  final double price;
  bool selected = false; //默認為未選中
  Shop(
    this.name,
    this.number,
    this.type,
    this.price,
  );
}

class MyTable extends DataTableSource {
  List<Shop> _shops = <Shop>[
    Shop('小米6x', 100, '手機', 1699.0),
    Shop('華為P20', 50, '手機', 4999.0),
    Shop('華碩a61', 50, '電腦', 5700.0),
    Shop('iphone7plus耳機', 9999, '耳機', 60.0),
    Shop('iphone7plus256g', 1, '手機', 4760.0),
    Shop('金士頓8g內存條', 66, '內存條', 399.0),
    Shop('西門子洗衣機9.0kg', 890, '家電', 10399.0),
    Shop('三星66寸液晶智能電視', 800, '家電', 20389.0),
  ];

  int _selectCount = 0; //當前選中的行數
  bool _isRowCountApproximate = false; //行數確定
  @override
  DataRow getRow(int index) {
//根據索引獲取內容行
    if (index >= _shops.length || index < 0) throw FlutterError('兄弟，取錯數據了吧');
//如果索引不在商品列表裡面，拋出一個異常
    final Shop shop = _shops[index];
    return DataRow.byIndex(
        cells: <DataCell>[
          DataCell(Text(shop.name)),
          DataCell(Text('${shop.price}')),
          DataCell(Text('${shop.number}')),
          DataCell(Text(shop.type)),
        ],
        selected: shop.selected,
        index: index,
        onSelectChanged: (isSelected) {
          selectOne(index, isSelected);
        });
  }

  @override //是否行數不確定
  bool get isRowCountApproximate => _isRowCountApproximate;

  @override //有多少行
  int get rowCount => _shops.length;

  @override //選中的行數
  int get selectedRowCount => _selectCount;

//選中單個
  void selectOne(int index, bool isSelected) {
    Shop shop = _shops[index];
    if (shop.selected != isSelected) {
//如果選中就選中數量加一，否則減一
      _selectCount = _selectCount += isSelected ? 1 : -1;
      shop.selected = isSelected;
//更新
      notifyListeners();
    }
  }

//選中全部
  void selectAll(bool checked) {
    for (Shop _shop in _shops) {
      _shop.selected = checked;
    }
    _selectCount = checked ? _shops.length : 0;
    notifyListeners(); //通知監聽器去刷新
  }

//排序,
  void _sort<T>(Comparable<T> getField(Shop shop), bool b) {
    _shops.sort((Shop s1, Shop s2) {
      if (!b) {
        //兩個項進行交換
        final Shop temp = s1;
        s1 = s2;
        s2 = temp;
      }
      final Comparable<T> s1Value = getField(s1);
      final Comparable<T> s2Value = getField(s2);
      return Comparable.compare(s1Value, s2Value);
    });
    notifyListeners();
  }
}
