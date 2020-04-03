import 'package:flutter/material.dart';
import 'package:flutterappreview/pages/flutter_ui_challenge/payment_app/history/history_page.dart';
import 'package:flutterappreview/pages/flutter_ui_challenge/payment_app/profile/profile_page.dart';
import 'package:flutterappreview/pages/flutter_ui_challenge/payment_app/settings/settings_page.dart';

class PaymentAppHomePage extends StatefulWidget {
  @override
  _PaymentAppHomePageState createState() => new _PaymentAppHomePageState();
}

class _PaymentAppHomePageState extends State<PaymentAppHomePage> {
  int _curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _curIndex,
//          iconSize: 22.0,
          onTap: (index) {
            _curIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(_curIndex == 0 ? 'images/ico_home_selected.png' : 'images/ico_home.png'),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.black),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(_curIndex == 1 ? 'images/ico_history_selected.png' : 'images/ico_history.png'),
              title: Text(
                'History',
                style: TextStyle(color: Colors.black),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(_curIndex == 2 ? 'images/ico_profile_selected.png' : 'images/ico_profile.png'),
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.black),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(_curIndex == 3 ? 'images/ico_settings_selected.png' : 'images/ico_settings.png'),
              title: Text(
                'Settings',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ]),
      body: new Center(
        child: _getWidget(),
      ),
    );
  }

  Widget _getWidget() {
    switch (_curIndex) {
      case 0:
        return Container(
          color: Colors.red,
          child: PaymentAppHomePage(),
        );
        break;
      case 1:
        return Container(
          child: HistoryPage(),
        );
        break;
      case 2:
        return Container(
          child: ProfilePage(),
        );
        break;
      default:
        return Container(
          child: SettingsPage(),
        );
        break;
    }
  }
}
