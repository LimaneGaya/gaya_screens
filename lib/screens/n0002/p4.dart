import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class P4 extends StatelessWidget {
  const P4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FloatingActionButton.small(
            child: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Row(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Transform.rotate(
                  angle: 45 * 3.1415926535 / 180,
                  child: Icon(
                    Icons.airplane_ticket_rounded,
                    color: Colors.white,
                    size: 17,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Account #11234",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 0.7,
            center: Alignment(0.6, -0.2),
            colors: [Colors.pinkAccent.withAlpha(5), Colors.black],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Sales Activity',
                style: TextStyle(fontFamily: 'HubotSans', fontSize: 22),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: Icon(
                      Icons.shopping_basket_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Big savings on Blockchain',
                        style: TextStyle(
                          fontFamily: 'HubotSans',
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Limited-time discounts on\ntransaction fees and more.',
                        style: TextStyle(
                          fontFamily: 'HubotSans',
                          fontSize: 10,
                          color: Colors.white.withAlpha(100),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  IconButton.filledTonal(
                    onPressed: () {},
                    style: IconButton.styleFrom(padding: EdgeInsets.all(5)),
                    constraints: BoxConstraints(maxHeight: 30, maxWidth: 30),
                    icon: Icon(Icons.refresh_rounded),
                    iconSize: 20,
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
            Container(
              height: 310,
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade900,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Icon(Icons.eleven_mp, size: 20),
                          ),
                        ),
                        SizedBox(width: 17),
                        Text(
                          'Daily deals',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '08:00',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                      Text(
                        '11:00',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                      Text(
                        '14:00',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                      Text(
                        '17:00',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                      Text(
                        '20:00',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Expanded(
                    child: LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              FlSpot(0, 3),
                              FlSpot(2, 4),
                              FlSpot(4, 3),
                              FlSpot(7, 4.5),
                            ],
                            isCurved: true,
                            color: Colors.greenAccent,
                            barWidth: 2,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(show: false),
                          ),
                          LineChartBarData(
                            spots: [
                              FlSpot(0, 1.5),
                              FlSpot(1, 2.5),
                              FlSpot(2, 1.0),
                              FlSpot(3, 4.0),
                              FlSpot(4, 2.0),
                              FlSpot(5, 5.0),
                              FlSpot(6, 3.0),
                              FlSpot(7, 6.0),
                            ],
                            isCurved: true,
                            color: Colors.pinkAccent,
                            barWidth: 2,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              gradient: LinearGradient(
                                end: Alignment.bottomCenter,
                                begin: Alignment.topCenter,
                                stops: [0.5, 1],
                                colors: [
                                  Colors.pinkAccent.withAlpha(100),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ],
                        borderData: FlBorderData(show: false),
                        gridData: FlGridData(show: false),
                        extraLinesData: ExtraLinesData(extraLinesOnTop: false),
                        titlesData: FlTitlesData(show: false),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 15,
                    ),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent.withAlpha(180),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                          ),
                          child: Text(
                            'SALES',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent.withAlpha(180),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                          ),
                          child: Text(
                            'PURCHASES',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Recent Transactions',
                    style: TextStyle(fontFamily: 'HubotSans', fontSize: 16),
                  ),
                  IconButton.filled(
                    onPressed: () {},
                    icon: Icon(Icons.bar_chart_rounded),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: Image.network(
                      'https://picsum.photos/50/50',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'CronoVault',
                        style: TextStyle(
                          fontFamily: 'HubotSans',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Mon, 20 June',
                        style: TextStyle(
                          fontFamily: 'HubotSans',
                          fontSize: 10,
                          color: Colors.white.withAlpha(100),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    '\$3,600',
                    style: TextStyle(
                      fontFamily: 'HubotSans',
                      fontSize: 20,
                      color: Colors.white,
                    ),
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
