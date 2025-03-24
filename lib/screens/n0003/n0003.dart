import 'package:flutter/material.dart';
import 'package:gaya_screens/screens/n0003/p1.dart';

class N0003 extends StatelessWidget {
  const N0003({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollBehavior: MaterialScrollBehavior(),
      allowImplicitScrolling: true,
      children: [P1()],
    );
  }
}