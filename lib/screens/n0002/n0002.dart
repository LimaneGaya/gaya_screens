import 'package:flutter/material.dart';
import 'package:gaya_screens/screens/n0002/p1.dart';
import 'package:gaya_screens/screens/n0002/p2.dart';
import 'package:gaya_screens/screens/n0002/p3.dart';
import 'package:gaya_screens/screens/n0002/p4.dart';

class N0002 extends StatelessWidget {
  const N0002({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollBehavior: MaterialScrollBehavior(),
      allowImplicitScrolling: true,
      children: [P1(), P2(), P3(), P4()],
    );
  }
}
