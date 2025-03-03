import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class P2 extends StatelessWidget {
  const P2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(7.0),
          child: FloatingActionButton.small(
            heroTag: 'back',
            backgroundColor: Colors.black,
            child: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: FloatingActionButton.small(
              heroTag: 'card',
              backgroundColor: Colors.black,
              child: Icon(Icons.card_giftcard, color: Colors.white),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: FloatingActionButton.small(
              heroTag: 'notification',
              backgroundColor: Colors.white,
              child: Icon(Icons.notifications, color: Colors.black),
              onPressed: (){},
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: kToolbarHeight + 20),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 10),
                ...['Savings', 'Account', 'Cards', 'Assets'].map(
                  (e) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    margin: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    child: Center(
                      child: Text(
                        e,
                        style: TextStyle(fontFamily: 'HubotSans', fontSize: 11),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Builder(
            builder: (context) {
              final w = 80.0;
              final r = 27.0;
              return Container(
                height: w,
                width: w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(r),
                  color: Colors.white.withAlpha(50),
                ),
                child: Center(
                  child: Container(
                    height: w - 15,
                    width: w - 15,
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(50),
                      border: Border.all(
                        color: Colors.white.withAlpha(60),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(r - 4),
                    ),
                    child: Center(
                      child: Container(
                        height: w - 30,
                        width: w - 30,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(r - 8),
                        ),
                        child: Icon(
                          Icons.credit_card,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 8),
          Text(
            'Savings',
            style: TextStyle(
              fontFamily: 'HubotSans',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Special Promotions for top-\nperforming cryptocurrencies',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'HubotSans', fontSize: 12),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(27),
              color: Colors.white.withAlpha(50),
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: Icon(Icons.credit_card, size: 30, color: Colors.white),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Investment',
                      style: TextStyle(
                        fontFamily: 'HubotSans',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Limited-time discounts on\ntransaction fees and more.',
                      style: TextStyle(
                        fontFamily: 'HubotSans',
                        fontSize: 12,
                        color: Colors.white.withAlpha(100),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                IconButton.filledTonal(
                  onPressed: () {},
                  icon: Icon(Icons.refresh_rounded),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27),
                border: Border.all(color: Colors.grey.shade900, width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(19),
                        ),
                        child: Icon(
                          Icons.monetization_on,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(width: 10),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tokens',
                            style: TextStyle(
                              fontFamily: 'HubotSans',
                              fontSize: 11,
                              color: Colors.white.withAlpha(100),
                            ),
                          ),
                          Text(
                            '\$2300,00',
                            style: TextStyle(
                              fontFamily: 'HubotSans',
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Total balance',
                    style: TextStyle(
                      fontFamily: 'HubotSans',
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, right: 25,),
                      child: LineChart(
                        LineChartData(
                          lineBarsData: [
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
                              isCurved: false,
                              color: Colors.blue,
                              barWidth: 3,
                              belowBarData: BarAreaData(
                                show: true,
                                color: Colors.blue.withAlpha(75),
                              ),
                            ),
                          ],
                          borderData: FlBorderData(show: true),
                          gridData: FlGridData(show: true),
                          extraLinesData: ExtraLinesData(extraLinesOnTop: false),
                          titlesData: FlTitlesData(
                            rightTitles: AxisTitles(
                              axisNameSize: 5,
                            ),
                            topTitles: AxisTitles(
                              axisNameSize: 5,
                            ),
                            show: true,
                          ),
                        ),
                        duration: Duration(seconds: 2),
                        curve: Curves.linear, // Optional
                      ),
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
