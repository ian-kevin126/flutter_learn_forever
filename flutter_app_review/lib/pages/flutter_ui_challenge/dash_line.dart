import 'package:flutter/material.dart';

class DashLine extends StatelessWidget {

  final double height;
  final Color color;
  final double dashWidth;

  const DashLine({this.height = 1, this.color = Colors.black, this.dashWidth = 10.0});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

// 分割虚线
//Widget _dashLine() {
//  return Container(
//    height: ScreenUtil().setWidth(3),
//    child: DashLine(
//      color: Colors.white,
//      height: AdaptationUtils.px(4),
//      dashWidth: AdaptationUtils.px(10),
//    ),
//    margin: EdgeInsets.only(
//        left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(37)),
//  );
//}