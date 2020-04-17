import 'package:flutter/material.dart';
import 'package:popup_box/popup_box.dart';

class PopupMenu2 extends StatefulWidget {
  @override
  _PopupMenu2State createState() => _PopupMenu2State();
}

class _PopupMenu2State extends State<PopupMenu2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenu2'),
      ),
      body: Center(
        child: Text(
          'To show a popup box, click the floating action button.',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await PopupBox.showPopupBox(
              context: context,
              button: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.blue,
                child: Text(
                  'Ok',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              willDisplayWidget: Column(
                children: <Widget>[
                  Text(
                    'Hi',
                    style: TextStyle(fontSize: 40, color: Colors.black),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ));
        },
        tooltip: 'Show Popup Box',
        child: Icon(Icons.message),
      ),
    );
  }
}
