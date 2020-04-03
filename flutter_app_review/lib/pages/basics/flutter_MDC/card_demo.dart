import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappreview/model/post.dart';

class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: posts.map((item) {
            return Card(
              child: Column(
                children: <Widget>[
                  AspectRatio(
                      aspectRatio: 16 / 9,
                      // Card组件的顶部两个圆角被图片覆盖，这时候就要采用ClipRRect去强行切两个圆角。
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0)),
                        child: Image.network(
                          item.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      )),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(item.imageUrl),
                    ),
                    title: Text(item.title),
                    subtitle: Text(item.content),
                  ),
                  Container(
//                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Text(
                      item.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        child: Text('SHARE', semanticsLabel: 'Share'),
                        textColor: Colors.blueAccent,
                        onPressed: () {
                          print('pressed');
                        },
                      ),
                      FlatButton(
                        child: Text('EXPLORE', semanticsLabel: 'Explore'),
                        textColor: Colors.blueAccent,
                        onPressed: () {
                          print('pressed');
                        },
                      ),
                    ],
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
