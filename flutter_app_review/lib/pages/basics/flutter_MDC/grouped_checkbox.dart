import 'package:flutter/material.dart';
import 'package:grouped_checkbox/grouped_checkbox.dart';

class GroupedCheckboxDemo extends StatefulWidget {

  @override
  _GroupedCheckboxDemoState createState() => _GroupedCheckboxDemoState();
}

class _GroupedCheckboxDemoState extends State<GroupedCheckboxDemo> {
  List<String> allItemList = [
    'Red',
    'Green',
    'Blue',
    'Yellow',
    'Black',
    'Violet',
  ];

  static List<String> checkedItemList = ['Green', 'Yellow'];

  List<String> selectedItemList = checkedItemList ?? [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GroupedCheckboxDemo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Text(
                'VERTICAL ORIENTATION EXAMPLE',
                style: TextStyle(color: Colors.blue, fontSize: 15.0),
              ),
            ),
            GroupedCheckbox(
              wrapSpacing: 10.0,
              wrapRunSpacing: 15.0,
              wrapTextDirection: TextDirection.ltr,
              wrapRunAlignment: WrapAlignment.center,
              wrapVerticalDirection: VerticalDirection.down,
              wrapAlignment: WrapAlignment.center,
              itemList: allItemList,
              checkedItemList: checkedItemList,
              disabled: ['Black'],
              onChanged: (itemList) {
                setState(() {
                  selectedItemList = itemList;
                  print('SELECTED ITEM LIST $itemList');
                });
              },
              orientation: CheckboxOrientation.VERTICAL,
              checkColor: Colors.purpleAccent,
              activeColor: Colors.lightBlue,
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Selected Items:',
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(width: 4.0),
                  Expanded(
                    child: Text('$selectedItemList'),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Divider(
                height: 2.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                'HORIZONTAL ORIENTATION EXAMPLE',
                style: TextStyle(color: Colors.blue, fontSize: 15.0),
              ),
            ),
            GroupedCheckbox(
              itemList: allItemList,
              checkedItemList: checkedItemList,
              disabled: ['Black'],
              onChanged: (itemList) {
                setState(() {
                  selectedItemList = itemList;
                  print('SELECTED ITEM LIST $itemList');
                });
              },
              orientation: CheckboxOrientation.HORIZONTAL,
              checkColor: Colors.purpleAccent,
              activeColor: Colors.lightBlue,
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Selected Items:',
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(width: 4.0),
                  Expanded(
                    child: Text('$selectedItemList'),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Divider(
                height: 2.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                'WRAP EXAMPLE',
                style: TextStyle(color: Colors.blue, fontSize: 15.0),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              child: GroupedCheckbox(
                wrapSpacing: 10.0,
                wrapRunSpacing: 15.0,
                wrapTextDirection: TextDirection.ltr,
                wrapRunAlignment: WrapAlignment.center,
                wrapVerticalDirection: VerticalDirection.down,
                wrapAlignment: WrapAlignment.center,
                itemList: allItemList,
                checkedItemList: checkedItemList,
                disabled: ['Black'],
                onChanged: (itemList) {
                  setState(() {
                    selectedItemList = itemList;
                    print('SELECTED ITEM LIST $itemList');
                  });
                },
                orientation: CheckboxOrientation.WRAP,
                checkColor: Colors.purpleAccent,
                activeColor: Colors.lightBlue,
              ),
            ),
            SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Selected Items:',
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(width: 4.0),
                  Expanded(
                    child: Text('$selectedItemList'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}