import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';

class Category {
  final String title;

  Category({@required this.title});
}

final _defaultCategories = <Category>[
  Category(title: 'Todo'),
  Category(title: 'Links'),
  Category(title: 'Read'),
  Category(title: 'Funny'),
];

class Categories extends StateNotifier<List<Category>> {
  Categories([List<Category> initialCategories])
      : super(initialCategories ?? _defaultCategories);

  void add(String title) {
    state = [
      ...state,
      Category(title: title),
    ];
  }

  void remove(Category category) {
    state = state.where((e) => e.title != category.title).toList();
  }
}

final categoriesProvider =
StateNotifierProvider<Categories>((ref) => Categories());
