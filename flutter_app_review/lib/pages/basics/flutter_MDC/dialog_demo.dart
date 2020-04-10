import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappreview/home_tabs/components/customer_dialog.dart';
import 'package:toast/toast.dart';

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

  /// 普通的Dialog
  void _showCommonDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('AlertDialog', style: TextStyle(color: Colors.blueAccent)),
              content: Text('我是 AlertDialog 对话框!'),
              actions: <Widget>[
                FlatButton(child: Text("确定"), onPressed: () => Navigator.of(context).pop()),
                FlatButton(child: Text("取消"), onPressed: () => Navigator.of(context).pop())
              ]);
        });
  }

  /// 自定义Dialog， 修改Dialog的宽高和圆角
  void _showCustomer1Dialog() {
    customerShowDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return CustomerDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width + 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 10.0, left: 20.0, top: 10.0),
                    child: Text(
                      '分享截图',
                      style: TextStyle(color: Color(0xFF20596b), fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        child: Text('自定义Dialog'),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                            decoration: BoxDecoration(
                                color: Color(0xFFd8dee9), borderRadius: BorderRadius.all(Radius.circular(40.0))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.clear,
                                  size: 14,
                                  color: Color(0xFF4c566a),
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 2.0),
                                  child: Text(
                                    '取消',
                                    style:
                                        TextStyle(fontSize: 14, color: Color(0xFF4c566a), fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            //
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                            decoration: BoxDecoration(
                                color: Color(0xFF005960), borderRadius: BorderRadius.all(Radius.circular(40.0))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.share,
                                  size: 14,
                                  color: Colors.white70,
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 2.0),
                                  child: Text(
                                    '分享',
                                    style: TextStyle(fontSize: 14, color: Colors.white70, fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  void _showCustomer2Dialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('AlertDialog', style: TextStyle(color: Colors.blueAccent)),
              titlePadding: EdgeInsets.all(20.0),
              titleTextStyle: TextStyle(color: Colors.pinkAccent, fontSize: 18.0, fontWeight: FontWeight.w600),
              content: Text('我是 AlertDialog 对话框!'),
              contentPadding: EdgeInsets.all(30.0),
              contentTextStyle: TextStyle(color: Colors.pinkAccent, fontSize: 16.0, fontWeight: FontWeight.w400),
              backgroundColor: Colors.greenAccent.withOpacity(0.7),
              elevation: 10.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
              actions: <Widget>[
                FlatButton(child: Text("确定"), onPressed: () => Navigator.of(context).pop()),
                FlatButton(child: Text("取消"), onPressed: () => Navigator.of(context).pop())
              ]);
        });
  }

  void _showCustomer3Dialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Row(children: <Widget>[
                Image.asset('images/ic_launcher.png', scale: 2.0),
                Padding(child: Text('Alert List'), padding: EdgeInsets.only(left: 12.0))
              ]),
              content: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text('当前 index = $index'), onTap: () => Navigator.of(context).pop(index));
                  }),
              elevation: 10.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))));
        });
  }

  /// a.Dialog 默认宽度是固定的，高度也有最大限度，若元素大小超过最大宽高则会溢出；
  /// b.AlertDialog 可以自由设置点击事件，并非只有 actions 设置；
  void _showCustomer4Dialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Row(children: <Widget>[
                Image.asset('images/ic_launcher.png', scale: 2.0),
                Padding(child: Text('Alert 性别选择'), padding: EdgeInsets.only(left: 12.0))
              ]),
              titleTextStyle: TextStyle(color: Colors.pinkAccent, fontSize: 18.0, fontWeight: FontWeight.w600),
              content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Row(children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                          child: Container(child: Image.asset('images/pic1.jpg'), width: 105.0),
                          onTap: () {
                            Navigator.of(context).pop();
                            Toast.show('AlertDialog Boy!', context,
                                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                          })),
                  Expanded(
                      child: GestureDetector(
                          child: Container(child: Image.asset('images/pic2.jpg'), width: 105.0),
                          onTap: () {
                            Navigator.of(context).pop();
                            Toast.show('AlertDialog Girl!', context,
                                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                          }))
                ]),
                Row(children: <Widget>[
                  Expanded(
                      child: Center(
                          child: Text('男生',
                              style:
                                  TextStyle(color: Colors.blueAccent, fontSize: 16.0, fontWeight: FontWeight.w300)))),
                  Expanded(child: Center(child: Text('女生')))
                ])
              ]),
              contentTextStyle: TextStyle(color: Colors.pinkAccent, fontSize: 16.0, fontWeight: FontWeight.w300),
              contentPadding: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 0.0),
              elevation: 10.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
              actions: <Widget>[
                FlatButton(child: Text("确定"), onPressed: () => Navigator.of(context).pop()),
                FlatButton(child: Text("取消"), onPressed: () => Navigator.of(context).pop())
              ]);
        });
  }

  /// 采用了 SimpleDialogOption 选项 Widget，默认是占满一行；
  void _showCustomer5Dialog() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
              title: Text('SimpleDialog', style: TextStyle(color: Colors.blueAccent)),
              children: <Widget>[
                Padding(child: Text('我是 SimpleDialog 对话框？'), padding: EdgeInsets.all(20.0)),
                SimpleDialogOption(child: Text('Yes'), onPressed: () => Navigator.pop(context)),
                SimpleDialogOption(child: Text('No'), onPressed: () => Navigator.pop(context))
              ]);
        });
  }

  /// 尝试 List SimpleDialog；需注意内容主体为 List 方式，使用 ListView 时要注意冲突；
  void _showCustomer6Dialog() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
              title: Row(children: <Widget>[
                Image.asset('images/ic_launcher.png', scale: 2.0),
                Padding(child: Text('Simple List'), padding: EdgeInsets.only(left: 12.0))
              ]),
              children: <Widget>[
                Container(
                    height: 400.0,
                    child: ListView.builder(
                        itemCount: 30,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                              title: Text('当前 index = $index'), onTap: () => Navigator.of(context).pop(index));
                        }))
              ],
              elevation: 10.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))));
        });
  }

  void _showCustomer7Dialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return SimpleDialog(
              title: Row(children: <Widget>[
                Image.asset('images/ic_launcher.png', scale: 2.0),
                Padding(child: Text('Simple 性别选择'), padding: EdgeInsets.only(left: 12.0))
              ]),
              children: <Widget>[
                Row(children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                          child: Container(child: Image.asset('images/pic1.jpg'), width: 105.0),
                          onTap: () {
                            Toast.show('SimpleDialog Boy!', context,
                                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                            Navigator.pop(context);
                          })),
                  Expanded(
                      child: GestureDetector(
                          child: Container(child: Image.asset('images/pic2.jpg'), width: 105.0),
                          onTap: () {
                            Toast.show('SimpleDialog Girl!', context,
                                duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                            Navigator.pop(context);
                          }))
                ]),
                Padding(padding: EdgeInsets.symmetric(vertical: 14.0)),
                Row(children: <Widget>[
                  Expanded(
                      child: Center(
                          child: Text('男生',
                              style:
                                  TextStyle(color: Colors.blueAccent, fontSize: 16.0, fontWeight: FontWeight.w300)))),
                  Expanded(
                      child: Center(
                          child: Text('女生',
                              style: TextStyle(color: Colors.pinkAccent, fontSize: 16.0, fontWeight: FontWeight.w300))))
                ])
              ],
              elevation: 10.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))));
        });
  }

  /// UnconstrainedBox + SizedBox
  /// Flutter 的对话框中均未提供更改宽度的属性，高度可以自适应；和尚采用 UnconstrainedBox + SizedBox 可以实现对话框的宽度更改，
  /// 首先用 UnconstrainedBox 抵消 showDialog 对宽度的限制；之后采用 SizedBox 设置对话框宽度；注意此时设置高度并没有效果依旧自适应；
  /// 对话框宽度以 SizedBox 设置的 width 为主，child 的宽度无效；
  void _showCustomer8Dialog() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return UnconstrainedBox(
              constrainedAxis: Axis.vertical,
              child: SizedBox(width: 180.0, height: 180.0, child: AlertDialog(content: Icon(Icons.ac_unit))));
        });
  }

  void _showCustomer9Dialog() {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        pageBuilder: (buildContext, _, __) {
          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Center(
                  child: Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: BoxDecoration(color: Colors.greenAccent, borderRadius: BorderRadius.circular(5.0)),
                      child: Icon(Icons.ac_unit, color: Colors.white))),
            ),
          );
        },
        barrierColor: Colors.pink.withOpacity(0.2),
        transitionDuration: Duration(milliseconds: 1500),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
              position: Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
                  .animate(CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
              child: FadeTransition(
                  opacity:
                      Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animation, curve: Curves.linear)),
                  child: child));
        });
  }

  @override
  void initState() {
    super.initState();
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
                  /// 普通的Dialog
                  RaisedButton(
                    onPressed: _showCommonDialog,
                    child: Text('commonDialog'),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  /// 自定义Dialog：自定义宽高和圆角
                  RaisedButton(
                    onPressed: _showCustomer1Dialog,
                    child: Text('commonDialog1'),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  /// 自定义Dialog：透明度背景和圆角
                  RaisedButton(
                    onPressed: _showCustomer2Dialog,
                    child: Text('commonDialog2'),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  RaisedButton(
                    onPressed: _showCustomer3Dialog,
                    child: Text('commonDialog3'),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  RaisedButton(
                    onPressed: _showCustomer4Dialog,
                    child: Text('commonDialog4'),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  RaisedButton(
                    onPressed: _showCustomer5Dialog,
                    child: Text('commonDialog5'),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  RaisedButton(
                    onPressed: _showCustomer6Dialog,
                    child: Text('commonDialog6'),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  RaisedButton(
                    onPressed: _showCustomer7Dialog,
                    child: Text('commonDialog7'),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  RaisedButton(
                    onPressed: _showCustomer8Dialog,
                    child: Text('commonDialog8'),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  RaisedButton(
                    onPressed: _showCustomer9Dialog,
                    child: Text('commonDialog9'),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: _showSimpleDialog,
                        child: Text('SimpleDialog'),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('您选择的是：$_choice'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: _showAlertDialog,
                        child: Text('AlertDialog'),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('您选择的是：$_action'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    onPressed: _showBottomSheet,
                    child: Text('BottomSheet'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: _showBottomModalSheet,
                        child: Text('BottomModalSheet'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('您选择的是：$_marry'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  new RaisedButton(
                      onPressed: () {
                        showMySimpleDialog(context);
                      },
                      child: new Text("显示SimpleDialog,Material风格")),
                  new RaisedButton(
                      onPressed: () {
                        showMyMaterialDialog(context);
                      },
                      child: new Text("显示AlertDialog,Material风格")),
                  new RaisedButton(
                      onPressed: () {
                        showMyCupertinoDialog(context);
                      },
                      child: new Text("显示AlertDialog,IOS风格")),
                  new RaisedButton(
                      onPressed: () {
                        showMyDialogWithValue(context);
                      },
                      child: new Text("显示一个有返回值的对话框")),
                  new RaisedButton(
                      onPressed: () {
                        showMyDialogWithColumn(context);
                      },
                      child: new Text("显示一个SingleChildScrollView+Column的对话框")),
                  new RaisedButton(
                      onPressed: () {
                        showMyDialogWithListView(context);
                      },
                      child: new Text("显示一个ListView的对话框")),
                  new RaisedButton(
                      onPressed: () {
                        showMyDialogWithStateBuilder(context);
                      },
                      child: new Text("显示一个StatefulBuilder的对话框")),
                  new RaisedButton(
                      onPressed: () {
                        showMyCustomLoadingDialog(context);
                      },
                      child: new Text("显示一个自定义的对话框")),
                ],
              ),
            );
          },
        ));
  }

  void showMyMaterialDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return new AlertDialog(
            title: new Text("title"),
            content: new Text("内容内容内容内容内容内容内容内容内容内容内容"),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text("确认"),
              ),
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text("取消"),
              ),
            ],
          );
        });
  }

  void showMyCupertinoDialog(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return new CupertinoAlertDialog(
            title: new Text("title"),
            content: new Text("内容内容内容内容内容内容内容内容内容内容内容"),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop("点击了确定");
                },
                child: new Text("确认"),
              ),
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop("点击了取消");
                },
                child: new Text("取消"),
              ),
            ],
          );
        });
  }

  /*
  1.因为Dialog也是属于Navigator管理的，所以关闭对话框，直接用 Navigator.of(context).pop就行了
  2.ShowDialog()方法返回的是Future值,如果调用Navigator.of(context).pop()方法的时候，可以传递一些数值由Future返回。
    那么就可以用then()监听这个future所返回的数据了
   */
  void showMyDialogWithValue(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return new AlertDialog(
            title: new Text("title"),
            content: new Text("内容内容内容内容内容内容内容内容内容内容内容"),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop("点击了确定");
                },
                child: new Text("确认"),
              ),
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop("点击了取消");
                },
                child: new Text("取消"),
              ),
            ],
          );
        }).then((value) {
      debugPrint("对话框消失:$value");
    });
  }

  void showMyDialogWithColumn(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return new AlertDialog(
            title: new Text("title"),
            content: new SingleChildScrollView(
              child: new Column(
                children: <Widget>[
                  new SizedBox(
                    height: 100,
                    child: new Text("1"),
                  ),
                  new SizedBox(
                    height: 100,
                    child: new Text("1"),
                  ),
                  new SizedBox(
                    height: 100,
                    child: new Text("1"),
                  ),
                  new SizedBox(
                    height: 100,
                    child: new Text("1"),
                  ),
                  new SizedBox(
                    height: 100,
                    child: new Text("1"),
                  ),
                  new SizedBox(
                    height: 100,
                    child: new Text("1"),
                  ),
                  new SizedBox(
                    height: 100,
                    child: new Text("1"),
                  ),
                  new SizedBox(
                    height: 100,
                    child: new Text("1"),
                  ),
                  new SizedBox(
                    height: 100,
                    child: new Text("1"),
                  ),
                  new SizedBox(
                    height: 100,
                    child: new Text("1"),
                  ),
                  new SizedBox(
                    height: 100,
                    child: new Text("1"),
                  ),
                  new SizedBox(
                    height: 100,
                    child: new Text("1"),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: () {},
                child: new Text("确认"),
              ),
              new FlatButton(
                onPressed: () {},
                child: new Text("取消"),
              ),
            ],
          );
        });
  }

  void showMyDialogWithListView(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
            content: new Container(
              /*
              暂时的解决方法：要将ListView包装在具有特定宽度和高度的Container中
              如果Container没有定义这两个属性的话，会报错，无法显示ListView
               */
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.9,
              child: new ListView.builder(
                itemBuilder: (context, index) {
                  return new SizedBox(
                    height: 100,
                    child: new Text("1"),
                  );
                },
                itemCount: 10,
                shrinkWrap: true,
              ),
            ));
      },
    );

