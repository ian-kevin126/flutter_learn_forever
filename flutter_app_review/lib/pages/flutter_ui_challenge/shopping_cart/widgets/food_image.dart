import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutterappreview/pages/flutter_ui_challenge/shopping_cart/model/food.dart';


class FoodImage extends StatelessWidget {
  FoodImage({this.food});
  final Food food;

  @override
  Widget build(BuildContext context) {
    return new Align(
      alignment: FractionalOffset.topCenter,
      child:  new GestureDetector(
        behavior: HitTestBehavior.opaque,
//        onTap: () =>
//            Routes.navigateTo(
//              context,
//              '/detail/${food.id}',
//            ),
        child: new Hero(
          tag: 'icon-${food.id}',
          child: new Image(
            image: new AssetImage(food.image),
            height: 150.0,
            width: 150.0,
          ),
        ),
      ),
    );
  }
}