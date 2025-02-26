import 'package:flutter/material.dart';
import 'package:gaya_screens/screens/n0001.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
          dynamicSchemeVariant: DynamicSchemeVariant.rainbow,
        ),
      ),
      home: N0001(),
    );
  }
}
