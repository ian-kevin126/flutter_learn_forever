
/// 第二部：创建action，定义了State的全部行为
/// action到底是什么？View如何发出action。其实，action只是我们对状态进行操作方法的一个代号而已。
/// 在我们这个应用中，唯一的一个功能就是让count的值+1，所以我们这里只有一个action。
enum Action {
  increment
}