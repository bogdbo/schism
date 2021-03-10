import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  DefaultAppBar({@required this.title}) : super();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(this.title),
      actions: [IconButton(icon: Icon(Icons.list))],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
