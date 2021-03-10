import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:test_flutter/src/layout/default_app_bar.dart';
import 'package:test_flutter/src/layout/default_drawer.dart';

class _CategoriesState extends State<Categories> {
  final _suggestions = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DefaultDrawer(),
      appBar: DefaultAppBar(title: 'Categories'),
      body: Column(children: [
        Expanded(child: _buildListViewSuggestions()),
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/new'),
          child: const Icon(Icons.add)),
    );
  }

  Widget _buildListViewSuggestions() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      reverse: true,
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (_suggestions.length == 0) {
          _suggestions.addAll([
            WordPair.random(),
            WordPair.random(),
            WordPair.random(),
            WordPair.random(),
            WordPair.random(),
            WordPair.random(),
            WordPair.random(),
            WordPair.random(),
            WordPair.random()
          ]);
        }

        if (index >= _suggestions.length) {
          return null;
        }

        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair suggestion) {
    return ListTile(title: Text(suggestion.asString));
  }
}

class Categories extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _CategoriesState();
}
