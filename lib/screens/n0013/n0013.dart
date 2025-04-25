import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'dart:ui';

class N0013 extends StatefulWidget {
  const N0013({super.key});

  @override
  State<N0013> createState() => _N0013State();
}

class _N0013State extends State<N0013> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );

  late final _tween = Tween<double>(
    begin: 0.0,
    end: 15.0,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  late final _posTween = Tween<double>(
    begin: 100.0,
    end: 0.0,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  late final Animation<double> _blurTween = Tween<double>(
    begin: 150.0,
    end: 60.0,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  late final Animation<double> _radiusTween = Tween<double>(
    begin: 50.0,
    end: 120.0,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  initState() {
    super.initState();
    _controller.addListener(() {
      _value.value = _tween.value;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _value.dispose();
    super.dispose();
  }

  final ValueNotifier<double> _value = ValueNotifier(0.0);
  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(30.0);
    const buttonPadding = EdgeInsets.symmetric(horizontal: 40, vertical: 18);
    const textStyle = TextStyle(
      color: Colors.black87,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: _value,
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, -value),
              child: MouseRegion(
                onEnter: (_) =>
                    !_controller.isAnimating ? _controller.forward() : null,
                onExit: (_) => _controller.reverse(),
                child: child,
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 15,
                  spreadRadius: 3,
                  offset: const Offset(0, 8),
                ),
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.5),
                  blurRadius: 10,
                  spreadRadius: -3,
                  offset: const Offset(-5, -5),
                ),
              ],
            ),
            child: InkWell(
              borderRadius: borderRadius,
              onTap: () {
                if (kDebugMode) print('Glassy Button Tapped!');
                _controller.isCompleted
                    ? _controller.reverse()
                    : _controller.forward();
              },
              child: ClipRRect(
                borderRadius: borderRadius,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.grey,
                          Colors.white,
                          Colors.white,
                          Colors.grey,
                        ],

                        stops: const [0.0, 0.2, 0.8, 1.0],
                      ),
                      borderRadius: borderRadius,
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.6),
                        width: 1.5,
                      ),
                    ),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: borderRadius - BorderRadius.circular(4),
                        color: Colors.white,
                      ),

                      child: Stack(
                        children: [
                          ClipRRect(
                            child: SizedBox(
                              height: 70,
                              width: 240,
                              child: AnimatedBuilder(
                                animation: _controller,
                                builder: (context, child) {
                                  return CustomPaint(
                                    size: const Size(235, 70),
                                    painter: BlurPaint(
                                      deltaPos: Offset(0, _posTween.value),
                                      radius: _radiusTween.value,
                                      blur: _blurTween.value,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Container(
                            clipBehavior: Clip.antiAlias,
                            padding: buttonPadding,
                            decoration: BoxDecoration(
                              borderRadius:
                                  borderRadius - BorderRadius.circular(4),
                            ),
                            child: Text('Glassy Button', style: textStyle),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BlurPaint extends CustomPainter {
  final Offset deltaPos;
  final double radius;
  final double blur;

  BlurPaint({required this.deltaPos, this.radius = 150, this.blur = 50});
  @override
  void paint(Canvas canvas, Size size) {
    final gradient1 = RadialGradient(
      colors: [Colors.red, Colors.transparent],
      center: const Alignment(0, 0),
      stops: const [0.30, 7.0],
      radius: 0.5,
    );
    final gradient2 = RadialGradient(
      colors: [Colors.purple, Colors.transparent],
      center: const Alignment(0, 0),
      stops: const [0.30, 7.0],
      radius: 0.5,
    );
    final paint = Paint()
      ..shader = gradient1.createShader(
        Rect.fromCircle(
          center:
              Offset(size.width / 2 - 40, size.height + 10) +
              Offset(deltaPos.dx, deltaPos.dy),
          radius: radius,
        ),
      )
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blur);
    final paint2 = Paint()
      ..shader = gradient2.createShader(
        Rect.fromCircle(
          center:
              Offset(size.width / 2 + 40, size.height + 5) +
              Offset(deltaPos.dx, deltaPos.dy),
          radius: radius,
        ),
      )
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blur);

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint2);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      deltaPos != (oldDelegate as BlurPaint).deltaPos ||
      radius != oldDelegate.radius ||
      blur != oldDelegate.blur;
}
