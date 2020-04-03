/// 第一步：创建State，State中所有的属性都应该是只读的
/// 状态是由reducer生成并储存在Store里面的。Store更新状态的时候，并不是更改原来的状态对象，
/// 而是直接将reducer生成的新的状态对象替换掉老的状态对象。所以，我们的状态应该是immutable的。
class CountState {
  int _count;

  get count => _count;

  CountState(this._count);

  CountState.initState() : _count = 0;
}
