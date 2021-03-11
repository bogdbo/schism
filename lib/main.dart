import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/src/views/new_category.dart';

import 'src/views/categories_view.dart';
import 'src/views/new_note.dart';
import 'src/views/notes.dart';

void main() {
  runApp(ProviderScope(child: App()));
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
        '/categories/new': (context) => NewCategory(),
      },
    );
  }
}
