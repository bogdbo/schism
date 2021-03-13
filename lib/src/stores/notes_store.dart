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
      Note(id: UniqueKey(), content: content, categories: categories),
      ...state,
    ];
  }

  void remove(Note note) {
    state = state.where((e) => e.id != note.id).toList();
  }

  void update(Note updatedNote) {
    state = [
      for (final note in state)
        if (note.id == updatedNote.id)
          Note(
            id: updatedNote.id,
            content: updatedNote.content,
            categories: updatedNote.categories,
          )
        else
          note,
    ];
  }
}

final notesProvider = StateNotifierProvider<Notes>((ref) => Notes());
