import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:gaya_screens/screens/screen_shot.dart';

const Map<String, Map<String, String>> _localizedStringsScreen1 = {
  'en': {
    'title': 'Keep your money\nmoving with you',
    'cardHolder': 'Edward Hunt',
  },
  'fr': {
    'title': 'Gardez votre argent\nen mouvement avec vous',
    'cardHolder': 'Edward Hunt',
  },
  'ar': {'title': 'اجعل أموالك\nتتحرك معك', 'cardHolder': 'إدوارد هانت'},
};

class P1 extends StatelessWidget {
  final String currentLanguage = 'en'; // 'en', 'fr', 'ar'

  const P1({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = _localizedStringsScreen1[currentLanguage]!;
    final textDirection = currentLanguage == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr;

    final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.deepPurpleAccent,
      scaffoldBackgroundColor: const Color(0xFF1C1C1E),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(fontSize: 16, color: Colors.white70),
        labelLarge: TextStyle(fontSize: 16, color: Colors.white),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      fontFamily: 'Roboto',
    );

    return Theme(
      data: darkTheme,
      child: Directionality(
        textDirection: textDirection,
        child: ScreenShot(
          colorBG: Colors.transparent,
          languageCode: currentLanguage,
          widgetName: 'N0012 - P1',
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Stack(
                    fit: StackFit.passthrough,
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          gradient: RadialGradient(
                            center: Alignment(0, -0.7),
                            radius: 1.0,
                            colors: [
                              Color(0xFFFFAA7F),
                              Color(0xFFE47FFF),
                              Color(0xFF8C7FFF),
                              Color(0x001C1C1E),
                            ],
                            stops: [0.0, 0.3, 0.6, 0.95],
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: _buildCardStack(strings['cardHolder']!),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        strings['title']!,
                        style: darkTheme.textTheme.displayLarge?.copyWith(
                          height: 1.3,
                        ),
                        textDirection: textDirection,
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 30,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: 30,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.3),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.purpleAccent.withValues(alpha: 0.7),
                                  Colors.blueAccent.withValues(alpha: 0.7),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            padding: const EdgeInsets.all(7),
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  currentLanguage == 'ar'
                                      ? Icons.arrow_back
                                      : Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardStack(String cardHolderName) {
    const double cardWidth = 280;
    const double cardHeight = cardWidth * (53.98 / 85.6);
    const cardBorderRadius = BorderRadius.all(Radius.circular(15));

    return SizedBox(
      height: cardHeight * 1.8,
      width: cardWidth * 1.2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: cardHeight * 0.6,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateZ(-math.pi / 10)
                ..rotateY(-math.pi / 5)
                ..rotateX(-math.pi / 4),
              child: Container(
                width: cardWidth,
                height: cardHeight,
                decoration: BoxDecoration(
                  borderRadius: cardBorderRadius,
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade300.withValues(alpha: 0.8),
                      Colors.purple.shade300.withValues(alpha: 0.9),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: _buildCardContent(
                  cardNumber: '4455 5491 6118 6164',
                  cardHolder: cardHolderName,
                  isVisa: false,
                ),
              ),
            ),
          ),

          Positioned(
            top: cardHeight * 0.3,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateZ(-math.pi / 10)
                ..rotateY(-math.pi / 5)
                ..rotateX(-math.pi / 4),
              child: ClipRRect(
                borderRadius: cardBorderRadius,
                child: Container(
                  width: cardWidth,
                  height: cardHeight,
                  decoration: BoxDecoration(
                    borderRadius: cardBorderRadius,
                    color: Colors.white.withValues(alpha: 0.2),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: _buildCardContent(
                      cardNumber: '4455 5491 6118 6164',
                      cardHolder: cardHolderName,
                      isVisa: true,
                      isTranslucent: true,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 0,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateZ(-math.pi / 10)
                ..rotateY(-math.pi / 5)
                ..rotateX(-math.pi / 4),
              child: ClipRRect(
                borderRadius: cardBorderRadius,
                child: Container(
                  width: cardWidth,
                  height: cardHeight,
                  decoration: BoxDecoration(
                    borderRadius: cardBorderRadius,
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple.shade300.withValues(alpha: 0.9),
                        Colors.pink.shade200.withValues(alpha: 0.9),
                        Colors.orange.shade200.withValues(alpha: 0.9),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.4),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: _buildCardContent(
                      cardNumber: '4455 5491 6118 6164',
                      cardHolder: cardHolderName,
                      isVisa: true,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardContent({
    required String cardNumber,
    required String cardHolder,
    required bool isVisa,
    bool isTranslucent = false,
  }) {
    Color textColor = isTranslucent
        ? Colors.white.withValues(alpha: 0.7)
        : Colors.white;
    Color logoColor = isTranslucent
        ? Colors.white.withValues(alpha: 0.7)
        : Colors.white;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: isVisa
                ? Text(
                    'VISA',
                    style: TextStyle(
                      color: logoColor,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.red.withValues(
                          alpha: isTranslucent ? 0.7 : 1.0,
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(-5, 0),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.orange.withValues(
                            alpha: isTranslucent ? 0.7 : 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
          const Spacer(),
          Text(
            cardNumber,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              letterSpacing: 2,
              fontFamily: 'monospace',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            cardHolder.toUpperCase(),
            style: TextStyle(
              color: textColor.withValues(alpha: 0.8),
              fontSize: 10,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
