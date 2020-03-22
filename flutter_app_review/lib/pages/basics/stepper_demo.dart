import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(16.0),
            // 改变激活步骤的序号背景色，不设置这个，默认是黄色的
            child: Theme(
              data: Theme.of(context).copyWith(primaryColor: Colors.black),
              child: Stepper(
                  currentStep: _currentStep,
                  onStepTapped: (int index) {
                    setState(() {
                      _currentStep = index;
                    });
                  },
                  onStepContinue: () {
                    setState(() {
                      _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                    });
                  },
                  onStepCancel: () {
                    setState(() {
                      _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                    });
                  },
                  steps: [
                    Step(
                        title: Text('登录'),
                        subtitle: Text('没有账号？去注册'),
                        content: Text('注册成为终生超级会员，享受免费、高速的下载服务以及海量的视频资源！'),
                        isActive: _currentStep == 0),
                    Step(
                        title: Text('登录'),
                        subtitle: Text('没有账号？去注册'),
                        content: Text('注册成为终生超级会员，享受免费、高速的下载服务以及海量的视频资源！'),
                        isActive: _currentStep == 1),
                    Step(
                        title: Text('登录'),
                        subtitle: Text('没有账号？去注册'),
                        content: Text('注册成为终生超级会员，享受免费、高速的下载服务以及海量的视频资源！'),
                        isActive: _currentStep == 2)
                  ]),
            )),
      ),
    );
  }
}
