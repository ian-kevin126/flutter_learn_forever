import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappreview/common/common.dart';
import 'package:flutterappreview/pages/flutter_ui_challenge/dot_dashed_border.dart';
import 'package:flutterappreview/pages/flutter_ui_challenge/shopping_cart/menu_home.dart';
import 'package:flutterappreview/pages/flutter_ui_challenge/simple_ui/adidas_ui.dart';
import 'package:flutterappreview/pages/flutter_ui_challenge/dashboard_reborn/dashboard_reborn.dart';
import 'package:flutterappreview/pages/flutter_ui_challenge/fitness_ness/fitness.dart';
import 'package:flutterappreview/pages/flutter_ui_challenge/flutter_login_ui/flutter_ui_demo.dart';
import 'package:flutterappreview/pages/flutter_ui_challenge/simple_ui/library_ui.dart';
import 'package:flutterappreview/pages/flutter_ui_challenge/simple_ui/music_ui.dart';
import 'package:flutterappreview/pages/flutter_ui_challenge/payment_app/home_page.dart';
import 'package:flutterappreview/pages/flutter_ui_challenge/simple_ui/wallet_app.dart';
import 'package:flutterappreview/pages/challenges/bottom_sheet.dart';
import 'package:flutterappreview/pages/challenges/flutter_demo.dart';
import 'package:flutterappreview/pages/challenges/white_board/main.dart';

class FlutterUIChallenge extends StatefulWidget {
  @override
  _FlutterUIChallengeState createState() => _FlutterUIChallengeState();
}

class _FlutterUIChallengeState extends State<FlutterUIChallenge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Wrap(
        children: <Widget>[
          commonRouteFunc(context, '1.Login', FlutterUiDemo()),
          commonRouteFunc(context, '2.PaymentApp', PaymentAppHomePage()),
          commonRouteFunc(context, '3.DashboardReborn', DashboardReborn()),
          commonRouteFunc(context, '4.WalletApp', WalletApp()),
          commonRouteFunc(context, '5.FitnessApp', FitnessApp()),
          commonRouteFunc(context, '6.AdidasUi', AdidasUi()),
          commonRouteFunc(context, '7.MusicDemo', MusicDemo()),
          commonRouteFunc(context, '8.LibraryUI', LibraryUI()),
          commonRouteFunc(context, '9.BottomSheetDemo', BottomSheetDemo()),
          commonRouteFunc(context, '10.WhiteBoardDemo', WhiteBoardDemo()),
          commonRouteFunc(context, '11.RandomWordsDemo', RandomWords()),
          commonRouteFunc(context, '12.Shopping', MenuHomePage()),
          commonRouteFunc(context, '13.dot&dashedBorder', DottedAndDashedBorderDemo()),
        ],
      ),
    ));
  }
}
