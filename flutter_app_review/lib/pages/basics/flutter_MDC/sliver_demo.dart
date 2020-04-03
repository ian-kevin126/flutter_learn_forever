import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class SliverDemoWidget extends StatelessWidget {
  final List<Map> subjectList = [
    {
      "create": "Flutter Tutorial",
      "topic": "Inheritance",
      "subject": "Java",
    },
    {
      "create": "Android Tutorial",
      "topic": "Life Cycle",
      "subject": "Android",
    },
    {
      "create": "Java Tutorial",
      "topic": "Collection Framework",
      "subject": "Java",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SliverGrid and SliverList')),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          _buildSlider(),
          _title(context, 'Sliver Grid in Flutter'),
          _buildPopularRestaurant(),
          _title(context, 'Sliver List in Flutter'),
          _buildRecommendedList()
        ],
      ),
    );
  }
  _title(BuildContext context, String title) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(left: 20.0, top: 20.0),
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .title
                .merge(TextStyle(fontSize: 16.0, color: Colors.blue))),
      ),
    );
  }
  _buildSlider() {
    return SliverToBoxAdapter(
      child: Stack(
        children: <Widget>[
          Container(
            height: 200,
            child: Swiper(
              itemCount: subjectList.length,
              autoplay: true,
              curve: Curves.easeIn,
              itemBuilder: (BuildContext context, int index){
                return Text(subjectList[index]["topic"],);
              },
            ),
          ),
          Container(
            height: 200,
            color: Colors.blue.withOpacity(0.5),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Text("Flutter Tutorial", style: TextStyle(
                color: Colors.white
            )),
          )
        ],
      ),
    );
  }
  _buildPopularRestaurant() {
    return SliverGrid(
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  color: Colors.grey, height: 130.0, width: double.infinity),
              Text(subjectList[index]["topic"],
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .merge(TextStyle(fontSize: 14.0)))
            ],
          ),
        );
      }, childCount: subjectList.length),
    );
  }
  _buildRecommendedList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 150.0,
                color: Colors.black,
                width: double.infinity,
              ),
              SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(subjectList[index]["topic"]),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(subjectList[index]["create"],
                            style: Theme.of(context)
                                .textTheme
                                .subhead
                                .merge(TextStyle(fontSize: 12.0))),
                        SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                  ),
                  Text(subjectList[index]["subject"],
                      style: Theme.of(context).textTheme.title.merge(
                          TextStyle(fontSize: 16.0, color: Colors.black))),
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {},
                  )
                ],
              ),
            ],
          ),
        );
      }, childCount: subjectList.length),
    );
  }
}