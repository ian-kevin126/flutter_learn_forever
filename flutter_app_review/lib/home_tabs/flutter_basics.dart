import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappreview/common/common.dart';
import 'package:flutterappreview/pages/basics/button_demo.dart';
import 'package:flutterappreview/pages/basics/card_demo.dart';
import 'package:flutterappreview/pages/basics/data_table_demo.dart';
import 'package:flutterappreview/pages/basics/dialog_demo.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC.dart';
import 'package:flutterappreview/pages/basics/state_management/inherited_widget_demo.dart';
import 'package:flutterappreview/pages/basics/input_widget_demo.dart';
import 'package:flutterappreview/pages/basics/sliver_demo.dart';
import 'package:flutterappreview/pages/basics/sliver_family.dart';
import 'package:flutterappreview/pages/basics/state_management/provider_demo.dart';
import 'package:flutterappreview/pages/basics/state_management/scoped_model.dart';
import 'package:flutterappreview/pages/basics/state_management/scoped_model/index.dart';
import 'package:flutterappreview/pages/basics/state_management/state_management_demo.dart';
import 'package:flutterappreview/pages/basics/state_management/stream/stream_demo.dart';
import 'package:flutterappreview/pages/basics/state_management/stream/stream_test.dart';
import 'package:flutterappreview/pages/basics/stepper_demo.dart';
import 'package:flutterappreview/pages/basics/text_field_demo.dart';

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
            commonRouteFunc(context, '1.Sliver家族', SliverFamily()),
            commonRouteFunc(context, '2.SliverDemo', SliverDemoWidget()),
            commonRouteFunc(context, '3.TextFieldDemo', FormDemo()),
            commonRouteFunc(context, '4.ButtonDemo', ButtonDemo()),
            commonRouteFunc(context, '5.InputWidgetDemo', InputWidgetDemo()),
            commonRouteFunc(context, '6.DialogDemo', DialogDemo()),
            commonRouteFunc(context, '7.Flutter_MDC', FlutterMaterialDesignComponent()),
            commonRouteFunc(context, '8.DataTable', DataTableDemo()),
            commonRouteFunc(context, '9.CardDemo', CardDemo()),
            commonRouteFunc(context, '10.StepperDemo', StepperDemo()),
            commonRouteFunc(context, '11.StepperDemo', StepperDemo()),
            commonRouteFunc(context, '12.StateManagement', StateManagementDemo()),
            commonRouteFunc(context, '13.InheritedWidget', InheritedWidgetDemo()),
            commonRouteFunc(context, '14.ScopedModelDemo1', ScopedModelDemo()),
            commonRouteFunc(context, '14.ScopedModelDemo2', MyScopedModelDemo()),
            commonRouteFunc(context, '15.ProviderDemo', ProviderDemo()),
            commonRouteFunc(context, '16.StreamDemo1', StreamTest()),
            commonRouteFunc(context, '16.StreamDemo2', StreamDemo()),
          ],
        ),
      ),
    ));
  }
}
