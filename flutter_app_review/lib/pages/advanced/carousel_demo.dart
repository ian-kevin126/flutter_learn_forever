import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

/// carousel_pro: https://github.com/jlouage/flutter-carousel-pro
class CarouselDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('轮播组件Demo'),
      ),
      body: CarouselList(),
    );
  }
}

class CarouselList extends StatefulWidget {
  @override
  _CarouselListState createState() => _CarouselListState();
}

class _CarouselListState extends State<CarouselList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 15.0, bottom: 60.0, left: 15, right: 15),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
            SizedBox(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              child: Carousel(
                boxFit: BoxFit.cover,
                autoplay: true,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 1000),
                dotSize: 6.0,
                dotIncreasedColor: Color(0xFFFF335C),
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.topRight,
                dotVerticalPadding: 10.0,
                showIndicator: true,
                indicatorBgPadding: 7.0,
                images: [
                  ExactAssetImage("assets/card_back1.jpg"),
                  ExactAssetImage("assets/card_back2.png"),
                  ExactAssetImage("assets/card_back3.jpg"),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            SizedBox(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: Carousel(
                  images: [
                    ExactAssetImage("assets/card_back1.jpg"),
                    ExactAssetImage("assets/card_back2.png"),
                    ExactAssetImage("assets/card_back3.jpg"),
                  ],
                  dotSize: 4.0,
                  dotSpacing: 15.0,
                  dotColor: Colors.lightGreenAccent,
                  indicatorBgPadding: 5.0,
                  dotBgColor: Colors.purple.withOpacity(0.5),
                  borderRadius: true,
                )),
            SizedBox(
              height: 30.0,
            ),
            SizedBox(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: Carousel(
                  images: [
                    ExactAssetImage("assets/card_back1.jpg"),
                    ExactAssetImage("assets/card_back2.png"),
                    ExactAssetImage("assets/card_back3.jpg"),
                  ],
                  dotSize: 4.0,
                  dotSpacing: 15.0,
                  dotColor: Colors.lightGreenAccent,
                  indicatorBgPadding: 5.0,
                  dotBgColor: Colors.purple.withOpacity(0.5),
                  borderRadius: false,
                  moveIndicatorFromBottom: 180.0,
                  noRadiusForIndicator: true,
                  overlayShadow: true,
                  overlayShadowColors: Colors.white,
                  overlayShadowSize: 0.7,
                )),
            SizedBox(
              height: 30.0,
            ),
            SizedBox(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: Carousel(
                  images: [
                    ExactAssetImage("assets/card_back1.jpg"),
                    ExactAssetImage("assets/card_back2.png"),
                    ExactAssetImage("assets/card_back3.jpg"),
                  ],
                  showIndicator: false,
                  borderRadius: false,
                  moveIndicatorFromBottom: 180.0,
                  noRadiusForIndicator: true,
                  overlayShadow: true,
                  overlayShadowColors: Colors.white,
                  overlayShadowSize: 0.7,
                )),
          ],
        ),
      ),
    );
  }
}
