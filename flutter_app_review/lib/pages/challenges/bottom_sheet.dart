import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {

  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  VoidCallback persistentBottomSheet;

  @override
  void initState() {
    super.initState();
    persistentBottomSheet = _showPersistentBottomSheet;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('BottomSheetDemo'),
        ),
        body: Center(
//            child: CustomPaint(
//              size: Size(300, 300),
//              painter: TestPaint(),
//            )
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               RaisedButton(
                 child: Text('ModalBottomSheet'),
                 onPressed: _showModalBottomSheet,
               ),
               RaisedButton(
                 child: Text('PersistentBottomSheet'),
                 onPressed: persistentBottomSheet,
               ),
             ],
           ),
        ));
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16)
                )
            ),
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('ModalBottomSheet'),
              ],
            ),
          );
        });
  }

  void _showPersistentBottomSheet() {
    setState(() {
      persistentBottomSheet = null;
    });

    scaffoldKey.currentState
        .showBottomSheet((context) {
      return Container(
          height: 300,
          color: Colors.greenAccent,
          child: Center(
            child: Text('PersistentBottomSheet'),
          )
      );
    })
        .closed
        .whenComplete(() {
      if (mounted) {
        setState(() {
          persistentBottomSheet = _showPersistentBottomSheet;
        });
      }
    });
  }
}

class TestPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final centerPoint = Offset(size.width/2, size.height/2);
    final rightUpPoint = Offset(centerPoint.dx+40, centerPoint.dy - 75);
    final bezierUpPointX =  centerPoint.dx; //靠近起始点 1/3的位置
    final bezierUpPointY = rightUpPoint.dy ; // y轴在
    Path path = Path();
    path.moveTo(centerPoint.dx, centerPoint.dy);
    path.quadraticBezierTo(bezierUpPointX, bezierUpPointY, rightUpPoint.dx, rightUpPoint.dy);
    Paint paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = Colors.green;
    canvas.drawRect(Offset.zero & size, paint);
    paint.style = PaintingStyle.stroke;
    paint.color = Colors.blue;
    paint.strokeWidth = 3.0;
    canvas.drawPath(path, paint);
    Path path2 = Path();
    path2.moveTo(centerPoint.dx, centerPoint.dy);
    path2.relativeQuadraticBezierTo(bezierUpPointX, bezierUpPointY, rightUpPoint.dx, rightUpPoint.dy);
    paint.color = Colors.red;
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}