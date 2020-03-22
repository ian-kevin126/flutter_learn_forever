import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappreview/common/common.dart';
import 'package:flutterappreview/pages/basics/button_demo.dart';
import 'package:flutterappreview/pages/basics/card_demo.dart';
import 'package:flutterappreview/pages/basics/data_table_demo.dart';
import 'package:flutterappreview/pages/basics/dialog_demo.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC.dart';
import 'package:flutterappreview/pages/basics/input_widget_demo.dart';
import 'package:flutterappreview/pages/basics/sliver_demo.dart';
import 'package:flutterappreview/pages/basics/sliver_family.dart';
import 'package:flutterappreview/pages/basics/stepper_demo.dart';
import 'package:flutterappreview/pages/basics/text_field_demo.dart';

class FlutterAdvanced extends StatefulWidget {
  @override
  _FlutterAdvancedState createState() => _FlutterAdvancedState();
}

class _FlutterAdvancedState extends State<FlutterAdvanced> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Wrap(
            children: <Widget>[
              commonRouteFunc(context, '1.Sliver家族', SliverFamily()),
              commonRouteFunc(context, '2.SliverDemo', SliverDemoWidget()),
              commonRouteFunc(context, '3.TextFieldDemo', FormDemo()),
              commonRouteFunc(context, '4.ButtonDemo', ButtonDemo()),
              commonRouteFunc(context, '5.InputWidgetDemo', InputWidgetDemo()),
              commonRouteFunc(context, '6.DialogDemo', DialogDemo()),
              commonRouteFunc(
                  context, '7.Flutter_MDC', FlutterMaterialDesignComponent()),
              commonRouteFunc(context, '8.DataTable', DataTableDemo()),
              commonRouteFunc(context, '9.CardDemo', CardDemo()),
              commonRouteFunc(context, '10.StepperDemo', StepperDemo()),
            ],
          ),
        ));
  }
}
