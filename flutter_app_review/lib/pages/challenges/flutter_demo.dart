import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('RandomWords'),
        actions: <Widget>[
          new Builder(builder: (BuildContext context) {
            return IconButton(icon: const Icon(Icons.list), onPressed: () => this._navigatePush(context));
          })
        ],
      ),
      body: new Center(
        child: _buildSuggestions(),
      ),
    );
  }

  /// 这个地方要注意！ 当BuildContext在Scaffold之前调用Scaffold.of(context)会报错，这里要用Builder Widget来解决 看上面调用的地方 29行
  void _navigatePush(BuildContext context) async {
    //页面返回的数据result
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(saved: _saved)));
    if (result != null) {
      //把接收到的值 用SnackBar显示一下
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("$result")));
    } else {
      debugPrint('没有回传数据！！！！');
    }
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        //分隔符
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          // 每次获取10个单词加入数组，让它有无限长。。。
          _suggestions.addAll(generateWordPairs().take(10));
        }
        // debugPrint('index:'+index.toString()+',i:'+i.toString());
        return _buildItem(_suggestions[index]);
      },
    );
  }

  Widget _buildItem(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}

//第二个页面
class SecondScreen extends StatelessWidget {
  final Set<WordPair> saved;

  final _biggerFont = const TextStyle(fontSize: 18.0);

  SecondScreen({Key key, @required this.saved}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Saved Suggestions'),
      ),
      body: buildListView(),
    );
  }

//build一个ListView
  Widget buildListView() {
    return new Builder(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = saved.map(
        (WordPair pair) {
          return new ListTile(
            title: new Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
            onTap: () {
              _itemTapAndNavigationPop(context, pair.asPascalCase);
            },
          );
        },
      );
      final List<Widget> divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();
      return ListView(children: divided);
    });
  }

// 点击Item返回当前Item的title
  void _itemTapAndNavigationPop(BuildContext context, String title) {
    Navigator.pop(context, title);
  }
}
