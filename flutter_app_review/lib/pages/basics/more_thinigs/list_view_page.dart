import 'package:flutter/material.dart';

import 'datas/product.dart';

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewPage();
  }
}

const _assertPackage = 'flutter_gallery_assets';

var productList = <Product>[
  Product('Backpack', 'products/backpack.png', assetsPackage: _assertPackage, price: 1188, desc: '这个包能装下一整头大象！'),
  Product('Belt', 'products/belt.png', assetsPackage: _assertPackage, price: 98, desc: '可能是世界上最长的皮带'),
  Product('Cup', 'products/cup.png', assetsPackage: _assertPackage, price: 22, desc: '根本装不了一滴水'),
  Product('Deskset', 'products/deskset.png', assetsPackage: _assertPackage, price: 198, desc: '只能三选一'),
  Product('Dress', 'products/dress.png', assetsPackage: _assertPackage, price: 326, desc: '卖的不是这个女孩'),
  Product('Earrings', 'products/earrings.png', assetsPackage: _assertPackage, price: 326, desc: '普通人根本戴不进去'),
];

class _ListViewPage extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Page'),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return ListView.builder(
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(context, index);
        });
  }

  _buildItem(BuildContext context, int index) {
    Product product = productList[index];
    return Container(
      margin: EdgeInsets.only(top: 6, left: 12, right: 12),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget>[
                Container(
                  height: 150,
                  child: SizedBox.expand(
                      child: ClipRect(
                    child: Image.asset(
                      product.img,
                      package: product.assetsPackage,
                      fit: BoxFit.cover,
                    ),
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12, bottom: 12),
                  child: Text(
                    product.name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ],
            ),
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          product.desc,
                          style: TextStyle(color: Colors.grey[350], fontSize: 14),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Text(
                            '¥${product.price}',
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          product.favorite = !product.favorite;
                        });
                      },
                      child: Icon(
                        Icons.favorite,
                        color: product.favorite ? Colors.red : Colors.grey[300],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
