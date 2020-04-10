
import 'package:flutter/material.dart';

class ButtonDemo extends StatefulWidget {
  @override
  _ButtonDemoState createState() => _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {
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
          padding: EdgeInsets.all(20.0),
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
              Container(
                child: PopUpMenuButtonDemo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PopUpMenuButtonDemo extends StatefulWidget {
  @override
  _PopUpMenuButtonDemoState createState() => _PopUpMenuButtonDemoState();
}

class _PopUpMenuButtonDemoState extends State<PopUpMenuButtonDemo> {
  String _selectedMenu = 'Home';

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        height: 200,
        child: Container(
          width: 160,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(100.0))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_selectedMenu),
              PopupMenuButton(
                onSelected: (val) {
                  _selectedMenu = val;
                  setState(() {});
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 'Home',
                    child: Text('Home'),
                  ),
                  PopupMenuItem(
                    value: 'About',
                    child: Text('About'),
                  ),
                  PopupMenuItem(
                    value: 'Link',
                    child: Text('Link'),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
