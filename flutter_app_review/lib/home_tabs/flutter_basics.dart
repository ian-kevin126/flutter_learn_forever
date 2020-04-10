import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappreview/common/common.dart';
import 'package:flutterappreview/pages/basics/animations/Animation_two.dart';
import 'package:flutterappreview/pages/basics/animations/animation_basics.dart';
import 'package:flutterappreview/pages/basics/animations/animation_one.dart';
import 'package:flutterappreview/pages/basics/animations/staggered_animation.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/button_demo.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/card_demo.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/data_table_demo.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/dialog_demo.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/flutter_MDC.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/panel_demo.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/scollable_test.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/scroll_controller_test.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/willpopscope.dart';
import 'package:flutterappreview/pages/basics/http_request/http_demo.dart';
import 'package:flutterappreview/pages/basics/http_request/http_test.dart';
import 'package:flutterappreview/pages/basics/more_thinigs/backdrop_filter_page.dart';
import 'package:flutterappreview/pages/basics/more_thinigs/clip_xxx_page.dart';
import 'package:flutterappreview/pages/basics/more_thinigs/custom_paint_page2.dart';
import 'package:flutterappreview/pages/basics/more_thinigs/custom_painter_page.dart';
import 'package:flutterappreview/pages/basics/more_thinigs/custom_scroll_view_page.dart';
import 'package:flutterappreview/pages/basics/more_thinigs/file_demo.dart';
import 'package:flutterappreview/pages/basics/more_thinigs/http_demo.dart';
import 'package:flutterappreview/pages/basics/more_thinigs/list_view_page.dart';
import 'package:flutterappreview/pages/basics/more_thinigs/notification_demo.dart';
import 'package:flutterappreview/pages/basics/more_thinigs/page_view_demo.dart';
import 'package:flutterappreview/pages/basics/more_thinigs/scanffold_page.dart';
import 'package:flutterappreview/pages/basics/more_thinigs/single_child_scroll_view_page.dart';
import 'package:flutterappreview/pages/basics/more_thinigs/splash_page.dart';
import 'package:flutterappreview/pages/basics/more_thinigs/tab_page.dart';
import 'package:flutterappreview/pages/basics/more_thinigs/test_page.dart';
import 'package:flutterappreview/pages/basics/state_management/Bloc/bloc.dart';
import 'package:flutterappreview/pages/basics/state_management/Bloc/bloc_demo_one.dart';
import 'package:flutterappreview/pages/basics/state_management/inherited_widget_demo.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/input_widget_demo.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/sliver_demo.dart';
import 'package:flutterappreview/pages/basics/flutter_MDC/sliver_family.dart';
import 'package:flutterappreview/pages/basics/state_management/provider/index.dart';
import 'package:flutterappreview/pages/basics/state_management/provider_demo.dart';
import 'package:flutterappreview/pages/basics/state_management/redux/index.dart';
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
            commonRouteFunc(context, '12.ListView', ListViewPage()),
            commonRouteFunc(context, '13.PageView', PageViewPage()),
            commonRouteFunc(context, '14.Scaffold', ScaffoldPage()),
            commonRouteFunc(context, '15.SingleChildScrollView', SingleChildScrollViewPage()),
            commonRouteFunc(context, '16.Splash', SplashPage()),
            commonRouteFunc(context, '17.Tab', TabPage()),
            commonRouteFunc(context, '18.Panel', PanelDemo()),
            commonRouteFunc(context, '19.Scrollable', ScrollableDemo()),
            commonRouteFunc(context, '20.WillPopScope', WillPopScopeDemo()),
            commonRouteFunc(context, '21.ScrollableController', ScrollableControllerDemo()),
            commonCategoryTitle(context, '二  状态管理'),
            commonRouteFunc(context, '1.StateManagement', StateManagementDemo()),
            commonRouteFunc(context, '2.InheritedWidget', InheritedWidgetDemo()),
            commonRouteFunc(context, '3.ScopedModel_1', ScopedModelDemo()),
            commonRouteFunc(context, '4.ScopedModel_2', MyScopedModelDemo()),
            commonRouteFunc(context, '5.Stream_1', StreamDemoOne()),
            commonRouteFunc(context, '6.Stream_2', StreamDemoTwo()),
            commonRouteFunc(context, '7.Stream_3', StreamDemoThree()),
            commonRouteFunc(context, '8.Stream_4', StreamDemoFour()),
            commonRouteFunc(context, '9.Bloc_1', BlocDemo()),
            commonRouteFunc(context, '10.Bloc_2', BlocDemoOne()),
            commonRouteFunc(context, '11.Redux', ReduxDemo()),
            commonRouteFunc(context, '12.Provider', ProviderDemo()),
            commonRouteFunc(context, '13.Provider', MyProvider()),
            commonCategoryTitle(context, '三  网络请求'),
            commonRouteFunc(context, '1.Http', HttpDemo()),
            commonRouteFunc(context, '2.HttpTest', HttpTestDemo()),
            commonRouteFunc(context, '3.httpDemo', HttpDemoPage()),
            commonCategoryTitle(context, '四  Flutter动画'),
            commonRouteFunc(context, '1.AnimationBasics', AnimationBasics()),
            commonRouteFunc(context, '2.Animation_1', AnimOnePage()),
            commonRouteFunc(context, '3.Animation_2', AnimTwoPage()),
            commonRouteFunc(context, '4.组合动画', StaggeredAnimationDemo()),
//            commonRouteFunc(context, '2.Animation_one', AnimOnePage()),
//            commonRouteFunc(context, '2.Animation_one', AnimOnePage()),
//            commonRouteFunc(context, '2.Animation_one', AnimOnesPage()),
//            commonRouteFunc(context, '2.Animation_one', AnimOnePage()),
//            commonRouteFunc(context, '2.Animation_one', AnimOnePage()),
//            commonRouteFunc(context, '2.Animation_one', AnimOnePage()),
            commonCategoryTitle(context, '五  其他'),
            commonRouteFunc(context, '1.页面返回滤镜效果', BackDropFilterPage()),
            commonRouteFunc(context, '2.ClipXXXPage', ClipXXXPage()),
            commonRouteFunc(context, '3.CustomPainter_1', CustomPainterPage()),
            commonRouteFunc(context, '4.CustomPainter_2', CustomPainterPage2()),
            commonRouteFunc(context, '5.CustomScrollView', CustomScrollViewPage()),
            commonRouteFunc(context, '6.FileDemo', FileDemoPage()),
            commonRouteFunc(context, '7.Notification', NotificationPage()),
            commonRouteFunc(context, '8.TestPage', TestPage()),
          ],
        ),
      ),
    ));
  }
}
