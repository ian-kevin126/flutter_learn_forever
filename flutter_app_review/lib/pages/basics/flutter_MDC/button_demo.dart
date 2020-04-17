import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';
import 'package:pimp_my_button/pimp_my_button.dart';
import 'package:slider_button/slider_button.dart';
import 'package:spring_button/spring_button.dart';

class ButtonDemo extends StatefulWidget {
  @override
  _ButtonDemoState createState() => _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {
  Timer timer;
  int counter = 0;

  // 普通的漂浮按钮
  final Widget _floatingActionButton = FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
    elevation: 0.0,
    backgroundColor: Colors.black87,
    // 设置形状为正方形边框
    shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
  );

  // 扩展的漂浮按钮
  final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
    onPressed: () {},
    label: Text('Add'),
    icon: Icon(Icons.add),
  );

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      counter--;
    });
  }

  Widget row(String text, Color color) {
    return Padding(
      padding: EdgeInsets.all(12.5),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12.5,
            ),
          ),
        ),
      ),
    );
  }

  /// 操作条
  actionBar() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: MediaQuery.of(context).padding.bottom + 10), // 设置漂浮按钮与底部的距离
      child: InkWell(
        onTap: () {},
        child: Container(
            height: 45,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF333333),
                    Color(0xFF666666),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(45.0))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  '提交',
                  style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 4.0,
      ),
      floatingActionButton: actionBar(),
      // 使漂浮按钮与底部导航栏叠合在一块
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//      bottomNavigationBar: BottomAppBar(
//        child: Container(
//          height: 80,
//          color: Colors.black26,
//        ),
//        shape: CircularNotchedRectangle(),
//      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20.0, bottom: 60.0, left: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                    child: Text('Button111'),
                    onPressed: () {},
                    splashColor: Colors.redAccent,
                    textColor: Colors.blue,
                  ),
                  FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      textColor: Theme.of(context).accentColor,
                      label: Text('Buttton222')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Button333'),
                    onPressed: () {},
                    splashColor: Colors.redAccent,
                    color: Theme.of(context).accentColor,
