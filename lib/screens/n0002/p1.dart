import 'package:flutter/material.dart';

class P1 extends StatelessWidget {
  const P1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Analytics',
                  style: TextStyle(
                    fontFamily: 'HubotSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton.filled(onPressed: () {}, icon: Icon(Icons.add)),
              ],
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 40, // Add a fixed height for the ListView
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(width: 10),
                ...['Day', 'Week', '2 Weeks', 'Month', '6 Months', 'Year'].map(
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
          SizedBox(height: 10),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      radius: 0.8,focal: Alignment.centerRight,
                      stops: [0.1,0.5,0.85],
                      colors: [
                        Theme.of(context).colorScheme.onSecondary,
                        Theme.of(context).colorScheme.onTertiary,
                        Colors.black
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Earn last week',
                        style: TextStyle(
                          fontFamily: 'HubotSans',
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Text(
                        '\$2,300.00',
                        style: TextStyle(
                          fontFamily: 'HubotSans',
                          fontSize: 27,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Theme.of(context).colorScheme.onPrimary,
                          Theme.of(context).colorScheme.onSecondary,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'New Token',
                              style: TextStyle(
                                fontFamily: 'HubotSans',
                                fontSize: 13,
                              ),
                            ),
                            Container(
                              width: 27,
                              height: 27,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.arrow_right_alt, size: 16),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).colorScheme.onTertiary,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  '🐶',
                                  style: TextStyle(fontSize: 23),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Doggies',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                Text(
                                  'by Corgi',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              '\$6,300',
                              style: TextStyle(
                                fontFamily: 'HubotSans',
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.access_time, size: 10),
                            SizedBox(width: 10),
                            SizedBox(height: 10),
                            Text(
                              'Mondey, September 22',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
