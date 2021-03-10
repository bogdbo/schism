import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewNote extends StatelessWidget {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              children: [
                Chip(label: Text('recipes')),
                Chip(label: Text('todo')),
                Chip(label: Text('Xing ⭐️️️')),
                Chip(label: Text('links')),
                Chip(label: Text('read')),
                Chip(label: Text('learning')),
                Chip(label: Text('old'))
              ],
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
              onPressed: () => Navigator.pop(context),
              backgroundColor: Colors.green,
              child: const Icon(Icons.check))
        ]));
  }
}
