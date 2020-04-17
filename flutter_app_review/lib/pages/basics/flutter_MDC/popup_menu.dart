import 'package:flutter/material.dart';
import 'package:mobile_popup/mobile_popup.dart';
import 'package:popup_menu/popup_menu.dart';

class PopupMenuDemo extends StatefulWidget {
  @override
  _PopupMenuDemoState createState() => _PopupMenuDemoState();
}

class _PopupMenuDemoState extends State<PopupMenuDemo> {
  PopupMenu menu;
  GlobalKey btnKey = GlobalKey();
  GlobalKey btnKey2 = GlobalKey();
  GlobalKey btnKey3 = GlobalKey();

  @override
  void initState() {
    super.initState();

    menu = PopupMenu(items: [
      // MenuItem(title: 'Copy', image: Image.asset('assets/copy.png')),
      // MenuItem(title: 'Home', image: Icon(Icons.home, color: Colors.white,)),
      MenuItem(
          title: 'Mail',
          image: Icon(
            Icons.mail,
            color: Colors.white,
          )),
      MenuItem(
          title: 'Power',
          image: Icon(
            Icons.power,
            color: Colors.white,
          )),
      MenuItem(
          title: 'Setting',
          image: Icon(
            Icons.settings,
            color: Colors.white,
          )),
      MenuItem(
          title: 'PopupMenu',
          image: Icon(
            Icons.menu,
            color: Colors.white,
          ))
    ], onClickMenu: onClickMenu, onDismiss: onDismiss, maxColumn: 4);
  }

  void stateChanged(bool isShow) {
    print('menu is ${isShow ? 'showing' : 'closed'}');
  }

  void onClickMenu(MenuItemProvider item) {
    print('Click menu -> ${item.menuTitle}');
  }

  void onDismiss() {
    print('Menu is dismiss');
  }

  @override
  Widget build(BuildContext context) {
    PopupMenu.context = context;

    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuDemo'),
      ),
      body: Container(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              child: Text("Show Popup"),
              onPressed: () {
                showMobilePopup(
                  context: context,
                  builder: (context) => MobilePopUp(
                    title: 'App Settings',
                    showFullScreen: true,
                    leadingColor: Colors.white,
                    actions: <Widget>[
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {},
                      ),
                    ],
                    child: Builder(
                      builder: (navigator) => Scaffold(
                        body: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.brightness_auto),
                                title: Text('Brightness'),
                                trailing: Switch.adaptive(
                                  value: true,
                                  onChanged: (value) {},
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.fingerprint),
                                title: Text('Fingerprint'),
                                trailing: Switch.adaptive(
                                  value: false,
                                  onChanged: (value) {},
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.map),
                                title: Text('Navigation'),
                                trailing: Switch.adaptive(
                                  value: true,
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              color: Colors.blue,
              child: MaterialButton(
                height: 45.0,
                key: btnKey,
                onPressed: maxColumn,
                child: Text('Show Menu'),
              ),
            ),
            Container(
              child: MaterialButton(
                key: btnKey2,
                height: 45.0,
                onPressed: customBackground,
                child: Text('Show Menu'),
              ),
            ),
            Container(
              child: MaterialButton(
                key: btnKey3,
                height: 45.0,
                onPressed: onDismissOnlyBeCalledOnce,
                child: Text('Show Menu'),
              ),
            ),
            Container(
              child: MaterialButton(
                height: 30.0,
                child: Text('Gestures Demo'),
                onPressed: onGesturesDemo,
              ),
            ),
            Container(
              child: PopUpMenuButtonDemo(),
            ),
          ],
        ),
      ),
    );
  }

  void onDismissOnlyBeCalledOnce() {
    menu.show(widgetKey: btnKey3);
  }

  void onGesturesDemo() {
    menu.dismiss();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GestureDemo()),
    );
    return;
  }

  void checkState(BuildContext context) {
    final snackBar = new SnackBar(content: new Text('这是一个SnackBar!'));

    Scaffold.of(context).showSnackBar(snackBar);
  }

  void maxColumn() {
    PopupMenu menu = PopupMenu(
        // backgroundColor: Colors.teal,
        // lineColor: Colors.tealAccent,
        maxColumn: 3,
        items: [
          MenuItem(title: 'Copy', image: Image.asset('assets/copy.png')),
          // MenuItem(
          //     title: 'Home',
          //     // textStyle: TextStyle(fontSize: 10.0, color: Colors.tealAccent),
          //     image: Icon(
          //       Icons.home,
          //       color: Colors.white,
          //     )),
          // MenuItem(
          //     title: 'Mail',
          //     image: Icon(
          //       Icons.mail,
          //       color: Colors.white,
          //     )),
          MenuItem(
              title: 'Power',
              image: Icon(
                Icons.power,
                color: Colors.white,
              )),
          MenuItem(
              title: 'Setting',
              image: Icon(
                Icons.settings,
                color: Colors.white,
              )),
          MenuItem(
              title: 'PopupMenu',
              image: Icon(
                Icons.menu,
                color: Colors.white,
              ))
        ],
        onClickMenu: onClickMenu,
        stateChanged: stateChanged,
        onDismiss: onDismiss);
    menu.show(widgetKey: btnKey);
  }

  //
  void customBackground() {
    PopupMenu menu = PopupMenu(
        // backgroundColor: Colors.teal,
        // lineColor: Colors.tealAccent,
        // maxColumn: 2,
        items: [
          MenuItem(title: 'Copy', image: Image.asset('assets/copy.png')),
          MenuItem(
              title: 'Home',
              // textStyle: TextStyle(fontSize: 10.0, color: Colors.tealAccent),
              image: Icon(
                Icons.home,
                color: Colors.white,
              )),
          MenuItem(
              title: 'Mail',
              image: Icon(
                Icons.mail,
                color: Colors.white,
              )),
          MenuItem(
              title: 'Power',
              image: Icon(
                Icons.power,
                color: Colors.white,
              )),
          MenuItem(
              title: 'Setting',
              image: Icon(
                Icons.settings,
                color: Colors.white,
              )),
          MenuItem(
              title: 'PopupMenu',
              image: Icon(
                Icons.menu,
                color: Colors.white,
              ))
        ], onClickMenu: onClickMenu, stateChanged: stateChanged, onDismiss: onDismiss);
    menu.show(widgetKey: btnKey2);
  }
}

class GestureDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GestureDemoState();
  }
}

class _GestureDemoState extends State<GestureDemo> {
  GlobalKey btnKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll Gestures'),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                height: 50.0,
                child: Text('test'),
              );
            },
          ),
          Positioned(
            left: 100.0,
            top: 100.0,
            width: 100.0,
            height: 50.0,
            child: MaterialButton(
              key: btnKey,
              child: Text('show'),
              onPressed: onShow,
            ),
          )
        ],
      ),
    );
  }

  void onShow() {
    PopupMenu menu = PopupMenu(
        // backgroundColor: Colors.teal,
        // lineColor: Colors.tealAccent,
        // maxColumn: 2,
        items: [
          MenuItem(title: 'Copy', image: Image.asset('assets/copy.png')),
          MenuItem(
              title: 'Home',
              // textStyle: TextStyle(fontSize: 10.0, color: Colors.tealAccent),
              image: Icon(
                Icons.home,
                color: Colors.white,
              )),
          MenuItem(
              title: 'Mail',
              image: Icon(
                Icons.mail,
                color: Colors.white,
              )),
          MenuItem(
              title: 'Power',
              image: Icon(
                Icons.power,
                color: Colors.white,
              )),
          MenuItem(
              title: 'Setting',
              image: Icon(
                Icons.settings,
                color: Colors.white,
              )),
          MenuItem(
              title: 'PopupMenu',
              image: Icon(
                Icons.menu,
                color: Colors.white,
              ))
        ],
        onClickMenu: onClickMenu,
        // stateChanged: stateChanged,
        onDismiss: onDismiss);
    menu.show(widgetKey: btnKey);
  }

  void onClickMenu(MenuItemProvider item) {}

  void onDismiss() {}
}

class PopUpMenuButtonDemo extends StatefulWidget {
  @override
  _PopUpMenuButtonDemoState createState() => _PopUpMenuButtonDemoState();
}

class _PopUpMenuButtonDemoState extends State<PopUpMenuButtonDemo> {
  String _selectedMenu = 'Home';

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        height: 200,
        child: Container(
          width: 160,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(100.0))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_selectedMenu),
              PopupMenuButton(
                onSelected: (val) {
                  _selectedMenu = val;
                  setState(() {});
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 'Home',
                    child: Text('Home'),
                  ),
                  PopupMenuItem(
                    value: 'About',
                    child: Text('About'),
                  ),
                  PopupMenuItem(
                    value: 'Link',
                    child: Text('Link'),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
