import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RegisterDemo(),
          ],
        ),
      ),

      /// 这里可以设置局部的颜色，供子元素使用
//      body: Theme(
//        data: ThemeData(
//          primaryColor: Colors.black38
//        ),
//        child: TextFieldDemo(),
//      ),
    );
  }
}

class RegisterDemo extends StatefulWidget {
  @override
  _RegisterDemoState createState() => _RegisterDemoState();
}

class _RegisterDemoState extends State<RegisterDemo> {
  final registerFormKey = GlobalKey<FormState>();

  String username, password;

  bool autoValidator = false;

  void submitRegisterForm() {
    // 验证输入内容符合规则，符合返回true，否则false
    if (registerFormKey.currentState.validate()) {
      // 保存Form表单里当前填写的值
      registerFormKey.currentState.save();

      debugPrint('userName: $username');
      debugPrint('password: $password');

      // 验证成功在底部发出提示
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Registering...'),
      ));
    } else {
      setState(() {
        autoValidator = true;
      });
    }
  }

  String validateUsername(value) {
    if (value.isEmpty) {
      return 'UserName is required.';
    }

    return null;
  }

  String validatePassword(value) {
    if (value.isEmpty) {
      return 'Password is required.';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                labelText: 'UserName',
                // 添加helperText可以使警告更自然一些
                helperText: ''),
            onSaved: (value) {
              username = value;
            },
            validator: validateUsername,
            // 自动验证
            autovalidate: autoValidator,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'PassWord', helperText: ''),
            onSaved: (value) {
              password = value;
            },
            validator: validatePassword,
            autovalidate: autoValidator,
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              elevation: 0.0,
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: submitRegisterForm,
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  /// 文本控制器，可以设置文本的初始值，以及监听文本的变化
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
//    textEditingController.text = 'hi';
    textEditingController.addListener(() {
      debugPrint('text: ${textEditingController.text}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,

      /// 监听输入的onChange事件
//      onChanged: (value) {
//        debugPrint('input: $value');
//      },
      /// 监听键盘的提交事件
      onSubmitted: (value) {
        debugPrint('submit: $value');
      },
      decoration: InputDecoration(
        icon: Icon(Icons.account_circle),
        labelText: "Name",
//        border: InputBorder.none    // 不带下划线的输入框
        border: OutlineInputBorder(),
        filled: true, // 带一个灰色的 背景
      ), // 四周// 都有边框的输入框
    );
  }
}

class ThemeDemo extends StatefulWidget {
  @override
  _ThemeDemoState createState() => _ThemeDemoState();
}

class _ThemeDemoState extends State<ThemeDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      /// 若父组件没有设置局部颜色，这里会使用在main文件里定义的全局颜色
//      color: Theme.of(context).primaryColor,
      color: Theme.of(context).accentColor,
      child: TextField(),
    );
  }
}
