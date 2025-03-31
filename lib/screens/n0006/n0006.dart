import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class N0006 extends StatelessWidget {
  const N0006({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    const SubscriptionSoldCard(),
                    const SizedBox(height: 24),
                    const ActiveSubscribersCard(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
      
    );
  }
}

class SubscriptionSoldCard extends StatelessWidget {
  const SubscriptionSoldCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: const Color(0xFF1A1A1A),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Subscriptions Sold',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFFAAAAAA),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  '17,296',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D9473).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    '+11.9%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF0D9473),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                _buildLegendItem('Individual', Colors.red.shade300),
                const SizedBox(width: 12),
                _buildLegendItem('Team', Colors.purple.shade300),
                const SizedBox(width: 12),
                _buildLegendItem('Enterprise', const Color(0xFF2EBCA3)),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(height: 250, child: SubscriptionsBarChart()),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(fontSize: 14, color: Color(0xFFAAAAAA)),
        ),
      ],
    );
  }
}

class SubscriptionsBarChart extends StatelessWidget {
  const SubscriptionsBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceBetween,
        maxY: 25000,
        minY: 0,
        groupsSpace: 12,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                String text = '';
                switch (value.toInt()) {
                  case 0:
                    text = '0';
                    break;
                  case 5000:
                    text = '5K';
                    break;
                  case 10000:
                    text = '10K';
                    break;
                  case 20000:
                    text = '20K';
                    break;
                  case 25000:
                    text = '25K';
                    break;
                }
                return Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xFF6E6E6E),
                    fontSize: 12,
                  ),
                );
              },
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                String text = '';
                if (value.toInt() == 0) {
                  text = 'Jan 2024';
                } else if (value.toInt() == 11) {
                  text = 'Dec 2025';
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Color(0xFF6E6E6E),
                      fontSize: 12,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          horizontalInterval: 5000,
          drawVerticalLine: false,
          getDrawingHorizontalLine:
              (value) => FlLine(
                color: const Color(0xFF3A3A3A),
                strokeWidth: 1,
                dashArray: [5, 5],
              ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: [
          _generateBarGroup(0, 1200, 2000, 800), // Jan
          _generateBarGroup(1, 1000, 4000, 1500), // Feb
          _generateBarGroup(2, 1500, 3000, 1000), // Mar
          _generateBarGroup(3, 2000, 4500, 1500), // Apr
          _generateBarGroup(4, 2500, 6000, 3500), // May
          _generateBarGroup(5, 2000, 5000, 2000), // Jun
          _generateBarGroup(6, 1800, 2000, 500), // Jul
          _generateBarGroup(7, 2200, 4000, 1800), // Aug
          _generateBarGroup(8, 4000, 9000, 7000), // Sep
          _generateBarGroup(9, 2500, 5000, 1500), // Oct
          _generateBarGroup(10, 1000, 1500, 500), // Nov
          _generateBarGroup(11, 1800, 3200, 1000), // Dec
        ],
      ),
    );
  }

  BarChartGroupData _generateBarGroup(
    int x,
    double individual,
    double team,
    double enterprise,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: individual + team + enterprise,
          width: 16,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
          rodStackItems: [
            BarChartRodStackItem(0, individual, Colors.red.shade300),
            BarChartRodStackItem(
              individual,
              individual + team,
              Colors.purple.shade300,
            ),
            BarChartRodStackItem(
              individual + team,
              individual + team + enterprise,
              const Color(0xFF2EBCA3),
            ),
          ],
        ),
      ],
    );
  }
}

class ActiveSubscribersCard extends StatelessWidget {
  const ActiveSubscribersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: const Color(0xFF1A1A1A),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Active Subscribers',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFFAAAAAA),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  '142,869',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D9473).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    '+24.7%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF0D9473),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                _buildLegendItem('Current', Colors.purple.shade300),
                const SizedBox(width: 12),
                _buildLegendItem('Previous', const Color(0xFF6E6E6E)),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(height: 250, child: ActiveSubscribersLineChart()),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(fontSize: 14, color: Color(0xFFAAAAAA)),
        ),
      ],
    );
  }
}

