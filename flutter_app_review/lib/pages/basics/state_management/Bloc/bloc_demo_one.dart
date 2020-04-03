import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterappreview/pages/basics/state_management/Bloc/bloc_child.dart';

class BlocDemoOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocProvider<IncrementBloc>(child: CounterPage(), bloc: IncrementBloc()),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IncrementBloc bloc = BlocProvider.of<IncrementBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Stream version of the Counter App')),
      body: Center(
        child: Column(
          children: <Widget>[
            StreamBuilder<int>(
                stream: bloc.outCounter,
                initialData: 0,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  return Text('You hit me: ${snapshot.data} times');
                }),
            RaisedButton(
              child: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => BlocChild()));
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          bloc.incrementCounter.add(null);
        },
      ),
    );
  }
}

class IncrementBloc implements BlocBase {
  int _counter;

  //
  // Stream来处理计数器
  //
  StreamController<int> _counterController = StreamController<int>();

  StreamSink<int> get _inAdd => _counterController.sink;

  Stream<int> get outCounter => _counterController.stream;

  //
  // Stream来处理计数器上的操作
  //
  StreamController _actionController = StreamController();

  StreamSink get incrementCounter => _actionController.sink;

  //
  // Constructor
  //
  IncrementBloc() {
    _counter = 0;
    _actionController.stream.listen(_handleLogic);
  }

  void dispose() {
    _actionController.close();
    _counterController.close();
  }

  void _handleLogic(data) {
    _counter = _counter + 1;
    _inAdd.add(_counter);
  }
}

abstract class BlocBase {
  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  final T bloc;
  final Widget child;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context) {
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;
}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
