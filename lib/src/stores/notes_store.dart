import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:test_flutter/src/stores/categories_store.dart' as Categories;

class Note {
  final UniqueKey id;
  final String content;
  final List<Categories.Category> categories;

  Note({
    @required this.id,
    @required this.content,
    this.categories,
  });
}

class Notes extends StateNotifier<List<Note>> {
  Notes([List<Note> initialNotes]) : super(initialNotes ?? List<Note>.empty());

  void add({@required String content, List<Categories.Category> categories}) {
    state = [
      ...state,
      Note(id: UniqueKey(), content: content, categories: categories),
    ];
  }

  void remove(Note note) {
    state = state.where((e) => e.id != note.id).toList();
  }
}

final notesProvider = StateNotifierProvider<Notes>((ref) => Notes());