class ActiveSubscribersLineChart extends StatelessWidget {
  const ActiveSubscribersLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 150000,
        lineTouchData: LineTouchData(
          touchCallback: (event, touchResponse) {},
          handleBuiltInTouches: true,
        ),
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          horizontalInterval: 50000,
          drawVerticalLine: false,
          getDrawingHorizontalLine:
              (value) => FlLine(
                color: const Color(0xFF3A3A3A),
                strokeWidth: 1,
                dashArray: [5, 5],
              ),
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                String text = '';
                if (value.toInt() == 0) {
                  text = '\$0';
                } else if (value.toInt() == 10000) {
                  text = '10K';
                } else if (value.toInt() == 50000) {
                  text = '50K';
                } else if (value.toInt() == 100000) {
                  text = '100K';
                } else if (value.toInt() == 150000) {
                  text = '150K';
                }
                return Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xFF6E6E6E),
                    fontSize: 12,
                  ),
                );
              },
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const months = [
                  'Jan',
                  'Feb',
                  'Mar',
                  'Apr',
                  'May',
                  'Jun',
                  'Jul',
                  'Aug',
                  'Sep',
                  'Oct',
                  'Nov',
                  'Dec',
                ];
                if (value >= 0 && value <= 11) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      months[value.toInt()],
                      style: TextStyle(
                        color:
                            value.toInt() == 8
                                ? Colors.purple.shade300
                                : const Color(0xFF6E6E6E),
                        fontSize: 12,
                        fontWeight:
                            value.toInt() == 8
                                ? FontWeight.bold
                                : FontWeight.normal,
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [_createCurrentLine(), _createPreviousLine()],
        extraLinesData: ExtraLinesData(
          verticalLines: [
            VerticalLine(
              x: 8, // September
              color: Colors.purple.withValues(alpha: 0.3),
              strokeWidth: 20,
            ),
          ],
        ),
      ),
    );
  }

  LineChartBarData _createCurrentLine() {
    final List<FlSpot> spots = [
      const FlSpot(0, 5000),
      const FlSpot(1, 10000),
      const FlSpot(2, 15000),
      const FlSpot(3, 10000),
      const FlSpot(4, 8000),
      const FlSpot(5, 40000),
      const FlSpot(6, 45000),
      const FlSpot(7, 35000),
      const FlSpot(8, 70000), // Sep with dot
      const FlSpot(9, 55000),
      const FlSpot(10, 75000),
      const FlSpot(11, 90000),
    ];

    return LineChartBarData(
      spots: spots,
      isCurved: true,
      curveSmoothness: 0.3,
      color: Colors.purple.shade300,
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, barData, index) {
          if (index == 8) {
            // September dot
            return FlDotCirclePainter(
              radius: 6,
              color: Colors.purple.shade300,
              strokeWidth: 2,
              strokeColor: Colors.white,
            );
          }
          return FlDotCirclePainter(
            radius: 0,
            color: Colors.transparent,
            strokeWidth: 0,
            strokeColor: Colors.transparent,
          );
        },
      ),
      belowBarData: BarAreaData(
        show: true,
        color: Colors.purple.shade300.withValues(alpha: 0.1),
      ),
    );
  }

  LineChartBarData _createPreviousLine() {
    final List<FlSpot> spots = [
      const FlSpot(0, 2000),
      const FlSpot(1, 25000),
      const FlSpot(2, 18000),
      const FlSpot(3, 28000),
      const FlSpot(4, 35000),
      const FlSpot(5, 60000),
      const FlSpot(6, 35000),
      const FlSpot(7, 65000),
      const FlSpot(8, 90000),
      const FlSpot(9, 85000),
      const FlSpot(10, 60000),
      const FlSpot(11, 85000),
    ];

    return LineChartBarData(
      spots: spots,
      isCurved: true,
      curveSmoothness: 0.3,
      color: const Color(0xFF6E6E6E),
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
    );
  }
}
