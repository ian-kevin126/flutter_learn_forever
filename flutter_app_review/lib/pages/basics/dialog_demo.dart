import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum options { A, B, C }

enum Actions { ok, cancel }

enum Category { vegetables, fruit, meat }

class DialogDemo extends StatefulWidget {
  @override
  _DialogDemoState createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  final _bottomSheetGlobalKey = GlobalKey<ScaffoldState>();
  String _choice = 'nothing';
  String _action = 'nothing';
  String _marry = 'nothing';

  bool _isExpanded = false;
  List<ExpansionItem> _expansionItems;

  Future _showSimpleDialog() async {
    final opt = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('SimpleDialog'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('选项A'),
                onPressed: () {
                  Navigator.pop(context, options.A);
                },
              ),
              SimpleDialogOption(
                child: Text('选项B'),
                onPressed: () {
                  Navigator.pop(context, options.B);
                },
              ),
              SimpleDialogOption(
                child: Text('选项C'),
                onPressed: () {
                  Navigator.pop(context, options.C);
                },
              )
            ],
          );
        });

    switch (opt) {
      case options.A:
        setState(() {
          _choice = 'A';
        });
        break;
      case options.B:
        setState(() {
          _choice = 'B';
        });
        break;
      case options.C:
        setState(() {
          _choice = 'C';
        });
        break;
    }
  }

  Future _showAlertDialog() async {
    final opt = await showDialog(
        barrierDismissible: false, // 点击蒙板区域不能收起弹框
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog'),
            content: Text('您确定要提交吗？'),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  '取消',
                  style: TextStyle(color: Colors.black87),
                ),
                onPressed: () {
                  Navigator.pop(context, Actions.cancel);
                },
              ),
              FlatButton(
                child: Text(
                  '确定',
                  style: TextStyle(color: Colors.black87),
                ),
                onPressed: () {
                  Navigator.pop(context, Actions.ok);
                },
              )
            ],
          );
        });

    switch (opt) {
      case Actions.ok:
        setState(() {
          _action = 'ok';
        });
        break;
      case Actions.cancel:
        setState(() {
          _action = 'cancel';
        });
        break;
    }
  }

  Future _showBottomSheet() async {
    _bottomSheetGlobalKey.currentState.showBottomSheet((BuildContext context) {
      return BottomAppBar(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        height: 80.0,
        child: Row(
          children: <Widget>[
            Icon(Icons.access_time),
            SizedBox(
              width: 12,
            ),
            Text('12:00 / 2003.1.2'),
            Expanded(
              child: Text(
                '打篮球',
                textAlign: TextAlign.right,
              ),
            )
          ],
        ),
      ));
    });
  }

  Future _showBottomModalSheet() async {
    final opt = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('蔬菜'),
                  leading: Icon(Icons.four_k),
                  subtitle: Text('vegetables'),
                  onTap: () {
                    Navigator.pop(context, Category.vegetables);
                  },
                ),
                ListTile(
                  title: Text('水果'),
                  leading: Icon(Icons.ac_unit),
                  subtitle: Text('fruit'),
                  onTap: () {
                    Navigator.pop(context, Category.fruit);
                  },
                ),
                ListTile(
                  title: Text('肉类'),
                  leading: Icon(Icons.account_balance_wallet),
                  subtitle: Text('meat'),
                  onTap: () {
                    Navigator.pop(context, Category.meat);
                  },
                )
              ],
            ),
          );
        });
    switch (opt) {
      case Category.vegetables:
        setState(() {
          _marry = 'vegetables';
        });
        break;
      case Category.fruit:
        setState(() {
          _marry = 'fruit';
        });
        break;
      case Category.meat:
        setState(() {
          _marry = 'meat';
        });
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _expansionItems = <ExpansionItem>[
      ExpansionItem(
          headerText: 'Panel A',
          expansionBody: Container(
            child: Text('This is a Panel AAAA'),
            padding: EdgeInsets.all(12.0),
            width: double.infinity,
          ),
          isExpanded: false),
      ExpansionItem(
          headerText: 'Panel B',
          expansionBody: Container(
            child: Text('This is a Panel BBBB'),
            padding: EdgeInsets.all(12.0),
            width: double.infinity,
          ),
          isExpanded: false),
      ExpansionItem(
          headerText: 'Panel C',
          expansionBody: Container(
            child: Text('This is a Panel CCCC'),
            padding: EdgeInsets.all(12.0),
            width: double.infinity,
          ),
          isExpanded: false)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _bottomSheetGlobalKey,
        appBar: AppBar(
          title: Text('DialogDemo'),
        ),
//        floatingActionButton: FloatingActionButton(
//          onPressed: _showSimpleDialog,
//          child: Icon(Icons.add),
//        ),
        body: Builder(
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: _showSimpleDialog,
                    child: Text('SimpleDialog'),
                  ),
                  Text('您选择的是：$_choice'),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                    onPressed: _showAlertDialog,
                    child: Text('AlertDialog'),
                  ),
                  Text('您选择的是：$_action'),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                    onPressed: _showBottomSheet,
                    child: Text('BottomSheet'),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                    onPressed: _showBottomModalSheet,
                    child: Text('BottomModalSheet'),
                  ),
                  Text('您选择的是：$_marry'),
                  SizedBox(
                    height: 30,
                  ),
                  ExpansionPanelList(
                    expansionCallback: (int panelIndex, bool isExpanded) {
                      setState(() {
                        _expansionItems[panelIndex].isExpanded = !isExpanded;
                      });
                    },
                    children: _expansionItems.map((ExpansionItem item) {
                      return ExpansionPanel(
                          body: item.expansionBody,
                          isExpanded: item.isExpanded,
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return Container(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                item.headerText,
                                style: Theme.of(context).textTheme.title,
                              ),
                            );
                          });
                    }).toList(),
                  )
                ],
              ),
            );
          },
        ));
  }
}

class ExpansionItem {
  String headerText;
  Widget expansionBody;
  bool isExpanded;

  ExpansionItem({this.headerText, this.expansionBody, this.isExpanded});
}
