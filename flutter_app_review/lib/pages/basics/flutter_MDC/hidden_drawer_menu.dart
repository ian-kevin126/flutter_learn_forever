import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';

class HiddenDrawerMenuDemo extends StatefulWidget {
  HiddenDrawerMenuDemo({Key key}) : super(key: key);

  @override
  _HiddenDrawerMenuDemoState createState() => _HiddenDrawerMenuDemoState();
}

class _HiddenDrawerMenuDemoState extends State<HiddenDrawerMenuDemo> with TickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 200.0,
              child: RaisedButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(20.0)
                    )
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExampleHiddenDrawer()),
                  );
                },
                child: Text(
                  "Default Example",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200.0,
              child: RaisedButton(
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20.0)
                      )
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExampleCustomMenu()),
                    );
                  },
                  child: Text(
                    "Custom Menu Drawer",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

}

class ExampleHiddenDrawer extends StatelessWidget {

  final List<ScreenHiddenDrawer> itens = [
    ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Screen 1",
          colorLineSelected: Colors.teal,
          baseStyle: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 25.0),
          selectedStyle: TextStyle(color: Colors.teal),
        ),
        Screen1()
    ),
    ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Screen 2",
          colorLineSelected: Colors.orange,
          baseStyle: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 25.0),
          selectedStyle: TextStyle(color: Colors.orange),
          onTap: () {
            print("Click item");
          },
        ),
        Screen2()
    )
  ];

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      initPositionSelected: 0,
      screens: itens,
      backgroundColorMenu: Colors.cyan,
      typeOpen: TypeOpen.FROM_RIGHT,
      enableScaleAnimin: true,
      enableCornerAnimin: true,
      slidePercent: 80.0,
      verticalScalePercent: 80.0,
      contentCornerRadius: 10.0,
      iconMenuAppBar: Icon(Icons.menu),
//      backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'), fit: BoxFit.cover),
//      whithAutoTittleName: true,
//      styleAutoTittleName: TextStyle(color: Colors.red),
//      actionsAppBar: <Widget>[],
//      backgroundColorContent: Colors.blue,
//      backgroundColorAppBar: Colors.blue,
//      elevationAppBar: 4.0,
//      tittleAppBar: Center(child: Icon(Icons.ac_unit),),
//      enableShadowItensMenu: true,
//      backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'), fit: BoxFit.cover),
    );
  }
}

class ExampleCustomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleHiddenDrawer(
      menu: Menu(),
      screenSelectedBuilder: (position, controller) {
        Widget screenCurrent;
        switch (position) {
          case 0:
            screenCurrent = Screen1();
            break;
          case 1:
            screenCurrent = Screen2();
            break;
        }

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  controller.toggle();
                }),
          ),
          body: screenCurrent,
        );
      },
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  AnimationController _animationController;
  bool initConfigState = false;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    confListenerState(context);

    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.cyan,
      child: Stack(
        children: <Widget>[
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Image.network(
              'https://wallpaperaccess.com/full/529044.jpg',
              fit: BoxFit.cover,
            ),
          ),
          FadeTransition(
            opacity: _animationController,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 200.0,
                      child: RaisedButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        onPressed: () {
                          SimpleHiddenDrawerProvider.of(context).setSelectedMenuPosition(0);
                        },
                        child: Text(
                          "Menu 1",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200.0,
                      child: RaisedButton(
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                          onPressed: () {
                            SimpleHiddenDrawerProvider.of(context).setSelectedMenuPosition(1);
                          },
                          child: Text(
                            "Menu 2",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void confListenerState(BuildContext context) {
    if (!initConfigState) {
      initConfigState = true;
      SimpleHiddenDrawerProvider.of(context).getMenuStateListener().listen((state) {
        if (state == MenuState.open) {
          _animationController.forward();
        }

        if (state == MenuState.closing) {
          _animationController.reverse();
        }
      });
    }
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Center(
        child: Text("Screen 1", style: TextStyle(color: Colors.white, fontSize: 30.0)),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: Text("Screen 2", style: TextStyle(color: Colors.white, fontSize: 30.0)),
      ),
    );
  }
}
