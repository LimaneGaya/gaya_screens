import 'package:flutter/material.dart';

import 'onboarding.dart';
import 'overview.dart';
import 'habit.dart';


class N0014 extends StatelessWidget {
  const N0014({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollBehavior: MaterialScrollBehavior(),
      allowImplicitScrolling: true,
      children: [P1(), P2(), P3()],
    );
  }
}