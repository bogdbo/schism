import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/src/layout/default_app_bar.dart';
import 'package:test_flutter/src/layout/default_drawer.dart';
import 'package:test_flutter/src/stores/categories_store.dart';

class Categories extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final categories = watch(categoriesProvider);

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

    return ListView.separated(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, index) =>
            ListTile(title: Text(categories[index].title)),
        separatorBuilder: (context, index) => Divider(),
        itemCount: categories.length);
  }

  Widget _buildRow(Category category) {
    return ListTile(title: Text(category.title));
  }
}
