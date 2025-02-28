import 'package:flutter/material.dart';
import 'package:gaya_screens/imports.dart' show routes;

class WidgetList extends StatelessWidget {
  const WidgetList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        reverse: true,
        itemCount: routes.length - 1,
        itemBuilder:
            (context, index) => ListTile(
              title: Text(routes.keys.elementAt(index)),
              onTap: () {
                Navigator.pushNamed(context, routes.keys.elementAt(index));
              },
            ),
      ),
    );
  }
}