//              textColor: Colors.white,
                    // 或者
                    textTheme: ButtonTextTheme.primary,
                  ),
                  RaisedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                      color: Colors.white,
                      elevation: 1.0,
                      label: Text('Buttton444')),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // 设置全局主题要去MaterialApp设置，也可以设置局部的主题色
                  Theme(
                    data: ThemeData(splashColor: Colors.yellow, primaryColor: Colors.black38),
                    child: RaisedButton(
                      child: Text('Button555'),
                      color: Colors.white,
                      elevation: 1.0,
                      onPressed: () {},
                    ),
                  ),
                  // 还可以这样设置
                  Theme(
                    data: Theme.of(context).copyWith(
                        buttonColor: Theme.of(context).accentColor,
                        buttonTheme: ButtonThemeData(
                            textTheme: ButtonTextTheme.primary,
                            shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))))),
                    child: RaisedButton(
                      child: Text('Button666'),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Theme(
                    data: Theme.of(context).copyWith(
                        buttonColor: Theme.of(context).accentColor,
                        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary, shape: StadiumBorder())),
                    child: RaisedButton(
                      child: Text('Button777'),
                      onPressed: () {},
                    ),
                  ),
                  // 描边的button
                  OutlineButton(
                    child: Text('Button888'),
                    onPressed: () {},
                    shape: StadiumBorder(),
                    borderSide: BorderSide(color: Colors.black),
                    highlightedBorderColor: Colors.grey,
                    splashColor: Colors.grey[100],
                    color: Theme.of(context).canvasColor,
                    // 或者
//              textTheme: ButtonTextTheme.primary,
                  ),
                ],
              ),
              RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  color: Colors.white,
                  elevation: 1.0,
                  label: Text('Buttton999')),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton.icon(
                        onPressed: () {},
                        shape: StadiumBorder(),
                        color: Colors.white,
                        elevation: 1.0,
                        icon: Icon(Icons.add),
                        textColor: Colors.blue,
                        label: Text('Buttton999')),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: RaisedButton.icon(
                        onPressed: () {},
                        shape: StadiumBorder(),
                        color: Colors.white,
                        elevation: 1.0,
                        icon: Icon(Icons.add),
                        textColor: Colors.blue,
                        label: Text('Buttton11')),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: RaisedButton.icon(
                        onPressed: () {},
                        shape: StadiumBorder(),
                        icon: Icon(Icons.add),
                        color: Colors.white,
                        elevation: 1.0,
                        textColor: Colors.blue,
                        label: Text('Buttton22')),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Theme(
                    data: Theme.of(context)
                        .copyWith(buttonTheme: ButtonThemeData(padding: EdgeInsets.symmetric(horizontal: 64.0))),
                    child: ButtonBar(
                      children: <Widget>[
                        RaisedButton.icon(
                            onPressed: () {},
                            shape: StadiumBorder(),
                            icon: Icon(Icons.add),
                            color: Colors.white,
                            elevation: 1.0,
                            textColor: Colors.blue,
                            label: Text('Buttton22')),
                        RaisedButton.icon(
                            onPressed: () {},
                            shape: StadiumBorder(),
                            icon: Icon(Icons.add),
                            color: Colors.white,
                            elevation: 1.0,
                            textColor: Colors.blue,
                            label: Text('Buttton22')),
                      ],
                    ),
                  )
                ],
              ),
              _buildVerticalGap(),
              NiceButton(
                // width: 515,
                elevation: 8.0,
                radius: 52.0,
                text: "Login",
                background: firstColor,
                onPressed: () {
                  print("hello");
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  NiceButton(
                    mini: true,
                    icon: Icons.home,
                    background: firstColor,
                    onPressed: () {
                      print("hello");
                    },
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  NiceButton(
                    elevation: 5,
                    mini: true,
                    icon: Icons.label,
                    gradientColors: [secondColor, firstColor],
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              NiceButton(
                radius: 40,
                padding: const EdgeInsets.all(15),
                text: "Register",
                icon: Icons.account_box,
                gradientColors: [secondColor, firstColor],
                onPressed: () {},
              ),
              _buildVerticalGap(),
              SliderButton(
                action: () {
                  ///Do something here OnSlide
                },

                ///Put label over here
                label: Text(
                  "Slide to cancel !",
                  style: TextStyle(color: Color(0xff4a4a4a), fontWeight: FontWeight.w500, fontSize: 17),
                ),
                icon: Center(
                    child: Icon(
                  Icons.power_settings_new,
                  color: Colors.white,
                  size: 40.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                )),

                ///Change All the color and size from here.
                width: 230,
                radius: 10,
                buttonColor: Color(0xffd60000),
                backgroundColor: Color(0xff534bae),
                highlightedColor: Colors.white,
                baseColor: Colors.red,
              ),
              _buildVerticalGap(),
              SliderButton(
                action: () {
                  ///Do something here
                  Navigator.of(context).pop();
                },
                label: Text(
                  "Slide to cancel Event",
                  style: TextStyle(color: Color(0xff4a4a4a), fontWeight: FontWeight.w500, fontSize: 17),
                ),
                icon: Text(
                  "x",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 44,
                  ),
                ),
              ),
              _buildVerticalGap(),
              SpringButton(
                SpringButtonType.OnlyScale,
                row(
                  "Increment",
                  Colors.deepPurpleAccent,
                ),
                onTapDown: (_) => incrementCounter(),
                onLongPress: () => timer = Timer.periodic(
                  const Duration(milliseconds: 100),
                  (_) => incrementCounter(),
                ),
                onLongPressEnd: (_) {
                  timer?.cancel();
                },
              ),
              SpringButton(
                SpringButtonType.OnlyScale,
                row(
                  "Decrement",
                  Colors.redAccent,
                ),
                onTapDown: (_) => decrementCounter(),
                onLongPress: () => timer = Timer.periodic(
                  const Duration(milliseconds: 100),
                  (_) => decrementCounter(),
                ),
                onLongPressEnd: (_) {
                  timer?.cancel();
                },
              ),
              _buildVerticalGap(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  PimpedButton(
                    particle: DemoParticle(),
                    pimpedWidgetBuilder: (context, controller) {
                      return FloatingActionButton(
                        onPressed: () {
                          controller.forward(from: 0.0);
                        },
                      );
                    },
                  ),
                  PimpedButton(
                    particle: RectangleDemoParticle(),
                    pimpedWidgetBuilder: (context, controller) {
                      return RaisedButton(
                        onPressed: () {
                          controller.forward(from: 0.0);
                        },
                        child: Text("Special button"),
                      );
                    },
                  ),
                ],
              ),
              _buildVerticalGap(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  PimpedButton(
                    particle: Rectangle2DemoParticle(),
                    pimpedWidgetBuilder: (context, controller) {
                      return MaterialButton(
                        onPressed: () {
                          controller.forward(from: 0.0);
                        },
                        child: Text("Special button"),
                      );
                    },
                  ),
                  PimpedButton(
                    particle: Rectangle2DemoParticle(),
                    pimpedWidgetBuilder: (context, controller) {
                      return IconButton(
                        icon: Icon(Icons.favorite_border),
                        color: Colors.indigo,
                        onPressed: () {
                          controller.forward(from: 0.0);
                        },
                      );
                    },
                  )
                ],
              ),
              PimpedButton(
                particle: ListTileDemoParticle(),
                pimpedWidgetBuilder: (context, controller) {
                  return ListTile(
                    title: Text("ListTile"),
                    subtitle: Text("Some nice subtitle"),
                    trailing: Icon(Icons.add),
                    onTap: () {
                      controller.forward(from: 0.0);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalGap() {
    return SizedBox(
      height: 20.0,
    );
  }

  Widget _buildHorizontalGap() {
    return SizedBox(
      width: 20.0,
    );
  }
}
