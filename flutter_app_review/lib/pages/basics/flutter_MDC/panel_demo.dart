import 'package:flutter/material.dart';

class PanelDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PanelDemo'),
      ),
      body: PanelDemoHome(),
    );
  }
}

class PanelDemoHome extends StatefulWidget {
  @override
  _PanelDemoHomeState createState() => _PanelDemoHomeState();
}

class _PanelDemoHomeState extends State<PanelDemoHome> {
  bool _isExpanded = false;
  List<ExpansionItem> _expansionItems;

  @override
  void initState() {
    super.initState();
    _expansionItems = <ExpansionItem>[
      ExpansionItem(
          headerText: 'Panel A',
          expansionBody: Container(
            child: Text('This is a Panel AAAA'),
            padding: EdgeInsets.all(12.0),
            width: double.infinity,
          ),
          isExpanded: false),
      ExpansionItem(
          headerText: 'Panel B',
          expansionBody: Container(
            child: Text('This is a Panel BBBB'),
            padding: EdgeInsets.all(12.0),
            width: double.infinity,
          ),
          isExpanded: false),
      ExpansionItem(
          headerText: 'Panel C',
          expansionBody: Container(
            child: Text('This is a Panel CCCC'),
            padding: EdgeInsets.all(12.0),
            width: double.infinity,
          ),
          isExpanded: false)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ExpansionPanelList(
            expansionCallback: (int panelIndex, bool isExpanded) {
              setState(() {
                _expansionItems[panelIndex].isExpanded = !isExpanded;
              });
            },
            children: _expansionItems.map((ExpansionItem item) {
              return ExpansionPanel(
                  body: item.expansionBody,
                  isExpanded: item.isExpanded,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        item.headerText,
                        style: Theme.of(context).textTheme.title,
                      ),
                    );
                  });
            }).toList(),
          )
        ],
      ),
    );
  }
}

class ExpansionItem {
  String headerText;
  Widget expansionBody;
  bool isExpanded;

  ExpansionItem({this.headerText, this.expansionBody, this.isExpanded});
}
