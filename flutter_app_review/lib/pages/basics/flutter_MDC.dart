import 'package:flutter/material.dart';
import 'package:flutterappreview/common/common.dart';

class FlutterMaterialDesignComponent extends StatefulWidget {
  @override
  _FlutterMaterialDesignComponentState createState() =>
      _FlutterMaterialDesignComponentState();
}

class _FlutterMaterialDesignComponentState
    extends State<FlutterMaterialDesignComponent> {
  List<String> _tags = ['苹果', '小米', '华为'];
  String _action = '';
  List<String> _selected = [];
  String _choiceChip = '苹果';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = ['苹果', '小米', '华为'];
            _selected = [];
          });
        },
      ),
      appBar: AppBar(
        title: Text('FlutterMaterialDesignComponent'),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[chipDemo()],
        ),
      )),
    );
  }

  // ChipDemo
  Widget chipDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        commonTitle('1.Chip：'),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 8.0, // 横向间隔
          runSpacing: 8.0, // 纵向间隔
          children: <Widget>[
            Chip(
              label: Text('玄天宗'),
            ),
            Chip(
              label: Text(
                '月金轮',
                style: TextStyle(color: Colors.white70),
              ),
              backgroundColor: Colors.black,
            ),
            Chip(
              label: Text('玄天宗'),
              avatar: CircleAvatar(
                backgroundImage: NetworkImage(
                    'http://b-ssl.duitang.com/uploads/item/201410/09/20141009224754_AswrQ.jpeg'),
              ),
            ),
            Chip(
              label: Text(
                '删除',
                style: TextStyle(color: Colors.white70),
              ),
              backgroundColor: Colors.black,
              onDeleted: () {},
              deleteIcon: Icon(Icons.delete),
              deleteIconColor: Colors.white70,
              deleteButtonTooltipMessage: '确定删除吗？',
            ),
            Wrap(
              spacing: 8.0,
              children: _tags.map((tag) {
                return Chip(
                  label: Text(tag),
                  onDeleted: () {
                    setState(() {
                      _tags.remove(tag);
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Text('选择的ActionChip是：$_action'),
        ),
        Wrap(
          spacing: 8.0,
          children: _tags.map((tag) {
            return ActionChip(
              label: Text(tag),
              onPressed: () {
                setState(() {
                  _action = tag;
                });
              },
            );
          }).toList(),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Text('选择的FilterChip是：${_selected.toString()}'),
        ),
        Wrap(
          spacing: 8.0,
          children: _tags.map((tag) {
            return FilterChip(
                label: Text(tag),
                selected: _selected.contains(tag),
                onSelected: (value) {
                  if (value) {
                    setState(() {
                      _selected.remove(tag);
                    });
                  } else {
                    setState(() {
                      _selected.add(tag);
                    });
                  }
                });
          }).toList(),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Text('选择的ChoiceChip是：${_choiceChip}'),
        ),
        Wrap(
          spacing: 8.0,
          children: _tags.map((tag) {
            return ChoiceChip(
                label: Text(tag),
                selectedColor: Colors.black,
                selected: _choiceChip == tag,
                onSelected: (value) {
                  if (value) {
                    setState(() {
                      _choiceChip = tag;
                    });
                  }
                });
          }).toList(),
        ),
        commonTitle('2.Divider：'),
        Divider(
          color: Colors.grey,
          thickness: 3.0,
          height: 10.0,
          indent: 50.0,
          endIndent: 50.0,
        ),
      ],
    );
  }
}
