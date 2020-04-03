import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappreview/common/common.dart';
import 'package:flutterappreview/pages/basics/animations/animation_basics.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/button_demo.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/card_demo.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/data_table_demo.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/dialog_demo.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/flutter_MDC.dart';
import 'package:flutterappreview/pages/basics/http_request/http_demo.dart';
import 'package:flutterappreview/pages/basics/http_request/http_test.dart';
import 'package:flutterappreview/pages/basics/state_management/Bloc/bloc.dart';
import 'package:flutterappreview/pages/basics/state_management/Bloc/bloc_demo_one.dart';
import 'package:flutterappreview/pages/basics/state_management/inherited_widget_demo.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/input_widget_demo.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/sliver_demo.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/sliver_family.dart';
import 'package:flutterappreview/pages/basics/state_management/provider_demo.dart';
import 'package:flutterappreview/pages/basics/state_management/scoped_model.dart';
import 'package:flutterappreview/pages/basics/state_management/scoped_model/index.dart';
import 'package:flutterappreview/pages/basics/state_management/state_management_demo.dart';
import 'package:flutterappreview/pages/basics/state_management/stream/stream_demo-three.dart';
import 'package:flutterappreview/pages/basics/state_management/stream/stream_demo_four.dart';
import 'package:flutterappreview/pages/basics/state_management/stream/stream_demo_two.dart';
import 'package:flutterappreview/pages/basics/state_management/stream/stream_demo_one.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/stepper_demo.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/text_field_demo.dart';

class FlutterBasics extends StatefulWidget {
  @override
  _FlutterBasicsState createState() => _FlutterBasicsState();
}

class _FlutterBasicsState extends State<FlutterBasics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Wrap(
          children: <Widget>[
            commonCategoryTitle(context, '一  组件基础'),
            commonRouteFunc(context, '1.SliverFamily', SliverFamily()),
            commonRouteFunc(context, '2.Sliver', SliverDemoWidget()),
            commonRouteFunc(context, '3.TextField', FormDemo()),
            commonRouteFunc(context, '4.Button', ButtonDemo()),
            commonRouteFunc(context, '5.InputWidget', InputWidgetDemo()),
            commonRouteFunc(context, '6.Dialog', DialogDemo()),
            commonRouteFunc(context, '7.Flutter_MDC', FlutterMaterialDesignComponent()),
            commonRouteFunc(context, '8.DataTable', DataTableDemo()),
            commonRouteFunc(context, '9.Card', CardDemo()),
            commonRouteFunc(context, '10.Stepper', StepperDemo()),
            commonRouteFunc(context, '11.Stepper', StepperDemo()),
            commonCategoryTitle(context, '二  状态管理'),
            commonRouteFunc(context, '1.StateManagement', StateManagementDemo()),
            commonRouteFunc(context, '2.InheritedWidget', InheritedWidgetDemo()),
            commonRouteFunc(context, '3.ScopedModel_1', ScopedModelDemo()),
            commonRouteFunc(context, '4.ScopedModel_2', MyScopedModelDemo()),
            commonRouteFunc(context, '5.Provider', ProviderDemo()),
            commonRouteFunc(context, '6.Stream_1', StreamDemoOne()),
            commonRouteFunc(context, '7.Stream_2', StreamDemoTwo()),
            commonRouteFunc(context, '8.Stream_3', StreamDemoThree()),
            commonRouteFunc(context, '9.Stream_4', StreamDemoFour()),
            commonRouteFunc(context, '10.Bloc_1', BlocDemo()),
            commonRouteFunc(context, '11.Bloc_2', BlocDemoOne()),
            commonCategoryTitle(context, '三  网络请求'),
            commonRouteFunc(context, '1.Http', HttpDemo()),
            commonRouteFunc(context, '2.HttpTest', HttpTestDemo()),
            commonCategoryTitle(context, '四  Flutter动画'),
            commonRouteFunc(context, '1.AnimationBasics', AnimationBasics()),
          ],
        ),
      ),
    ));
  }
}
