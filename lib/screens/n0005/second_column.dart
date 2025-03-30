import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

const Color primaryBgColor = Color(0xFF1A1A1A);
const Color cardBgColor = Color(0xFF2C2C2E);
const Color accentGreen = Color(0xFFC6FF00);
const Color accentRed = Color(0xFFFF453A);
const Color textColorPrimary = Colors.white;
const Color textColorSecondary = Colors.grey;

class SecondColumn extends StatelessWidget {
  const SecondColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [StatsAndPlayersCard()],
        ),
      ),
    );
  }
}

class StatsAndPlayersCard extends StatelessWidget {
  const StatsAndPlayersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatItem("Total Wagered", "\$3,433.0", "+4.5%", true),
        const SizedBox(height: 2),
        StatItem("Percentage of Total Bets", "34%", "+4.5%", true),
        const SizedBox(height: 2),
        StatItem("Event Count", "35", "+4.5%", true),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyTab("Events"),
            MyTab("Players", isSelected: true),
            MyTab("Bets"),
            MyTab("Plays"),
          ],
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.all(16),
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
            children: [
              PlayerDetailRow(),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Stack(
                      fit: StackFit.passthrough,
                      alignment: Alignment.center,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.5, 
                            color: Colors.greenAccent),
                          ),
                          child: SizedBox(width: 25),
                        ),
                        Align(
                          alignment: Alignment(0.8, 0.0),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: SizedBox(width: 8, height: 8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),

                  Text(
                    "\$4,450",
                    style: TextStyle(
                      color: accentGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: accentRed,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.people_alt_outlined,
                          color: Colors.black,
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: 10),
                      UserFundInfo("Users", "67"),
                    ],
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey.shade800),
                    ),
                    child: SizedBox(height: 25),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: accentRed,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.people_alt_outlined,
                          color: Colors.black,
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: 10),
                      UserFundInfo("Funds", "\$22.4k"),
                    ],
                  ),
                ],
              ),
              const Divider(height: 30, color: textColorSecondary,thickness: 0.5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star_border_rounded, size: 20,color: Colors.brown),
                          const SizedBox(width: 5),
                          const Text(
                            'Best Players',
                            style: TextStyle(
                              color: textColorPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.pie_chart_outline_rounded, size: 14),
                      
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: const [
                          Text(
                            'Pro',
                            style: TextStyle(
                              color: textColorSecondary,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '4',
                            style: TextStyle(
                              color: textColorPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 100,
                        height: 35,
                        child: Stack(
                          children: [
                            MyAvatar('https://picsum.photos/50', 0),
                            MyAvatar('https://picsum.photos/51', 1),
                            MyAvatar('https://picsum.photos/52', 2),
                            MyAvatar('https://picsum.photos/53', 3),
                          ],
                        ),
                      ),
                      Column(
                        children: const [
                          Icon(
                            Icons.arrow_forward,
                            color: textColorSecondary,
                            size: 16,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '+145',
                            style: TextStyle(
                              color: textColorSecondary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: cardBgColor,
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Week activity',
                  style: TextStyle(
                    color: textColorPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Last week -4.5%',
                  style: TextStyle(color: accentRed, fontSize: 12),
                ),
              ],
            ),
            Text(
              '\$2,200',
              style: TextStyle(
                color: textColorPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(height: 50, child: BarChart(_buildBarChartData())),
        const SizedBox(height: 10),
      ],
    );
  }
}

class MyTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  const MyTab(this.text, {super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: isSelected ? accentGreen : textColorSecondary,
        fontSize: 14,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}

class PlayerDetailRow extends StatelessWidget {
  const PlayerDetailRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.red[900],
          child: Text(
            'RS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Red Sox",
              style: TextStyle(
                color: textColorPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "25% Full",
              style: TextStyle(color: textColorSecondary, fontSize: 12),
            ),
          ],
        ),
        Spacer(),
        RotatedBox(
          quarterTurns: 1,
          child: Icon(Icons.more_horiz, color: textColorSecondary, size: 20),
        ),
      ],
    );
  }
}

class UserFundInfo extends StatelessWidget {
  final String label;
  final String value;
  const UserFundInfo(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: textColorSecondary, fontSize: 12),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: textColorPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class MyAvatar extends StatelessWidget {
  final String imageUrl;
  final int index;
  const MyAvatar(this.imageUrl, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: index * 20.0,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: cardBgColor,
        child: CircleAvatar(
          radius: 18,
          backgroundImage: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}

BarChartData _buildBarChartData() {
  return BarChartData(
    alignment: BarChartAlignment.spaceAround,
    maxY: 10,
    gridData: FlGridData(show: false),
    titlesData: FlTitlesData(show: false),
    borderData: FlBorderData(show: false),
    barTouchData: BarTouchData(enabled: false),
    barGroups: List.generate(7, (index) {
      double yValue = (index * 1.2 + 2).toDouble();
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: yValue,
            color: accentGreen.withValues(alpha: 0.6),
            width: 10,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ],
      );
    }),
  );
}

class StatItem extends StatelessWidget {
  final String title;
  final String value;
  final String percentage;
  final bool positive;
  const StatItem(
    this.title,
    this.value,
    this.percentage,
    this.positive, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(27),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: positive ? accentGreen : accentRed,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.monetization_on_outlined,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: textColorSecondary,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                      color: textColorPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    percentage,
                    style: TextStyle(
                      color: positive ? accentGreen : accentRed,
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    positive ? Icons.arrow_upward : Icons.arrow_downward,
                    color: positive ? accentGreen : accentRed,
                    size: 14,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
            ),
            child: SizedBox(width: 150),
          ),
        ],
      ),
    );
  }
}
