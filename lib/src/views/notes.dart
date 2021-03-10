import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:test_flutter/src/layout/default_app_bar.dart';
import 'package:test_flutter/src/layout/default_drawer.dart';

class _NotesState extends State<Notes> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DefaultDrawer(),
      appBar: DefaultAppBar(title: 'Notes'),
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
    return Slidable(
      key: Key(suggestion.asString),
      actionPane: SlidableScrollActionPane(),
      showAllActionsThreshold: 0.1,
      actionExtentRatio: 1,
      direction: Axis.horizontal,
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
        ListView(
          scrollDirection: Axis.horizontal,
          children: [
            IconSlideAction(
              caption: 'Hello',
              color: Colors.red,
              icon: Icons.ac_unit_outlined,
              onTap: () => null,
            ),
            IconSlideAction(
              caption: 'World',
              color: Colors.green,
              icon: Icons.more_horiz,
              onTap: () => null,
            ),
            IconSlideAction(
              caption: 'What',
              color: Colors.yellow,
              icon: Icons.accessibility,
              onTap: () => null,
            ),
            IconSlideAction(
              caption: 'More',
              color: Colors.amber,
              icon: Icons.phone,
              onTap: () => null,
            ),
            IconSlideAction(
              caption: 'Hello',
              color: Colors.red,
              icon: Icons.ac_unit_outlined,
              onTap: () => null,
            ),
            IconSlideAction(
              caption: 'World',
              color: Colors.green,
              icon: Icons.more_horiz,
              onTap: () => null,
            ),
            IconSlideAction(
              caption: 'What',
              color: Colors.yellow,
              icon: Icons.accessibility,
              onTap: () => null,
            ),
            IconSlideAction(
              caption: 'More',
              color: Colors.amber,
              icon: Icons.phone,
              onTap: () => null,
            ),
            IconSlideAction(
              caption: 'Hello',
              color: Colors.red,
              icon: Icons.ac_unit_outlined,
              onTap: () => null,
            ),
            IconSlideAction(
              caption: 'World',
              color: Colors.green,
              icon: Icons.more_horiz,
              onTap: () => null,
            ),
            IconSlideAction(
              caption: 'What',
              color: Colors.yellow,
              icon: Icons.accessibility,
              onTap: () => null,
            ),
            IconSlideAction(
              caption: 'More',
              color: Colors.amber,
              icon: Icons.phone,
              onTap: () => null,
            ),
            IconSlideAction(
              caption: 'Hello',
              color: Colors.red,
              icon: Icons.ac_unit_outlined,
              onTap: () => null,
            ),
            IconSlideAction(
              caption: 'World',
              color: Colors.green,
              icon: Icons.more_horiz,
              onTap: () => null,
            ),
            IconSlideAction(
              caption: 'What',
              color: Colors.yellow,
              icon: Icons.accessibility,
              onTap: () => null,
            ),
            IconSlideAction(
              caption: 'More',
              color: Colors.amber,
              icon: Icons.phone,
              onTap: () => null,
            ),
          ].map((a) => Container(width: 50, child: a)).toList(),
        )
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'More',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () => null,
        ),
      ],
    );
  }
}

class Notes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _NotesState();
}
