import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationPage();
  }
}

class _NotificationPage extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notification Demo'),
        ),
        body: _buildBody(context));
  }

  _buildBody(BuildContext context) {
    return NotificationListener(
        onNotification: (notify) {
          switch (notify.runtimeType) {
            case ScrollStartNotification:
              print("ScrollStart");
              break;
            case ScrollUpdateNotification:
              print("ScrollUpdate");
              break;
            case ScrollEndNotification:
              print("ScrollEnd");
              break;
            case OverscrollNotification:
              print("Overscroll");
              break;
            case LayoutChangedNotification:
              print("LayoutChanged");
              break;
            case SizeChangedLayoutNotification:
              print("SizeChangedLayout");
              break;
            case UserScrollNotification:
              print("UserScroll");
              break;
            case KeepAliveNotification:
              print("KeepAlive");
              break;
            case MyNotification:
              print("CustomScroll");
              break;
          }
        },
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
//          child: builderChild_1(),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int position) {
              return Text(
                'item_${position}',
                style: TextStyle(fontSize: 50),
              );
            },
            itemCount: 20,
          ),
        ));
  }

  builderChild_1() {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          MyNotification('Hahaha').dispatch(context);
        },
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),
      );
    });
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}
