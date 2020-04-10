import 'package:dashed_container/dashed_container.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DottedAndDashedBorderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DottedAndDashedBorder'),
      ),
      body: DottedAndDashedBorder(),
    );
  }
}

class DottedAndDashedBorder extends StatefulWidget {
  @override
  _DottedAndDashedBorderState createState() => _DottedAndDashedBorderState();
}

class _DottedAndDashedBorderState extends State<DottedAndDashedBorder> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            DashedContainer(
              child: Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10.0)),
              ),
              dashColor: Colors.black,
              borderRadius: 10.0,
              dashedLength: 30.0,
              blankLength: 0.0,
              strokeWidth: 6.0,
            ),
            _buildSpace(),
            Text('Dashed container - rectangle'),
            _buildSpace(),
            DashedContainer(
              child: Container(
                height: 100.0,
                width: 200.0,
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20.0)),
              ),
              dashColor: Colors.black,
              borderRadius: 20.0,
              dashedLength: 30.0,
              blankLength: 6.0,
              strokeWidth: 6.0,
            ),
            _buildSpace(),
            Text('Dashed container - circle'),
            _buildSpace(),
            DashedContainer(
              child: Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
              ),
              dashColor: Colors.black,
              boxShape: BoxShape.circle,
              dashedLength: 30.0,
              blankLength: 6.0,
              strokeWidth: 6.0,
            ),
            _buildSpace(),
            Text('Dashed container - custom'),
            _buildSpace(),
            DashedContainer(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: FlutterLogo(
                  size: 80,
                ),
              ),
              dashColor: Colors.black,
              boxShape: BoxShape.circle,
              dashedLength: 30.0,
              blankLength: 6.0,
              strokeWidth: 6.0,
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.redAccent)),
              child: Column(
                children: <Widget>[
                  _buildSpace(),
                  rectBorderWidget,
                  _buildSpace(),
                  roundedRectBorderWidget,
                  _buildSpace(),
                  customBorder,
                  _buildSpace(),
                  roundStrokeCap,
                  _buildSpace(),
                  solidBorder,
                  _buildSpace(),
                  fullWidthPath,
                  _buildSpace(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get rectBorderWidget {
    return DottedBorder(
      dashPattern: [8, 4],
      strokeWidth: 2,
      child: Container(
        height: 200,
        width: 120,
        color: Colors.red,
      ),
    );
  }

  Widget get roundedRectBorderWidget {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      padding: EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Container(
          height: 200,
          width: 120,
          color: Colors.amber,
        ),
      ),
    );
  }

  Widget get customBorder {
    Path customPath = Path()
      ..moveTo(20, 20)
      ..lineTo(50, 100)
      ..lineTo(20, 200)
      ..lineTo(100, 100)
      ..lineTo(20, 20);

    return DottedBorder(
      customPath: (_) => customPath,
      color: Colors.indigo,
      dashPattern: [8, 4],
      strokeWidth: 2,
      child: Container(
        height: 220,
        width: 120,
        color: Colors.green.withAlpha(20),
      ),
    );
  }

  Widget get roundStrokeCap {
    return DottedBorder(
      dashPattern: [8, 4],
      strokeWidth: 2,
      strokeCap: StrokeCap.round,
      borderType: BorderType.RRect,
      radius: Radius.circular(5),
      child: Container(
        height: 200,
        width: 120,
        color: Colors.red,
      ),
    );
  }

  Widget get solidBorder {
    return DottedBorder(
      dashPattern: [4, 3],
      strokeWidth: 2,
      strokeCap: StrokeCap.round,
      child: Container(
        color: Colors.green,
        height: 200,
        width: 120,
      ),
    );
  }

  Widget get fullWidthPath {
    return DottedBorder(
      customPath: (size) {
        return Path()
          ..moveTo(0, 20)
          ..lineTo(size.width, 20);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(),
      ),
    );
  }

  Widget _buildSpace() {
    return SizedBox(height: 10.0);
  }
}
