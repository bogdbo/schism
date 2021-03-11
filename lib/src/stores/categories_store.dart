import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';

class Category {
  final String title;

  Category({@required this.title});
}

class Categories extends StateNotifier<List<Category>> {
  Categories([List<Category> initialCategories])
      : super(initialCategories ?? List<Category>.empty());

  void add(String title) {
    state = [
      ...state,
      Category(title: title),
    ];
  }

  void remove(Category category) {
    state = state.where((e) => e.title != category.title);
  }
}

final categoriesProvider =
    StateNotifierProvider<Categories>((ref) => Categories());
