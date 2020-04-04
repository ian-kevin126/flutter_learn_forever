import 'package:flutter/material.dart';

class ScaffoldPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaffoldPage();
  }
}

class _ScaffoldPage extends State<ScaffoldPage>
    with SingleTickerProviderStateMixin {
  var tabs = ["单程", "往返", "多程"];
  TabController tabController;
  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanffold Page'),
        // 返回
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.pop(context);
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
              tooltip: 'Share Button Clicked!')
        ],
//        flexibleSpace: FlexibleSpaceBar(
//          title: Text('FlexibleSpaceBar'),
//          titlePadding: EdgeInsets.all(20),
//          collapseMode: CollapseMode.parallax,
//        ),
        elevation: 5.0,
        backgroundColor: Colors.yellow,
        brightness: Brightness.dark,
        titleSpacing: -10,
        toolbarOpacity: 1.0,
        bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.white,
            controller: tabController,
            tabs: tabs.map((e) => Tab(child: Text(e,style: TextStyle(fontSize: 20),))).toList()),
      ),
      body: TabBarView(controller: tabController, children: [
        Center(
          child: Text(
            '单程',
            style: TextStyle(fontSize: 80),
          ),
        ),
        Center(
          child: Text(
            '往返',
            style: TextStyle(fontSize: 80),
          ),
        ),
        Center(
          child: Text(
            '多程',
            style: TextStyle(fontSize: 80),
          ),
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home)
                // 选中时
              , activeIcon: Icon(Icons.pages)
              , title: Text('首页')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('收藏')),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart), title: Text('订单')),
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
