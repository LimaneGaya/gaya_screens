import 'package:flutter/material.dart';
import 'theme.dart';

class P1 extends StatelessWidget {
  const P1({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.themeData;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green.withValues(alpha: 0.7),
                  Colors.black. withValues(alpha: 0.5),
                  Colors.black. withValues(alpha: 0.5),
                  Colors.green.withValues(alpha: 0.7),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.3, 0.6, 1.0],
              ),
            ),
          ),
          Positioned.fill(
            child: Image.asset('assets/N0014/women 1.webp',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    theme.scaffoldBackgroundColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.55],
                ),
              ),
            ),
          ),
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '9:30 PM',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.signal_cellular_alt,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.wifi, color: Colors.white, size: 18),
                      SizedBox(width: 4),
                      Icon(Icons.battery_full, color: Colors.white, size: 18),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Main Content
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 50.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Your Path to\n',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontSize: 32,
                        height: 1.2,
                      ),
                      children: [
                        TextSpan(
                          text: 'Success ',
                          style: theme.textTheme.displayLarge?.copyWith(
                            fontSize: 32, 
                            height: 1.2,
                          ),
                        ),
                        TextSpan(
                          text: 'Starts with\nDaily Tracking',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 32,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: theme.cardTheme.color?.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.check_rounded,
                            color: theme.scaffoldBackgroundColor,
                            size: 24,
                            shadows: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            'Get Started',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            Icons.double_arrow_rounded,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
