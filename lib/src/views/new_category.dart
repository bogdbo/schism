import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/src/stores/categories_store.dart';

class NewCategory extends ConsumerWidget {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context, watch) {
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
          ],
        ),
        floatingActionButton: Row(children: [
          FloatingActionButton(
              onPressed: () => Navigator.pop(context),
              backgroundColor: Colors.red,
              child: const Icon(Icons.cancel_outlined)),
          FloatingActionButton(
              onPressed: () {
                context.read(categoriesProvider).add(_textController.text);
                Navigator.pop(context);
              },
              backgroundColor: Colors.green,
              child: const Icon(Icons.check))
        ]));
  }
}
