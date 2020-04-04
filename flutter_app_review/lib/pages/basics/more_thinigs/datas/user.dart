class User {

  /**
   * name : "John Smith"
   * email : "john@example.com"
   */

  String name;
  String email;

  static User fromMap(Map<String, dynamic> map) {
    User user = new User();
    user.name = map['name'];
    user.email = map['email'];
    return user;
  }

  static List<User> fromMapList(dynamic mapList) {
    List<User> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}
