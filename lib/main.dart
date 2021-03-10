import 'package:flutter/material.dart';
import 'package:test_flutter/src/views/categories.dart';
import 'package:test_flutter/src/views/newNote.dart';
import 'src/views/notes.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(primaryColor: Colors.lightGreen),
      initialRoute: '/',
      routes: {
        '/': (context) => Notes(),
        '/new': (context) => NewNote(),
        '/categories': (context) => Categories(),
      },
    );
  }
}
