import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputWidgetDemo extends StatefulWidget {
  @override
  _InputWidgetDemoState createState() => _InputWidgetDemoState();
}

class _InputWidgetDemoState extends State<InputWidgetDemo> {
  bool _isChecked = false;
  bool _isCheckedA = false;

  int _radioChecked = 0;

  int _radioCheckedA = 0;

  bool _isSwitched = false;

  bool _isSwitchedA = false;

  double _sliderValue = 1.0;

  DateTime _selectedTime = DateTime.now();
  TimeOfDay _selectedDay = TimeOfDay(hour: 9, minute: 30);

  void _radioValueOnChange(int value) {
    setState(() {
      _radioChecked = value;
    });
  }

  void _radioValueOnChangeHandler(int value) {
    setState(() {
      _radioCheckedA = value;
    });
  }

  _showDatePicker() async {
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: _selectedTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (date == null) return;
    setState(() {
      _selectedTime = date;
    });
  }

  _selectedDayTime() async {
    final TimeOfDay day = await showTimePicker(
      context: context,
      initialTime: _selectedDay,
    );

    if (day == null) return;
    setState(() {
      _selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InputWidgetDemo'),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.redAccent)),
              child: Column(
                children: <Widget>[
                  Checkbox(
                    value: _isChecked,
                    onChanged: (val) {
                      setState(() {
                        _isChecked = val;
                      });
                    },
                    activeColor: Colors.black,
                  ),
                  CheckboxListTile(
                    value: _isCheckedA,
                    onChanged: (val) {
                      setState(() {
                        _isCheckedA = val;
                      });
                    },
                    title: Text('标题'),
                    subtitle: Text('副标题'),
                    secondary: Icon(Icons.bookmark),
                    activeColor: Colors.blue,
                    selected: _isCheckedA,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.blueAccent)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _radioChecked,
                    activeColor: Colors.red,
                    onChanged: _radioValueOnChange,
                  ),
                  Radio(
                    value: 1,
                    groupValue: _radioChecked,
                    activeColor: Colors.red,
                    onChanged: _radioValueOnChange,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.blueAccent)),
              child: Column(
                children: <Widget>[
                  RadioListTile(
                    value: 0,
                    groupValue: _radioCheckedA,
                    activeColor: Colors.teal,
                    title: Text('标题1'),
                    subtitle: Text('副标题2'),
                    secondary: Icon(Icons.filter_1),
                    selected: _radioCheckedA == 0,
                    onChanged: _radioValueOnChangeHandler,
                  ),
                  RadioListTile(
                    value: 1,
                    groupValue: _radioCheckedA,
                    activeColor: Colors.teal,
                    title: Text('标题2'),
                    subtitle: Text('副标题2'),
                    secondary: Icon(Icons.filter_2),
                    selected: _radioCheckedA == 1,
                    onChanged: _radioValueOnChangeHandler,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.purple)),
              child: Column(
                children: <Widget>[
                  Switch(
                    value: _isSwitched,
                    onChanged: (value) {
                      setState(() {
                        _isSwitched = value;
                      });
                    },
                    activeColor: Colors.redAccent,
                  ),
                  SwitchListTile(
                    value: _isSwitchedA,
                    onChanged: (value) {
                      setState(() {
                        _isSwitchedA = value;
                      });
                    },
                    activeColor: Colors.redAccent,
                    title: Text('开关标题'),
                    subtitle: Text('开关副标题'),
                    selected: _isSwitchedA,
                    secondary: _isSwitchedA
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.purple)),
              child: Column(
                children: <Widget>[
                  Text('滑动组件的值：${_sliderValue.toStringAsFixed(2)}'),
                  Slider(
                    value: _sliderValue,
                    onChanged: (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                    activeColor: Colors.redAccent,
                    inactiveColor: Colors.teal,
                    min: 0.0,
                    max: 100.0,
                    divisions: 20,
                    label: '${_sliderValue.toStringAsFixed(0)}',
                  ),
                  CupertinoSlider(
                    value: _sliderValue,
                    onChanged: (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                    activeColor: Colors.redAccent,
                    min: 0.0,
                    max: 100.0,
                    divisions: 20,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.purple)),
              child: Column(
                children: <Widget>[
                  Text('日期选择器'),
                  InkWell(
                    onTap: _showDatePicker,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('${DateFormat.yMMMMd().format(_selectedTime)}'),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: _selectedDayTime,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(_selectedDay.format(context)),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
