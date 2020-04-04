import 'package:flutter/material.dart';

class ClipXXXPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ClipXXXPage();
  }
}

class _ClipXXXPage extends State<ClipXXXPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ClipXXX Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 6),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Image.asset('images/pic2.jpg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 6, bottom: 6),
                child: ClipOval(
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset('images/pic2.jpg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 6, bottom: 6),
                child: ClipPath(
                  clipper: ShapeBorderClipper(shape: CircleBorder()),
                  child: Image.asset('images/pic2.jpg'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
