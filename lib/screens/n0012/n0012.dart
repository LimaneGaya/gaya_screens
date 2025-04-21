import 'package:flutter/material.dart';

import 'package:gaya_screens/screens/n0012/p1.dart';
import 'package:gaya_screens/screens/n0012/p2.dart';



class N0012 extends StatelessWidget {
  const N0012({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollBehavior: MaterialScrollBehavior(),
      allowImplicitScrolling: true,
      children: [P1(), P2()],
    );
  }
}
