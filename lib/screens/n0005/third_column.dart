import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

const Color primaryBgColor = Color(0xFF1A1A1A);
const Color cardBgColor = Color(0xFF2C2C2E);
const Color accentGreen = Color(0xFFC6FF00);
const Color accentRed = Color(0xFFFF453A);
const Color textColorPrimary = Colors.white;
const Color textColorSecondary = Colors.grey;

class ThirdColumn extends StatelessWidget {
  const ThirdColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
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
            children: const [
              ProfileAndEarningsCard(),
              SizedBox(height: 5),
              FundsActivityCard(),
              SizedBox(height: 5),
              TransactionsCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileAndEarningsCard extends StatelessWidget {
  const ProfileAndEarningsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ProfileHeader(),
        SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: EarningLossCard("Earned", "\$3,433.0", "+4.5%", true),
            ),
            SizedBox(width: 15),
            Expanded(
              child: EarningLossCard("Lost", "\$11,443", "-5.2%", false),
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const CircularProgressAvatar(
            radius: 35,
            strokeWidth: 2,
            progress: 0.75,
            progressColor: accentGreen,
            backgroundColor: cardBgColor,
            imageUrl: 'https://picsum.photos/50',
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "John Williams",
                style: TextStyle(
                  color: textColorPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Container(
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey.shade800),
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Last activity:",
                      style: TextStyle(color: textColorSecondary, fontSize: 11),
                    ),
                    Text(
                      "6 Dec, 2025 at 12:43 pm",
                      style: TextStyle(color: textColorSecondary, fontSize: 11),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CircularProgressAvatar extends StatefulWidget {
  final String imageUrl;
  final double radius;
  final double progress;
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;

  const CircularProgressAvatar({
    super.key,
    required this.imageUrl,
    this.radius = 25,
    this.progress = 0.75,
    this.progressColor = accentGreen,
    this.backgroundColor = cardBgColor,
    this.strokeWidth = 3.0,
  }) : assert(progress >= 0.0 && progress <= 1.0);

  @override
  State<CircularProgressAvatar> createState() => _CircularProgressAvatarState();
}

class _CircularProgressAvatarState extends State<CircularProgressAvatar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.radius * 2,
      height: widget.radius * 2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(widget.radius * 2, widget.radius * 2),
            painter: CircularProgressPainter(
              progress: widget.progress,
              progressColor: widget.progressColor,
              backgroundColor: widget.backgroundColor,
              strokeWidth: widget.strokeWidth,
            ),
          ),
          CircleAvatar(
            radius: widget.radius - widget.strokeWidth - 2,
            backgroundImage: NetworkImage(widget.imageUrl),
          ),
        ],
      ),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;

  CircularProgressPainter({
    required this.progress,
    required this.progressColor,
    required this.backgroundColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final backgroundPaint =
        Paint()
          ..color = backgroundColor
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, backgroundPaint);

    final progressPaint =
        Paint()
          ..color = progressColor
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth;

    final startAngle = -math.pi / 2;
    final sweepAngle = 2 * math.pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class EarningLossCard extends StatelessWidget {
  final String title;
  final String percentage;
  final bool isEarning;
  final String amount;

  const EarningLossCard(
    this.title,
    this.amount,
    this.percentage,
    this.isEarning, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        color: (isEarning ? Colors.greenAccent : Colors.redAccent).withValues(
          alpha: 0.2,
        ),
        border: Border.all(
          width: 1,
          color: (isEarning ? accentGreen : accentRed).withValues(alpha: 0.2),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: (isEarning ? accentGreen : accentRed).withValues(
                    alpha: 0.2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isEarning
                      ? Icons.monetization_on_outlined
                      : Icons.trending_down,
                  color: isEarning ? accentGreen : accentRed,
                  size: 20,
                ),
              ),
              Icon(
                isEarning ? Icons.arrow_upward : Icons.arrow_downward,
                color: isEarning ? accentGreen : accentRed,
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 13),
              ),
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: (isEarning ? Colors.green.shade800 : Colors.red.shade800)
                      .withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  percentage,
                  style: TextStyle(
                    color:
                        isEarning ? Colors.lightGreenAccent : Colors.redAccent,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: BoxBorder.all(width: 1, color: isEarning ? accentGreen : accentRed),
              ),
              child: SizedBox(width: 50),
            ),
          ),
        ],
      ),
    );
  }
}

