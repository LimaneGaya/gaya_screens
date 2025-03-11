import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class P5 extends StatelessWidget {
  const P5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 20,
        backgroundColor: Colors.black,
        leadingWidth: kToolbarHeight + 20,
        leading: Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: FloatingActionButton.extended(
              onPressed: () => Navigator.pop(context),
              backgroundColor: Colors.grey.shade900,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19),
              ),
              label: Icon(Icons.arrow_back),
            ),
          ),
        ),
        actions: [
          SizedBox(
            width: 50,
            height: 50,
            child: FloatingActionButton.extended(
              heroTag: 'card',
              backgroundColor: Colors.grey.shade900,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19),
              ),
              label: Icon(Icons.card_giftcard, color: Colors.white),
            ),
          ),
          SizedBox(width: 3),
          SizedBox(
            width: 50,
            height: 50,
            child: FloatingActionButton.extended(
              heroTag: 'notification',
              backgroundColor: Colors.white,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19),
              ),
              label: Icon(
                Icons.notifications_none_rounded,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Sales Activity',
                  style: TextStyle(
                    fontFamily: 'HubotSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton.filled(
                  onPressed: () {},
                  icon: Icon(Icons.bar_chart_rounded),
                ),
              ],
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.pink.shade100, Colors.white],
                ),
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 90,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        LineChart(
                          LineChartData(
                            lineBarsData: [
                              LineChartBarData(
                                spots: [
                                  FlSpot(2, 4),
                                  FlSpot(3, 4),
                                  FlSpot(4, 3),
                                  FlSpot(5, 3),
                                  FlSpot(6, 2),
                                  FlSpot(7, 2),
                                  FlSpot(8, 3),
                                  FlSpot(9, 3),
                                  FlSpot(10, 4),
                                  FlSpot(11, 4),
                                  FlSpot(12, 3),
                                  FlSpot(13, 3),
                                  FlSpot(14, 2.5),
                                  FlSpot(15, 2.5),
                                  FlSpot(16, 3),
                                  FlSpot(17, 3),
                                  FlSpot(18, 4),
                                  FlSpot(19, 4),
                                ],
                                isCurved: true,
                                color: Colors.pinkAccent,
                                barWidth: 2,
                                dotData: FlDotData(show: false),
                                belowBarData: BarAreaData(show: false),
                              ),
                            ],
                            borderData: FlBorderData(show: false),
                            gridData: FlGridData(show: false),
                            extraLinesData: ExtraLinesData(
                              extraLinesOnTop: false,
                            ),
                            titlesData: FlTitlesData(show: false),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: FloatingActionButton(
                            onPressed: () {},
                            child: Icon(Icons.currency_bitcoin_rounded),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Crypto trading using\nan AI bot',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'HubotSans',
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Get Started',
                      style: TextStyle(fontFamily: 'HubotSans', fontSize: 11),
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Icon(Icons.auto_awesome),
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent.withAlpha(180),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Total',
                      style: TextStyle(
                        fontFamily: 'HubotSans',
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Per Platform',
                      style: TextStyle(fontFamily: 'HubotSans', fontSize: 10),
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  'Month',
                  style: TextStyle(fontFamily: 'HubotSans', fontSize: 11),
                ),
                SizedBox(width: 5),
                Icon(Icons.swap_vert_rounded, size: 17),
              ],
            ),
            SizedBox(
              height: 295,
              width: 285,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircleContainer(
                    x: 0.9,
                    y: -0.6,
                    radius: 120,
                    iconSize: 25,
                    text: '1,223',
                    fontSize: 23,
                    icon: Icons.currency_bitcoin_rounded,
                    color: Colors.greenAccent,
                  ),
                  CircleContainer(
                    x: -0.3,
                    y: -0.6,
                    radius: 90,
                    iconSize: 15,
                    text: '0,050',
                    fontSize: 17,
                    icon: Icons.sunny_snowing,
                    color: Colors.yellow.shade300,
                  ),
                  CircleContainer(
                    x: -0.99,
                    y: -0.02,
                    radius: 90,
                    iconSize: 15,
                    text: '5,700',
                    fontSize: 17,
                    icon: Icons.sports_basketball_rounded,
                    color: Colors.greenAccent.shade100,
                  ),
                  CircleContainer(
                    x: -0.03,
                    y: 0.35,
                    radius: 110,
                    iconSize: 17,
                    text: '12m  ',
                    fontSize: 23,
                    icon: Icons.landslide_rounded,
                    color: Colors.deepPurpleAccent.shade100,
                  ),
                  CircleContainer(
                    x: -0.75,
                    y: 0.65,
                    radius: 70,
                    iconSize: 12,
                    text: '0,100 ',
                    fontSize: 12,
                    icon: Icons.settings_ethernet_rounded,
                    color: Colors.yellow.shade100,
                  ),
                  CircleContainer(
                    x: 0.96,
                    y: 0.45,
                    radius: 90,
                    iconSize: 15,
                    text: '0,930 ',
                    fontSize: 15,
                    icon: Icons.ac_unit_rounded,
                    color: Colors.pink.shade100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleContainer extends StatelessWidget {
  final double x;
  final double y;
  final double radius;
  final double iconSize;
  final String text;
  final double fontSize;
  final IconData icon;
  final Color color;
  const CircleContainer({
    super.key,
    required this.x,
    required this.y,
    required this.radius,
    required this.iconSize,
    required this.text,
    required this.fontSize,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(x, y),
      child: Container(
        padding: EdgeInsets.all(5),
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade900,
        ),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: Icon(icon, color: Colors.white, size: iconSize),
              ),
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'HubotSans',
                  fontSize: fontSize,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
