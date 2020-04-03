import 'dart:async';

import 'package:flutter/material.dart';

import 'bloc_base.dart';
import 'bloc_provider.dart';

class BlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(child: HomePage(title: 'BlocDemo'), blocs: [CounterBloc()]);
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    BlocProvider.of<CounterBloc>(context).first.increment(_counter);
  }

  @override
  void initState() {
    BlocProvider.of<CounterBloc>(context).first.counter.listen((_count) {
      setState(() {
        _counter = _count;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class CounterBloc extends BlocBase {
  final _controller = StreamController<int>();

  get _counter => _controller.sink;

  get counter => _controller.stream;

  void increment(int count) {
    _counter.add(++count);
  }

  void dispose() {
    _controller.close();
  }
}
