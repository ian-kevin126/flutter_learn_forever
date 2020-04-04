import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'datas/base_response.dart';
import 'datas/news_data.dart';

class HttpDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HttpDemoPage();
  }
}

class _HttpDemoPage extends State<HttpDemoPage> {
  List<NewsData> content;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Http Demo'),
        ),
        body: FutureBuilder(
            future: get(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.none) {
                print('ConnectionState.none');
              } else if (snapshot.connectionState == ConnectionState.active) {
                print('ConnectionState.active');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                print('ConnectionState.waiting');
              } else if (snapshot.connectionState == ConnectionState.done) {
                print('ConnectionState.done');
              }
              print(snapshot);
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  content = snapshot.data;
                  return _buildListView();
                }
              } else {
                return Center(
                  child: RefreshProgressIndicator(),
                );
              }
            }));
  }

  ListView _buildListView() {
    return ListView.builder(
        itemCount: content == null ? 0 : content.length,
        itemBuilder: (BuildContext context, int position) {
          return Padding(
            padding: EdgeInsets.only(left: 12, right: 12, top: 10),
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Stack(
                fit: StackFit.passthrough,
                alignment: Alignment.bottomLeft,
                children: <Widget>[
                  Container(
                    height: 200,
                    color: Colors.blue,
                    child: Image.network(
                      content[position].thumbnail_pic_s,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    color: Colors.black38,
                    padding: EdgeInsets.only(left: 12, top: 6, bottom: 6),
                    child: Text(
                      content[position].title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<List<NewsData>> get() async {
    // 创建 HttpClient
    HttpClient httpClient = HttpClient();
    // 生成 uri
    var uri = new Uri.http('v.juhe.cn', '/toutiao/index',
        {'key': 'ca8284abeb7ce27ef05965abad467ff9', 'type': 'keji'});
    // 打开Http连接
    var request = await httpClient.getUrl(uri);
    // 等待连接服务器（会将请求信息发送给服务器），请求成功后会返回 HttpClientResponse
    var response = await request.close();
    // 判断 response 状态
    if (response.statusCode == HttpStatus.ok) {
      // 转换 response，获取结果
      var responseBody = await response.transform(utf8.decoder).join();
      // 关闭client，通过该client发起的所有请求都会中止。
      httpClient.close();
      Response responseData =
          Response.parse(responseBody, NewsData.fromMapList);
      return responseData.result.data;
    } else {
      print('Error getting IP address:\nHttp status ${response.statusCode}');
      return null;
    }
  }
}
