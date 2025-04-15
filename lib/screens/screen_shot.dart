import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class ScreenShot extends StatefulWidget {
  final String widgetName;
  final Widget child;
  final String languageCode;
  final Color colorBG;
  const ScreenShot({
    required this.widgetName,
    required this.child,
    required this.colorBG,
    required this.languageCode,
    super.key,
  });

  @override
  State<ScreenShot> createState() => _ScreenShotState();
}

class _ScreenShotState extends State<ScreenShot> {
  final key = GlobalKey();
  
  void paitScreen() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final boundary =
          key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary != null) {
        final image = await boundary.toImage(pixelRatio: 3);
        final byteData = await image.toByteData(format: ImageByteFormat.png);
        if (byteData != null) {
          final pngBytes = byteData.buffer.asUint8List();
          File('screenshot ${widget.widgetName} ${widget.languageCode}.png').writeAsBytes(pngBytes);
        }
      }
    });
  }

  void _handleKeyPressed(KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.space) {
        paitScreen();
      } 
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: FocusNode()..requestFocus(),
      onKeyEvent: _handleKeyPressed,
      child: RepaintBoundary(
        key: key,
        child: DecoratedBox(
          decoration: BoxDecoration(color: widget.colorBG),
          child: widget.child,
        ),
      ),
    );
  }
}
