import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageViewPage();
  }
}

class _PageViewPage extends State<PageViewPage> {
  var pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView Page'),
      ),
      body: Container(
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: pageController,
          children: <Widget>[
            _buildPage_1(context),
            _buildPage_2(context),
            _buildPage_3(context),
          ],
        ),
      ),
    );
  }

  _buildPage_1(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          // 1
          Container(
              margin: EdgeInsets.only(bottom: 30),
              height: 80,
              color: Colors.blueAccent),
          // 2
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 150,
                      color: Colors.blue[200])),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 150,
                      color: Colors.blue[200])),
            ],
          ),
          // 3
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            margin: EdgeInsets.only(top: 30, bottom: 30),
            height: 100,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                    )),
                Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                    )),
              ],
            ),
          ),
          // 4
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 200,
                      color: Colors.blue[200])),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 200,
                      color: Colors.blue[200])),
            ],
          ),
        ],
      ),
    );
  }

  _buildPage_2(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      alignment: Alignment.center,
      color: Colors.blue,
      child: Text(
        'PageView',
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }

  _buildPage_3(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: PageController(),
      itemBuilder: (BuildContext context, int index) {
        return _buildPage_2(context);
      },
      itemCount: 5,
    );
  }

//  _buildPage_4(BuildContext context) {
//    return SingleChildScrollView(
//      controller: PageController(
//        initialPage:
//      ),
//      child: ,
//    )
//  }
}
