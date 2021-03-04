import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(MyApp());
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = TextStyle(fontSize: 18);
  final _saved = <WordPair>{};
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Name generator'),
          actions: [IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)],
        ),
        body: Column(children: [
          Text('hello', style: TextStyle(fontSize: 20)),
          Expanded(child: _buildListViewSuggestions()),
          // Container(height: 400, child: _buildListViewSuggestions()),
          TextField(
            controller: _textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Label',
            ),
          ),
          OutlinedButton(
            child: Text('Add'),
            onPressed: () => setState(() {
              _suggestions.insert(0, WordPair(_textController.text, 'second'));
              _textController.clear();
            }),
          )
        ]));
    // body: _buildListViewSuggestions());
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      final tiles = _saved.map((WordPair pair) {
        return ListTile(
            key: Key(pair.asPascalCase),
            title: Text(pair.asPascalCase, style: _biggerFont));
      });

      final divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
          appBar: AppBar(
            title: Text('Favourite items'),
          ),
          body: ListView(children: divided));
    }));
  }

  Widget _buildListViewSuggestions() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      reverse: true,
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair suggestion) {
    final alreadySaved = _saved.contains(suggestion);
    return Slidable(
      key: Key(suggestion.asString),
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      fastThreshold: 0.1,
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.indigoAccent,
            child: Text('help'),
            foregroundColor: Colors.white,
          ),
          title: Text(suggestion.asPascalCase),
          subtitle: Text(suggestion.asUpperCase),
        ),
      ),
      actions: <Widget>[
        Text('test'),
        Text('test'),
        IconSlideAction(
          caption: 'Favorite',
          color: Colors.green,
          icon: alreadySaved ? Icons.favorite : Icons.favorite_border_outlined,
          onTap: () => {
            setState(() {
              if (alreadySaved) {
                _saved.remove(suggestion);
              } else {
                _saved.add(suggestion);
              }
            })
          },
        ),
        ListView(
          children: [
            ListTile(
              title: Text('helloa sfasfasf asf a sf asf asf'),
            ),
            ListTile(
              title: Text('hello'),
            ),
            ListTile(
              title: Text('hello'),
            ),
            ListTile(
              title: Text('hello'),
            ),
          ],
        )
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'More',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () => null,
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => null,
        ),
      ],
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _RandomWordsState();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}
