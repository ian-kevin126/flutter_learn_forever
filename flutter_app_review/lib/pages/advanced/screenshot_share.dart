import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

class ScreenShotShare extends StatefulWidget {
  @override
  _ScreenShotShareState createState() => _ScreenShotShareState();
}

class _ScreenShotShareState extends State<ScreenShotShare> {
  GlobalKey rootWidgetKey = GlobalKey();

  List<Uint8List> images = List();

  File _imageFile;

  /// 截图，并且返回图片的缓存地址
  Future<String> _capturePng(File toFile) async {
    // 1. 获取 RenderRepaintBoundary
    RenderRepaintBoundary boundary = rootWidgetKey.currentContext.findRenderObject();
    // 2. 生成 Image
    ui.Image image = await boundary.toImage();
    // 3. 生成 Uint8List
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    // 4. 本地存储Image
    toFile.writeAsBytes(pngBytes);
    return toFile.path;
  }

  /// 选取保存文件的路径
  Future<File> _saveImageToFile() async {
    Directory tempDir = await getTemporaryDirectory();
    int curT = DateTime.now().millisecondsSinceEpoch;
    String toFilePath = '${tempDir.path}/$curT.png';
    File toFile = File(toFilePath);
    bool exists = await toFile.exists();
    if (!exists) {
      await toFile.create(recursive: true);
    }
    await _capturePng(toFile);
    setState(() {
      _imageFile = toFile;
    });
    print(toFilePath);
    return toFile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('截图分享'),
        actions: <Widget>[
          FlatButton(
            onPressed: () async {
              File _capturedImgFile = await _saveImageToFile();
              if (_capturedImgFile != null) {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                          height: MediaQuery.of(context).size.height - 200,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 10.0, left: 20.0, top: 10.0),
                                child: Text(
                                  '分享截图',
                                  style: TextStyle(color: Color(0xFF005960), fontWeight: FontWeight.w700, fontSize: 18),
                                ),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Image.file(
                                    _capturedImgFile,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF005960),
                                            borderRadius: BorderRadius.all(Radius.circular(40.0))),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.share,
                                              size: 16,
                                              color: Colors.white70,
                                            ),
                                            SizedBox(
                                              width: 6.0,
                                            ),
                                            Text(
                                              '取消',
                                              style: TextStyle(
                                                  fontSize: 16, color: Colors.white70, fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (_imageFile != null) {
                                          ShareExtend.share(_imageFile.path, "image",
                                              sharePanelTitle: "share image title", subject: "share image subject");
                                          Navigator.of(context).pop();
                                        } else {
                                          return null;
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF005960),
                                            borderRadius: BorderRadius.all(Radius.circular(40.0))),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.share,
                                              size: 16,
                                              color: Colors.white70,
                                            ),
                                            SizedBox(
                                              width: 6.0,
                                            ),
                                            Text(
                                              '分享',
                                              style: TextStyle(
                                                  fontSize: 16, color: Colors.white70, fontWeight: FontWeight.w700),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              }
            },
            child: Icon(
              Icons.image,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              RepaintBoundary(
                key: rootWidgetKey,
                child: Column(
                  children: <Widget>[
                    Image.network(
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586259387083&di=fb10e703ead72ce83e421556f1b82969&imgtype=0&src=http%3A%2F%2Fdl.ppt123.net%2Fpptbj%2F51%2F20181115%2Fmzj0ghw2xo2.jpg",
                      width: 300,
                      height: 300,
                    ),
                    Image.network(
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586259387083&di=fb10e703ead72ce83e421556f1b82969&imgtype=0&src=http%3A%2F%2Fdl.ppt123.net%2Fpptbj%2F51%2F20181115%2Fmzj0ghw2xo2.jpg",
                      width: 300,
                      height: 300,
                    ),
                    Image.network(
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586259387083&di=fb10e703ead72ce83e421556f1b82969&imgtype=0&src=http%3A%2F%2Fdl.ppt123.net%2Fpptbj%2F51%2F20181115%2Fmzj0ghw2xo2.jpg",
                      width: 300,
                      height: 300,
                    ),
                    Image.network(
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586259387083&di=fb10e703ead72ce83e421556f1b82969&imgtype=0&src=http%3A%2F%2Fdl.ppt123.net%2Fpptbj%2F51%2F20181115%2Fmzj0ghw2xo2.jpg",
                      width: 300,
                      height: 300,
                    ),
                    Image.network(
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586259387083&di=fb10e703ead72ce83e421556f1b82969&imgtype=0&src=http%3A%2F%2Fdl.ppt123.net%2Fpptbj%2F51%2F20181115%2Fmzj0ghw2xo2.jpg",
                      width: 300,
                      height: 300,
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
