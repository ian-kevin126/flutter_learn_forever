import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabPage();
  }
}

class _TabPage extends State<TabPage> with TickerProviderStateMixin {
  var tabs_1 = ['Android', '酒店', '火车票', '汽车票', '门票'];
  var tabs_2 = ['关注', '推荐', '日本', '东南亚', '旅拍', '亲子', '情侣', '海岛'];
  var tabController_1;
  var tabController_2;
  var curTabController;
  List<String> curTabs;

  @override
  void initState() {
    super.initState();
    tabController_1 = TabController(length: tabs_1.length, vsync: this);
    tabController_2 = TabController(length: tabs_2.length, vsync: this);
    curTabController = tabController_2;
    curTabs = tabs_2;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Page'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            _buildTab_1(context),
            _buildTab_2(context),
            Expanded(
                child: TabBarView(
                    controller: curTabController,
                    children: curTabs.map((e) {
                      return Center(
                        child: Text(
                          e,
                          style: TextStyle(fontSize: 26),
                        ),
                      );
                    }).toList()))
          ],
        ),
      ),
    );
  }

  _buildTab_1(BuildContext context) {
    return TabBar(
      isScrollable: true,
      controller: tabController_1,
      labelColor: Colors.green,
      unselectedLabelColor: Colors.black38,
      indicatorColor: Colors.amber,
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: tabs_1
          .map((e) => Tab(
                text: e,
                icon: Icon(Icons.android),
              ))
          .toList(),
      onTap: (index) {
        setState(() {
          curTabController = tabController_1;
          curTabs = tabs_1;
        });
      },
    );
  }

  _buildTab_2(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: TabBar(
          controller: tabController_2,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black,
          labelStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          unselectedLabelStyle:
              TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          indicatorColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          tabs: tabs_2
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
          onTap: (index) {
            setState(() {
              curTabController = tabController_2;
              curTabs = tabs_2;
            });
          }),
    );
  }
}
