import 'package:flutter/material.dart';

import 'home_tabs/components/round_tab_indicator.dart';
import 'home_tabs/flutter_advanced.dart';
import 'home_tabs/flutter_basics.dart';
import 'home_tabs/flutter_final_fantasy.dart';
import 'home_tabs/flutter_ui_challenge.dart';

const _tabs = [
  Tab(
    icon: Icon(
      Icons.account_balance,
    ),
  ),
  Tab(
    icon: Icon(
      Icons.four_k,
    ),
  ),
  Tab(
    child: Align(
      alignment: Alignment.center,
      child: Icon(Icons.account_balance),
    ),
  ),
];

const textStyle = TextStyle(
    fontSize: 12.0,
    color: Colors.white,
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.w600);

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
//          title: Text(widget.title),
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation',
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () {},
            )
          ],
          bottom: TabBar(
            indicator: RoundUnderlineTabIndicator(
                borderSide: BorderSide(width: 3.5, color: Color(0xFFc33764))),
            labelColor: Color(0xFFc33764),
            labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            labelPadding: EdgeInsets.only(left: 0, right: 0),
            unselectedLabelColor: Colors.white70,
            unselectedLabelStyle:
                TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            tabs: [
              VgTab(
                text: "Flutter基础",
                icon: Icon(Icons.brightness_6),
              ),
              VgTab(
                text: "Flutter进阶",
                icon: Icon(Icons.brightness_5),
              ),
              VgTab(
                text: "Challenges",
                icon: Icon(Icons.brightness_4),
              ),
              VgTab(
                text: "最终幻想",
                icon: Icon(Icons.brightness_7),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text('User Name'),
                accountEmail: new Text('email@example.com'),
//                currentAccountPicture:
//                    new CircleAvatar(backgroundImage: new AssetImage(_kAsset0)),
//                otherAccountsPictures: <Widget>[
//                  new CircleAvatar(backgroundImage: new AssetImage(_kAsset1)),
//                  new CircleAvatar(backgroundImage: new AssetImage(_kAsset2)),
//                ],
//                onDetailsPressed: () {},
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            FlutterBasics(),
            FlutterAdvanced(),
            FlutterUIChallenge(),
            FlutterFinalFantasy(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Color(0xFFc33764)),
                onPressed: () {},
              ),
              SizedBox(), //中间位置空出
              IconButton(
                icon: Icon(Icons.business, color: Color(0xFFc33764)),
                onPressed: () {},
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Color(0xFFc33764)),
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
