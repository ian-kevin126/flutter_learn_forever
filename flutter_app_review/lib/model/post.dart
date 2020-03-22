class Post {
  const Post(
      {this.title,
      this.selected,
      this.content,
      this.imageUrl,
      this.description});

  final String title;
  final String content;
  final String imageUrl;
  final String description;

  final bool selected;
}

final List<Post> posts = [
  Post(
      title: "beauty",
      content: "清纯",
      selected: false,
      description:
          '这是一个清纯的小女孩范德萨发顺丰三国杀感受感受达大厦发啦发啦发啦发卡方垃圾开发开发期间起飞机起飞取景器放进去放假啊发发发建安费阿发就发发发发附件案件发发发阿加减法法',
      imageUrl:
          "http://b-ssl.duitang.com/uploads/item/201410/09/20141009224754_AswrQ.jpeg"),
  Post(
      title: "cartoonAvatar",
      content: "小丸子",
      selected: false,
      description: '打发发呆佛山市的广告费过得好点',
      imageUrl:
          "http://pic4.zhimg.com/50/v2-236c74303ee2e7da84cab2b21b8ef30b_hd.jpg"),
  Post(
      title: "west",
      content: "唯美",
      selected: false,
      description: '个奇偶奇偶发佛山反搜佛难分难舍冷冻室里',
      imageUrl:
          "http://pic2.zhimg.com/50/v2-92deb69abab424ccf67f44b434b026d9_hd.jpg"),
  Post(
      title: "maskBoy",
      content: "小奇奇",
      selected: false,
      description: '方服务范围为服务if为服务范围',
      imageUrl:
          "http://00imgmini.eastday.com/mobile/20200126/20200126160003_834bc424914f3de7af7af2e5d0aec732_2.jpeg"),
  Post(
      title: "weChatImage",
      selected: false,
      content: "清纯",
      description: '总资产正准备下班下班下班下班发不发',
      imageUrl:
          "http://b-ssl.duitang.com/uploads/item/201410/09/20141009224754_AswrQ.jpeg"),
  Post(
      title: "cartoonImg",
      content: "小丸子",
      selected: true,
      description: '这是一个清纯的小女孩范德萨发顺丰三国杀感受感受',
      imageUrl:
          "http://pic4.zhimg.com/50/v2-236c74303ee2e7da84cab2b21b8ef30b_hd.jpg"),
  Post(
      title: "dsdafafsfdfsdfsdsgsss",
      content: "唯美",
      selected: false,
      description: '这是一个清纯的小女孩范德萨发顺丰三国杀感受感受',
      imageUrl:
          "http://pic2.zhimg.com/50/v2-92deb69abab424ccf67f44b434b026d9_hd.jpg"),
];

class User {
  User(this.name, this.age, {this.selected = false});

  String name;
  int age;
  bool selected;
}

List<User> userData = [
  User('老孟', 18),
  User('老孟1', 19, selected: true),
  User('老孟2', 20),
  User('老孟3', 21),
  User('老孟4', 22),
];
