import 'package:flutterappreview/pages/basics/flutter_advanced/flutter_redux/count_actions.dart';
import 'package:flutterappreview/pages/basics/flutter_advanced/flutter_redux/count_state.dart';

/// 第三部：reducer会根据传进来的action生成新的CountState；
/// reducer是我们的状态生成器，它接收一个我们原来的状态，然后接收一个action，再匹配这个action生成一个新的状态。
CountState reducer(CountState state, action) {
  // 匹配新的Action
  if (action == Action.increment) {
    return CountState(state.count + 1);
  }
  return state;
}
