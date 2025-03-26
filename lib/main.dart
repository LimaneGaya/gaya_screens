import 'package:flutter/material.dart';
import 'imports.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
          dynamicSchemeVariant: DynamicSchemeVariant.rainbow,
        ),
      ),
      routes: routes,
      initialRoute: "list",
    );
  }
}
