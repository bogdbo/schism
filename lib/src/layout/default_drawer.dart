import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Drawer Header',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.note),
          title: Text('Notes'),
          onTap: () => Navigator.pushReplacementNamed(context, '/'),
        ),
        ListTile(
          leading: Icon(Icons.category),
          title: Text('Categories'),
          onTap: () => Navigator.pushReplacementNamed(context, '/categories'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
      ],
    ));
  }
}
