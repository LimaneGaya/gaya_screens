import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

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
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.circle_outlined, size: 40),
        actions: [
          IconButton.filledTonal(
            onPressed: () {},
            icon: Icon(Icons.person_2_rounded),
          ),
          SizedBox(width: 15),

          IconButton.filled(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_rounded),
          ),
          SizedBox(width: 15),
        ],
        title: Text('Xefag', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.tertiary,
                ],
                center: Alignment.bottomCenter,
                radius: 1.3,
                focal: Alignment.center,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(onPressed: () {}, child: Text('Products')),
                    SizedBox(width: 10),
                    FilledButton(onPressed: () {}, child: Text('Contact')),
                  ],
                ),
                SizedBox(height: 40),
                Text(
                  'Flexible solution\nfor all kind of people',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                SizedBox(height: 15),
                Text(
                  'Powerful\nBoost',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Transform(
                      transform:
                          Matrix4.identity()
                            ..rotateZ(-0.3)
                            ..scale(1.5, 1.5, 1.5),
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 100,
                        width: 60,
                        color: Colors.blue,
                      ),
                    ),
                    Transform(
                      transform:
                          Matrix4.identity()
                            ..rotateZ(0.3)
                            ..scale(1.5, 1.5, 1.5),
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 100,
                        width: 60,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                Spacer(),

                Text(
                  'Helping humans\nbecome happier and\nhealthier',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
