import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:test_flutter/src/layout/default_app_bar.dart';
import 'package:test_flutter/src/layout/default_drawer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_flutter/src/stores/categories_store.dart';
import 'package:test_flutter/src/stores/notes_store.dart';

class Notes extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final notes = useProvider(notesProvider);
    final categories = useProvider(categoriesProvider);

    return Scaffold(
      drawer: DefaultDrawer(),
      appBar: DefaultAppBar(title: 'Notes'),
      body: Column(children: [
        notes.length == 0
            ? Center(child: Text('No notes'))
            : Expanded(
                child: ListView.separated(
                    padding: EdgeInsets.all(16.0),
                    reverse: true,
                    itemBuilder: (context, index) =>
                        _buildRow(context, notes[index], categories),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: notes.length))
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/new'),
          child: const Icon(Icons.add)),
    );
  }

  Widget _buildRow(BuildContext context, Note note, List<Category> categories) {
    return Slidable(
      key: Key(note.content),
      actionPane: SlidableScrollActionPane(),
      showAllActionsThreshold: 0.1,
      actionExtentRatio: 1,
      direction: Axis.horizontal,
      fastThreshold: 0.1,
      child: Container(
        decoration: BoxDecoration(
          color: note.categories.length > 0 ? Colors.lightGreen : Colors.red,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.indigoAccent,
            child: Text('ABC'),
            foregroundColor: Colors.white,
          ),
          title: Text(note.content),
          subtitle: Text(note.categories?.map((c) => c.title)?.join(', ') ??
              'No categories'),
        ),
      ),
      actions: [_renderActions(context, note, categories)],
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

  ListView _renderActions(
      BuildContext context, Note note, List<Category> categories) {
    return ListView(
        key: Key('actions'),
        scrollDirection: Axis.horizontal,
        children: categories.map((c) {
          var hasCategory = note.categories.contains(c);
          return Container(
              key: Key(c.title),
              width: 50,
              child: IconSlideAction(
                caption: c.title,
                icon: hasCategory ? Icons.check : Icons.radio_button_unchecked,
                color: hasCategory ? Colors.green : Colors.black12,
                onTap: () {
                  var newNote = Note(
                    id: note.id,
                    content: note.content,
                    categories: hasCategory
                        ? [
                            ...note.categories.where(
                                (existingCategory) => existingCategory != c)
                          ]
                        : [...note.categories, c],
                  );
                  context.read(notesProvider.notifier).update(newNote);
                },
              ));
        }).toList());
  }
}
