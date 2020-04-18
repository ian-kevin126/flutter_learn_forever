import 'package:flutter/material.dart';
import 'package:expandable_card/expandable_card.dart';

class ExpandableCardDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpandableCardDemo'),
      ),
      body: ExpandableCardPage(
        page: Center(
          child: Text("Background page"),
        ),
        expandableCard: ExpandableCard(
          minHeight: 200,
          children: <Widget>[Text("Hello world")],
        ),
      ),
    );
  }
}