//如果直接将ListView放在dialog中，会报错，比如
//下面这种写法会报错：I/flutter (10721): ══╡ EXCEPTION CAUGHT BY RENDERING LIBRARY ╞═════════════════════════════════════════════════════════
//    I/flutter (10721): The following assertion was thrown during performLayout():
//    I/flutter (10721): RenderShrinkWrappingViewport does not support returning intrinsic dimensions.
//    I/flutter (10721): Calculating the intrinsic dimensions would require instantiating every child of the viewport, which
//    I/flutter (10721): defeats the point of viewports being lazy.
//    I/flutter (10721): If you are merely trying to shrink-wrap the viewport in the main axis direction, you should be able
//    I/flutter (10721): to achieve that effect by just giving the viewport loose constraints, without needing to measure its
//    I/flutter (10721): intrinsic dimensions.
//    I/flutter (10721):
//    I/flutter (10721): When the exception was thrown, this was the stack:
//    I/flutter (10721): #0      RenderShrinkWrappingViewport.debugThrowIfNotCheckingIntrinsics.<anonymous closure> (package:flutter/src/rendering/viewport.dart:1544:9)
//    I/flutter (10721): #1      RenderShrinkWrappingViewport.debugThrowIfNotCheckingIntrinsics (package:flutter/src/rendering/viewport.dart:1554:6)
//    I/flutter (10721): #2      RenderViewportBase.computeMaxIntrinsicWidth (package:flutter/src/rendering/viewport.dart:321:12)
//    I/flutter (10721): #3      RenderBox._computeIntrinsicDimension.<anonymous closure> (package:flutter/src/rendering/box.dart:1109:23)
//    I/flutter (10721): #4      __InternalLinkedHashMap&_HashVMBase&MapMixin&_LinkedHashMapMixin.putIfAbsent (dart:collection/runtime/libcompact_hash.dart:277:23)
//    I/flutter (10721): #5      RenderBox._computeIntrinsicDimension (package:flutter/src/rendering/box.dart:1107:41)
//    I/flutter (10721): #6      RenderBox.getMaxIntrinsicWidth (package:flutter/src/rendering/box.dart:1291:12)
//    I/flutter (10721): #7      _RenderProxyBox&RenderBox&RenderObjectWithChildMixin&RenderProxyBoxMixin.computeMaxIntrinsicWidth (package:flutter/src/rendering/proxy_box.dart:81:20)

