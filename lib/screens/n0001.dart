import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';

class N0001 extends StatelessWidget {
  const N0001({super.key});

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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Transform(
                      transform:
                          Matrix4.identity()
                            ..setTranslationRaw(45, 35, 0)
                            ..rotateZ(-0.3)
                            ..scale(1.5, 1.5, 1.5),
                      alignment: Alignment.bottomCenter,
                      child: Stack(
                        children: [
                          Transform.translate(
                            offset: Offset(-10, 10),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Colors.black,
                                BlendMode.srcATop,
                              ),
                              child: ImageFiltered(
                                imageFilter: ImageFilter.blur(
                                  sigmaX: 15,
                                  sigmaY: 15,
                                ),
                                child: Opacity(
                                  opacity: 0.5,
                                  child: Image.asset(
                                    'assets/N0001/images/energy.webp',
                                    scale: 6,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/N0001/images/energy.webp',
                            scale: 6,
                          ),
                        ],
                      ),
                    ),

                    Transform(
                      transform:
                          Matrix4.identity()
                          ..setTranslationRaw(-25, 0,0)
                            ..rotateZ(0.3)
                            ..scale(1.5, 1.5, 1.5),
                      alignment: Alignment.bottomCenter,
                      child: Stack(
                        children: [
                          Transform.translate(
                            offset: Offset(10, 10),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Colors.black,
                                BlendMode.srcATop,
                              ),
                              child: ImageFiltered(
                                imageFilter: ImageFilter.blur(
                                  sigmaX: 15,
                                  sigmaY: 15,
                                ),
                                child: Opacity(
                                  opacity: 0.5,
                                  child: Image.asset(
                                    'assets/N0001/images/energy2.webp',
                                    scale: 6,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/N0001/images/energy2.webp',
                            scale: 6,
                          ),
                        ],
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
