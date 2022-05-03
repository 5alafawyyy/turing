import 'package:flutter/material.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const
      [
        ListTile(title: Text('First'),),
        ListTile(title: Text('Second'),),
        ListTile(title: Text('Third'),),
      ],

    );
  }
}
