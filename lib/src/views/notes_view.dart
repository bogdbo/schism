import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:test_flutter/src/layout/default_app_bar.dart';
import 'package:test_flutter/src/layout/default_drawer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/stores/notes_store.dart';

class Notes extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final notes = useProvider(notesProvider.state);

    return Scaffold(
      drawer: DefaultDrawer(),
      appBar: DefaultAppBar(title: 'Notes'),
      body: Column(children: [
        notes.length == 0
            ? Center(child: Text('No notes'))
            : Expanded(
                child: ListView(
                padding: EdgeInsets.all(16.0),
                reverse: true,
                children: notes.map((n) => _buildRow(context, n)).toList(),
              ))
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/new'),
          child: const Icon(Icons.add)),
    );
  }

  Widget _buildRow(BuildContext context, Note note) {
    return Slidable(
      key: Key(note.content),
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
            child: Text('ABC'),
            foregroundColor: Colors.white,
          ),
          title: Text(note.content),
          subtitle: Text(note.categories?.map((c) => c.title)?.join(', ') ?? 'No categories'),
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
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.remove_circle_outline,
          onTap: () {
            context.read(notesProvider).remove(note);
          },
        ),
      ],
    );
  }
}
