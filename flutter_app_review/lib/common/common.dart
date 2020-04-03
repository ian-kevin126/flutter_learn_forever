import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget commonRouteFunc(context, title, Widget Demo) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
    decoration: BoxDecoration(color: Color(0xFF27262B), borderRadius: BorderRadius.all(Radius.circular(30.0))),
    child: InkWell(
      onTap: () {
        goto(context, Demo);
      },
      child: Text(title, style: TextStyle(color: Color(0xFFDBA589), fontWeight: FontWeight.bold)),
    ),
  );
}

// 分类title
Widget commonCategoryTitle(context, title) {
  return Container(
    alignment: Alignment.center,
    child: Theme(
      data: Theme.of(context).copyWith(
          buttonColor: Theme.of(context).accentColor,
          buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))))),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Text(
          title,
          style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w800),
        ),
        onPressed: () {},
      ),
    ),
  );
}

/// 跳转页面
Future goto(BuildContext context, Widget wid) {
  return Navigator.of(context).push(new CupertinoPageRoute(builder: (c) => wid));
}

Widget commonTitle(title) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 18.0,
          width: 5.0,
          decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(3.0))),
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}
