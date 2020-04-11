import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransformDemo'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('变换：'),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    color: Colors.black,
                    child: new Transform(
                      alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                      transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度（正数表示顺时针）
                      child: new Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.deepOrange,
                        child: const Text('Apartment for rent!'),
                      ),
                    ),
                  )
                ],
              ),
              _buildDistance(),
              Row(
                children: <Widget>[
                  Text('平移：'),
                  SizedBox(
                    width: 20,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    //默认原点为左上角，左移20像素，向上平移5像素
                    child: Transform.translate(
                      offset: Offset(-20.0, -5.0),
                      child: Text("Hello world"),
                    ),
                  )
                ],
              ),
              _buildDistance(),
              Row(
                children: <Widget>[
                  Text('旋转：'),
                  SizedBox(
                    width: 20,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Transform.rotate(
                      //旋转90度
                      angle: math.pi / 2,
                      child: Text("Hello world"),
                    ),
                  )
                ],
              ),
              _buildDistance(),
              Row(
                children: <Widget>[
                  Text('缩放：'),
                  SizedBox(
                    width: 20,
                  ),
                  DecoratedBox(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Transform.scale(
                          scale: 1.5, //放大到1.5倍
                          child: Text("Hello world")))
                ],
              ),

              /// Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，所以无论对子组件应用何种变化，
              /// 其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的
              _buildDistance(),

              /// 由于第一个Text应用变换(放大)后，其在绘制时会放大，但其占用的空间依然为红色部分，所以第二个Text会紧挨着红色部分，最终就会出现文字重合。
              /// 由于矩阵变化只会作用在绘制阶段，所以在某些场景下，在UI需要变化时，可以直接通过矩阵变化来达到视觉上的UI改变，
              /// 而不需要去重新触发build流程，这样会节省layout的开销，所以性能会比较好。如之前介绍的Flow组件，它内部就是用矩阵
              /// 变换来更新UI，除此之外，Flutter的动画组件中也大量使用了Transform以提高性能。
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('DecoratedBox：'),
                  SizedBox(
                    width: 20,
                  ),
                  DecoratedBox(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Transform.scale(scale: 1.5, child: Text("Hello world"))),
                  Text(
                    "你好",
                    style: TextStyle(color: Colors.green, fontSize: 18.0),
                  )
                ],
              ),
              _buildDistance(),

              /// RotatedBox和Transform.rotate功能相似，它们都可以对子组件进行旋转变换，但是有一点不同：
              /// RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小。由于RotatedBox是作用于layout阶段，
              /// 所以子组件会旋转90度（而不只是绘制的内容），decoration会作用到子组件所占用的实际空间上
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('RotatedBox：'),
                  SizedBox(
                    width: 20,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    //将Transform.rotate换成RotatedBox
                    child: RotatedBox(
                      quarterTurns: 1, //旋转90度(1/4圈)
                      child: Text("Hello world"),
                    ),
                  ),
                  Text(
                    "你好",
                    style: TextStyle(color: Colors.green, fontSize: 18.0),
                  )
                ],
              ),
              _buildDistance(),

              /// scale 缩放 可以通过 Transform 提供的构造方法或 Matrix4 矩阵变化来实现；
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black)
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Transform.scale 构造方法：'),
                        SizedBox(
                          width: 20.0,
                        ),
                        Center(
                            child: Transform.scale(
                                scale: 1.2,
                                // origin: Offset(120.0, 120.0),   // 缩放原点
                                alignment: Alignment.bottomRight,
                                child: ClipOval(
                                    child:
                                    SizedBox(width: 80.0, height: 50.0, child: Container(color: Colors.blueAccent))))),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('Transform Matrix4 方式：'),
                        SizedBox(
                          width: 20.0,
                        ),
                        Transform(
                            transform: Matrix4.identity()
                              ..scale(1.2, 1.0, 0.5),
                            alignment: Alignment.bottomRight,
                            child: ClipOval(
                                child: SizedBox(
                                    width: 80.0,
                                    height: 50.0,
                                    child: Container(
                                        color: Colors.blueAccent))))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDistance() {
    return SizedBox(
      height: 60,
    );
  }
}
