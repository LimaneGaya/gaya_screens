import 'dart:math' as math;
import 'package:flutter/material.dart';

const Color primaryBgColor = Color(0xFF1A1A1A);
const Color cardBgColor = Color(0xFF2C2C2E);
const Color accentGreen = Color(0xFFC6FF00);
const Color accentRed = Color(0xFFFF453A);
const Color textColorPrimary = Colors.white;
const Color textColorSecondary = Colors.grey;

class FirstColumn extends StatelessWidget {
  const FirstColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OverviewSection(),
            const SizedBox(height: 10),
            HalfCircleChart(),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey.shade800),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.5],
                  colors: [Colors.grey.shade800, Colors.grey.shade900],
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Top 5 Leagues',
                        style: TextStyle(
                          color: textColorPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(Icons.more_horiz, color: textColorSecondary),
                    ],
                  ),
                  const SizedBox(height: 15),
                  LeagueRow('NFL', 0.38),
                  LeagueRow('NFL', 0.78),
                  LeagueRow('NBA', 0.78),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OverviewSection extends StatelessWidget {
  const OverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          child: InfoCard(
            'Total Income',
            '\$3,433.0',
            Icons.monetization_on_outlined,
            Colors.green.shade900.withValues(alpha: 0.8),
            Colors.green,
          ),
        ),
        SizedBox(width: 5),
        Flexible(
          child: InfoCard(
            'Total Payers',
            '11,443',
            Icons.people_alt_outlined,
            Colors.orange.shade900.withValues(alpha: 0.8),
            Colors.orange,
          ),
        ),
        SizedBox(width: 5),
        Flexible(
          child: InfoCard(
            'Total Time',
            '11,443',
            Icons.timer_outlined,
            Colors.red.shade900.withValues(alpha: 0.8),
            Colors.red,
          ),
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color backColor;
  final Color iconColor;
  const InfoCard(
    this.title,
    this.value,
    this.icon,
    this.backColor,
    this.iconColor, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 2),
      decoration: BoxDecoration(
        color: backColor,
        border: Border.all(width: 1, color: iconColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: iconColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.black, size: 20),
              ),
              Icon(Icons.more_horiz, color: Colors.white, size: 16),
            ],
          ),
          const SizedBox(height: 25),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),

          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          Center(
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: BoxBorder.all(width: 1, color: Colors.white),
              ),
              child: SizedBox(width: 50),
            ),
          ),
        ],
      ),
    );
  }
}

class HalfCircleChart extends StatelessWidget {
  const HalfCircleChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.shade800),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.5],
          colors: [Colors.grey.shade800, Colors.grey.shade900],
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Top 5 Sport Categories',
                style: TextStyle(
                  color: textColorPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(Icons.more_horiz, color: textColorSecondary),
            ],
          ),
          const SizedBox(height: 5),
          LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxWidth / 1.5,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: Size(
                        constraints.maxWidth,
                        constraints.maxWidth / 1.5,
                      ),
                      painter: HalfCircleChartPainter(),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '\$3,223.55',
                          style: TextStyle(
                            color: textColorPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Total profit',
                          style: TextStyle(
                            color: textColorSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.shade800,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SportIcon(Icons.sports_volleyball_outlined),
                            SportIcon(Icons.sports_mma_outlined),
                            SportIcon(Icons.sports_soccer),
                            SportIcon(Icons.sports_football_outlined),
                            SportIcon(Icons.sports_baseball_outlined),
                            SportIcon(Icons.sports_hockey_outlined),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SportIcon extends StatelessWidget {
  final IconData icon;
  const SportIcon(this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: primaryBgColor, shape: BoxShape.circle),
      child: Icon(icon, color: textColorSecondary, size: 20),
    );
  }
}

class LeagueRow extends StatelessWidget {
  final String name;
  final double progress;
  const LeagueRow(this.name, this.progress, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget logoWidget = CircleAvatar(
      radius: 14,
      backgroundColor: Colors.grey[700],
      child: Text(name[0], style: TextStyle(color: Colors.white, fontSize: 10)),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          logoWidget,
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: textColorPrimary,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: const TextStyle(
                        color: textColorSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: primaryBgColor,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      accentGreen,
                    ),
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

class HalfCircleChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 1.4);
    final radius = math.min(size.width / 2 - 20, size.height);
    final startAngle = math.pi * 0.9;
    final sweepAngle = math.pi * 1.2;

    final paint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 35
          ..strokeCap = StrokeCap.butt;

    final sections = [
      {'color': accentGreen, 'value': 0.4},
      {'color': Colors.blue, 'value': 0.15},
      {'color': accentRed, 'value': 0.2},
      {'color': Colors.orange, 'value': 0.25},
    ];

    double currentStartAngle = startAngle;
    for (Map<String, dynamic> section in sections) {
      final sectionSweepAngle = sweepAngle * section['value'];
      paint.color = section['color'] as Color;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        currentStartAngle,
        sectionSweepAngle,
        false,
        paint,
      );
      currentStartAngle += sectionSweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
