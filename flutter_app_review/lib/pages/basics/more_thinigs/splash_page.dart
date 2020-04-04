import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashPage();
  }
}

class _SplashPage extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Stack(
        alignment: Alignment(0, 0.5),
        children: <Widget>[
          SizedBox.expand(
            child: ClipRect(
                child: Image.asset(
              "images/splash1.jpg",
              fit: BoxFit.cover,
            )),
          ),
          GestureDetector(
            // 设置点击事件
            onTap: () {
//              jumpToHome(context);
            },
            child: Container(
                padding:
                    EdgeInsets.only(left: 32, top: 12, right: 32, bottom: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.cyan[300],
                      Colors.green[300],
                      Colors.red[300]
                    ],
                  ),
                ),
                child: Text(
                  'Welcome',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
          ),
        ],
      ),
    );
  }

//  void jumpToHome(BuildContext context) {
//    // 使用 Navigator 跳转页面
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => HomePage()));
//  }
}
