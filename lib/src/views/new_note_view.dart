import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/src/stores/categories_store.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:test_flutter/src/stores/notes_store.dart';

class NewNote extends HookWidget {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final categories = useProvider(categoriesProvider.state);
    final selectedCategories = useState(<Category>[]);

    return Scaffold(
        appBar: AppBar(title: Text('Create a new note')),
        body: Column(
          children: <Widget>[
            Card(
                color: Colors.white38,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    autofocus: true,
                    controller: _textController,
                    maxLines: 8,
                    decoration: InputDecoration.collapsed(
                        hintText: "Enter your text here"),
                  ),
                )),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: categories.map((c) {
                if (selectedCategories.value.contains(c)) {
                  return Chip(
                    label: Text(c.title),
                    deleteIcon: Icon(Icons.delete),
                    onDeleted: () {
                      selectedCategories.value = [
                        ...selectedCategories.value.where((e) => c != e)
                      ];
                    },
                  );
                }

                return InputChip(
                    label: Text(c.title),
                    onPressed: () {
                      selectedCategories.value = [
                        ...selectedCategories.value,
                        c
                      ];
                    });
              }).toList(),
            ),
            CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.hm,
              minuteInterval: 5,
              initialTimerDuration: Duration(seconds: 10),
              onTimerDurationChanged: (Duration changedtimer) {},
            )
          ],
        ),
        floatingActionButton: Row(children: [
          FloatingActionButton(
              onPressed: () => Navigator.pop(context),
              backgroundColor: Colors.red,
              child: const Icon(Icons.cancel_outlined)),
          FloatingActionButton(
              onPressed: () {
                context
                    .read(notesProvider)
                    .add(content: _textController.text, categories: selectedCategories.value);
                Navigator.pop(context);
              },
              backgroundColor: Colors.green,
              child: const Icon(Icons.check))
        ]));
  }
}
