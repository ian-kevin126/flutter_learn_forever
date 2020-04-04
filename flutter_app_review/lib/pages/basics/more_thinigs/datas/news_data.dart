class NewsData {
  /**
   * uniquekey : "966d1f2ccd63c57e2d419e272148c295"
   * title : "技术派｜兴师动众只炸死乌鸦炸毁树？如何看待印空军越境空袭"
   * date : "2019-03-12 13:07"
   * category : "头条"
   * author_name : "澎湃新闻网"
   * url : "http://mini.eastday.com/mobile/190312130701894.html"
   * thumbnail_pic_s : "http://03imgmini.eastday.com/mobile/20190312/20190312130701_b9c8376709792770c316bbf20b2f4e20_4_mwpm_03200403.jpg"
   * thumbnail_pic_s02 : "http://03imgmini.eastday.com/mobile/20190312/20190312130701_b9c8376709792770c316bbf20b2f4e20_2_mwpm_03200403.jpg"
   * thumbnail_pic_s03 : "http://03imgmini.eastday.com/mobile/20190312/20190312130701_b9c8376709792770c316bbf20b2f4e20_1_mwpm_03200403.jpg"
   */

  String uniquekey;
  String title;
  String date;
  String category;
  String author_name;
  String url;
  String thumbnail_pic_s;
  String thumbnail_pic_s02;
  String thumbnail_pic_s03;

  static NewsData fromMap(Map<String, dynamic> map) {
    NewsData news_data = new NewsData();
    news_data.uniquekey = map['uniquekey'];
    news_data.title = map['title'];
    news_data.date = map['date'];
    news_data.category = map['category'];
    news_data.author_name = map['author_name'];
    news_data.url = map['url'];
    news_data.thumbnail_pic_s = map['thumbnail_pic_s'];
    news_data.thumbnail_pic_s02 = map['thumbnail_pic_s02'];
    news_data.thumbnail_pic_s03 = map['thumbnail_pic_s03'];
    return news_data;
  }

  static List<NewsData> fromMapList(dynamic mapList) {
    List<NewsData> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

  Map<String, dynamic> toJson() => {
        'url': url,
        'category': category,
      };

}
