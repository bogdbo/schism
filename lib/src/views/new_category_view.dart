import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/src/stores/categories_store.dart';

class NewCategory extends ConsumerWidget {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context, watch) {
    return Scaffold(
      appBar: AppBar(title: Text('Create a new category')),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(children: [
        Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: FloatingActionButton(
                    onPressed: () => Navigator.pop(context),
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.cancel_outlined)))),
        Align(
            alignment: Alignment.bottomRight,
            child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: FloatingActionButton(
                    onPressed: () {
                      context
                          .read(categoriesProvider.notifier)
                          .add(_textController.text);
                      Navigator.pop(context);
                    },
                    backgroundColor: Colors.green,
                    child: const Icon(Icons.check))))
      ]),
    );
  }
}
