part of 'imports.dart';

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
Map<String, Widget Function(BuildContext)> routes = {
  "N0001" : (context) => N0001(),
  "N0002" : (context) => N0002(),
  "list" : (context) => WidgetList(),
};
