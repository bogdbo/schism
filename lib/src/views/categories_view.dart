import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/src/layout/default_app_bar.dart';
import 'package:test_flutter/src/layout/default_drawer.dart';
import 'package:test_flutter/src/stores/categories_store.dart';

class Categories extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final categories = watch(categoriesProvider.state);

    return Scaffold(
      drawer: DefaultDrawer(),
      appBar: DefaultAppBar(title: 'Categories'),
      body: Column(children: [
        Expanded(child: _buildListViewSuggestions(categories)),
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/categories/new'),
          child: const Icon(Icons.add)),
    );
  }

  Widget _buildListViewSuggestions(List<Category> categories) {
    if (categories.length == 0) {
      return Center(child: Text('No categories'));
    }

    return ListView(
        padding: EdgeInsets.all(16.0),
        children:
            categories.map((c) => ListTile(title: Text(c.title))).toList());
  }

  Widget _buildRow(Category category) {
    return ListTile(title: Text(category.title));
  }
}