//        showDialog(context: context, builder: (context) {
//      return new AlertDialog(title: new Text("title"),
//        content: new SingleChildScrollView(
//          child: new Container(
//            height: 200,
//            child: new ListView.builder(
//              itemBuilder: (context, index) {
//                return new SizedBox(height: 100, child: new Text("1"),);
//              }, itemCount: 10, shrinkWrap: true,),
//          ),
//        ),
//        actions: <Widget>[
//          new FlatButton(onPressed: () {}, child: new Text("确认"),),
//          new FlatButton(onPressed: () {}, child: new Text("取消"),),
//        ],);
//    });
  }

  void showMyDialogWithStateBuilder(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          bool selected = false;
          return new AlertDialog(
            title: new Text("StatefulBuilder"),
            content: new StatefulBuilder(builder: (context, StateSetter setState) {
              return Container(
                child: new CheckboxListTile(
                    title: new Text("选项"),
                    value: selected,
                    onChanged: (bool) {
                      setState(() {
                        selected = !selected;
                      });
                    }),
              );
            }),
          );
        });
  }

  void showMySimpleDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return new SimpleDialog(
            title: new Text("SimpleDialog"),
            children: <Widget>[
              new SimpleDialogOption(
                child: new Text("SimpleDialogOption One"),
                onPressed: () {
                  Navigator.of(context).pop("SimpleDialogOption One");
                },
              ),
              new SimpleDialogOption(
                child: new Text("SimpleDialogOption Two"),
                onPressed: () {
                  Navigator.of(context).pop("SimpleDialogOption Two");
                },
              ),
              new SimpleDialogOption(
                child: new Text("SimpleDialogOption Three"),
                onPressed: () {
                  Navigator.of(context).pop("SimpleDialogOption Three");
                },
              ),
            ],
          );
        });
  }

  void showMyCustomLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return new MyCustomLoadingDialog();
        });
  }
}

class MyCustomLoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Duration insetAnimationDuration = const Duration(milliseconds: 100);
    Curve insetAnimationCurve = Curves.decelerate;

    RoundedRectangleBorder _defaultDialogShape =
    RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2.0)));

    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets + const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: SizedBox(
            width: 120,
            height: 120,
            child: Material(
              elevation: 24.0,
              color: Theme.of(context).dialogBackgroundColor,
              type: MaterialType.card,
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: new Text("加载中"),
                  ),
                ],
              ),
              shape: _defaultDialogShape,
            ),
          ),
        ),
      ),
    );
  }
}