class FundsActivityCard extends StatelessWidget {
  const FundsActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Funds Activity',
                style: TextStyle(
                  color: textColorPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(Icons.segment, color: textColorSecondary),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(child: LineChart(_buildLineChartData())),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LegendItem(Colors.green, "Active", "\$1,443"),
              LegendItem(accentGreen, "Playing", "\$440"),
            ],
          ),
        ],
      ),
    );
  }

  LineChartData _buildLineChartData() {
    final List<FlSpot> spots1 = const [
      FlSpot(0, 2),
      FlSpot(1, 3.5),
      FlSpot(2, 3),
      FlSpot(3, 5),
      FlSpot(4, 4),
      FlSpot(5, 6),
      FlSpot(6, 5.5),
    ];
    final List<FlSpot> spots2 = const [
      FlSpot(0, 1),
      FlSpot(1, 2),
      FlSpot(2, 4),
      FlSpot(3, 3),
      FlSpot(4, 2),
      FlSpot(5, 3.5),
      FlSpot(6, 3),
    ];

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 2,
        getDrawingHorizontalLine: (value) {
          return FlLine(color: Colors.grey.withValues(alpha: 0.2), strokeWidth: 1);
        },
      ),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: (value, meta) {
              String text = '';
              switch (value.toInt()) {
                case 0:
                  text = 'Sat';
                  break;
                case 1:
                  text = 'Mon';
                  break;
                case 2:
                  text = 'Tue';
                  break;
                case 3:
                  text = 'Wed';
                  break;
                case 4:
                  text = 'Thr';
                  break;
                case 5:
                  text = 'Fri';
                  break;
                case 6:
                  text = 'Sat';
                  break;
              }
              return SideTitleWidget(
                meta: meta,
                space: 8.0,
                child: Text(
                  text,
                  style: const TextStyle(
                    color: textColorSecondary,
                    fontSize: 10,
                  ),
                ),
              );
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 2,
            reservedSize: 35,
            getTitlesWidget: (value, meta) {
              if (value == 0 || value == 2 || value == 4 || value == 6) {
                return Text(
                  '${value.toInt()}k',
                  style: const TextStyle(
                    color: textColorSecondary,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.left,
                );
              }
              return const SizedBox();
            },
          ),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 7,
      lineBarsData: [
        _buildLineChartBarData(spots1, Colors.green),
        _buildLineChartBarData(spots2, accentGreen),
      ],
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((LineBarSpot touchedSpot) {
              final textStyle = TextStyle(
                color:
                    touchedSpot.bar.gradient?.colors.first ??
                    touchedSpot.bar.color ??
                    Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              );
              return LineTooltipItem(
                '\$${(touchedSpot.y * 1000).toStringAsFixed(0)}',
                textStyle,
              );
            }).toList();
          },
        ),
      ),
    );
  }

  LineChartBarData _buildLineChartBarData(List<FlSpot> spots, Color color) {
    return LineChartBarData(
      spots: spots,
      isCurved: true,
      color: color,
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String title;
  final String value;
  const LegendItem(this.color, this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          title,
          style: const TextStyle(color: textColorSecondary, fontSize: 12),
        ),
        const SizedBox(width: 6),
        Text(
          value,
          style: const TextStyle(
            color: textColorPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class TransactionsCard extends StatelessWidget {
  const TransactionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Transactions',
                style: TextStyle(
                  color: textColorPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(Icons.segment, color: textColorSecondary),
            ],
          ),
          const SizedBox(height: 15),
          const TransactionItem(),
        ],
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: accentGreen.withValues(alpha:0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(
                  Icons.monetization_on_outlined,
                  color: accentGreen,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Income',
                    style: TextStyle(
                      color: textColorPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: const [
                      SmallLogo('https://picsum.photos/20'),
                      SizedBox(width: 4),
                      SmallLogo('https://picsum.photos/21'),
                      SizedBox(width: 8),
                      Text(
                        '43:32',
                        style: TextStyle(
                          color: textColorSecondary,
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(width: 8),
                      ParlayTag(),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '+445',
                style: TextStyle(
                  color: accentGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '22 Dec at 01:32 am',
                style: TextStyle(color: textColorSecondary, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SmallLogo extends StatelessWidget {
  final String imageUrl;
  const SmallLogo(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: 8, backgroundImage: NetworkImage(imageUrl));
  }
}

class ParlayTag extends StatelessWidget {
  const ParlayTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: primaryBgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text(
        'Parlay',
        style: TextStyle(color: textColorSecondary, fontSize: 10),
      ),
    );
  }
}
