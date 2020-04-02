import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemoThree extends StatefulWidget {
  @override
  _StreamDemoThreeState createState() => _StreamDemoThreeState();
}

class _StreamDemoThreeState extends State<StreamDemoThree> {
  int _counter = 0;
  final StreamController<int> _streamController = StreamController<int>();

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('StreamDemo3'),
        ),
        body: Center(
          child: StreamBuilder<int>(
              stream: _streamController.stream,
              initialData: _counter,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text('You hit me: ${snapshot.data} times');
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            _streamController.sink.add(++_counter);
          },
        ));
  }
}

/// 1.Stream可以称之为管道，为了控制Stream，我们通常使用StreamController， 为了在Stream中插入一些东西，StreamController公开了一个名为
/// StreamSink的“入口”，可以通过sink属性访问。Stream的流出方式是由StreamController通过stream属性暴露的。
///
/// 2.Stream可以传递任何类型；从值、事件、对象、集合、映射、错误甚至另一个Stream流，任何类型都可以通过Stream传递。
///
/// 3.当你需要通知stream传达某些内容的时候，您只需要监听StreamController的stream属性；，定义监听时，你会得到一个StreamSubscription对象
/// 通过StreamSubscription对象，你将会接收到由于Stream发生变化而带来的通知。
///
/// 4.只要至少有一个活动监听器，Stream就会开始生成事件，以便每次都通知活动的StreamSubscription对象：
/// （1）一些数据来自流；
/// （2）当一些错误发送到流时；
/// （3）当流关闭时，StreamSubscription也允许以下操作：
/// ------cancel
/// ------pause
/// ------resume
///
/// 5.Stream只是一个管道吗？显然不只是一个管道，Stream还允许在流出之前处理流入其中的数据。为了控制Stream内部数据的处理，我们使用StreamTransformer，它只是
/// （1）一个“捕获”Stream内部流动数据的函数；
/// （2）对数据做一些处理；
/// （3）这种转变的结果也是一个Stream
/// （4）因此，可以按顺序使用多个StreamTransformer
/// （5）StreamTransformer可以用于任何类型的数据处理，例如：
/// -------过滤：根据任何类型的条件过滤数据
/// -------重新组合：重新组合数据
/// -------修改：对数据应用任何类型的修改
/// -------将数据注入其它流
/// -------缓冲
/// -------处理：根据数据进行任何类型的操作
/// ...
///
/// 6.Stream有两种类型
/// （1）单订阅Stream：这种类型的Stream只允许在该Stream的整个生命周期内使用单个监听器，即使在第一个订阅被取消以后，也无法在此类流上监听两次。
/// （2）广播（多订阅）Stream：这种类型的Stream允许任意个数的监听器。可以随时向广播流添加监听器，新的监听器将在它开始收听Stream的时候收到事件。
///
/// 7.RxDart：到这里，我们不得不提及RxDart，它是由ReactiveX API的Dart实现，它扩展了原始的Dart Stream API以符合ReactiveX标准；
/// 由于它最初并不是由google定义，因此它使用不同的词汇表，但是具有相关性
/// -------Stream对应Observable，StreamController对应Subject；
/// RxDart正如我刚刚所说的，继承了原生的Dart Streams API 并且提供了3种主要的StreamController变种:
/// （1）PublishSubject是一个普通的广播StreamController，但是有一种情况是例外的：当Stream返回一个Observable而不是一个Stream的时候。
/// 如您所见，PublishSubject仅向监听器发送在订阅之后添加到Stream上的事件。
/// （2）BehaviorSubject也是一个广播StreamController。它返回一个Observable而不是一个Stream。它与PublishSubject的主要去别在于
/// BehaviorSubject还将最后发送的事件发送给刚刚订阅的监听器；
/// （3）ReplaySubject也是一个广播StreamController，它返回一个Observable而不是一个Stream。默认情况下，ReplaySubject将Stream
/// 已经发出去的所有事件作为第一个事件发送到任何新的监听器。
///
/// 8.关于Resource的重要说明——始终释放不再需要的Resource是一种非常好的做法，适用于：
/// （1）StreamSubscription-----当您不再需要收听Stream的时候，取消订阅；
/// （2）StreamController-----当您不再需要StreamController的时候，关闭它。
/// （3）这同样适用于RxDart Subjects，当您不再需要BehaviorSubject，PublishSubject...的时候，请将它们关闭。
///
/// 9.如何基于由Stream提供的数据构建Widget。
/// ---Flutter提供了一个非常方便的StatefulWidget，成为StreamBuilder。利用StreamBuilder监听Stream。每当某些数据输出的时候，它会
/// 自动重建，调用其builder回调。下面的代码演示了如何使用StreamBuilder。
///
// StreamBuilder<T>(
//    key: ...optional, the unique ID of this Widget...
//    stream: ...the stream to listen to...
//    initialData: ...any initial data, in case the stream would initially be empty...
//    builder: (BuildContext context, AsyncSnapshot<T> snapshot){
//        if (snapshot.hasData){
//            return ...the Widget to be built based on snapshot.data
//        }
//        return ...the Widget to be built if no data is available
//    },
// )
/// ------我们将使用Stream更新Widget而不是setState。这是一个很大的改进，因为调用setState方法会强制整个Widget（和任何子窗口小部件）重建。
/// 儿StreamBuilder只重建它负责的部件和它的小部件。我们不再需要State的概念。我们仍然在使用StatefulWidget的原因，仅仅是因为我们需要
/// 通过dispose方法去释放StreamController。
///
/// 10.响应式编程：使用异步数据流进行编程，换句话说，从事件、变量的变化、消息...到构建请求，可能改变或发生的所有事物的所有内容将会被传送，由数据流触发。
/// 很明显，这些意味着，通过响应式编程，应用程序将会：
/// ----变得异步；
/// ----围绕Stream和listeners的概念进行架构；
/// ----当某些事情发生在某个地方（事件，变量的变化...）时，会向Stream发送通知。
/// ----如果“某人”收听该Stream，它将被通知并将采取适当的行动，无论其在应用程序中的位置如何；
/// ----组件之间不再耦合
///
/// 简而言之，当Widget向Stream发送内容时，该Widget不再需要知道：
/// ----接下来会发生什么
/// ----谁可能使用这些信息（没有一个，一个或几个Widget...）
/// ----可能使用此信息的地方（无处，同一页面，另一个页面，或者几个页面）
///
