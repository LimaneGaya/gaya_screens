import 'dart:ui';
import 'package:flutter/material.dart';

class P6 extends StatelessWidget {
  const P6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: kToolbarHeight + 20,
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
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topCenter,
        children: [
          Image.network(
            'https://picsum.photos/200/300',
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: kToolbarHeight + 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sales Activity',
                      style: TextStyle(fontFamily: 'HubotSans', fontSize: 21),
                    ),
                    IconButton.filled(
                      onPressed: () {},
                      icon: Icon(Icons.bar_chart_rounded),
                    ),
                  ],
                ),
                Container(
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey.shade700, width: 1),
                  ),
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 20),
                      FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.currency_bitcoin_rounded),
                      ),
                      SizedBox(height: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.white.withValues(alpha: 0.3),
                            width: double.infinity,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Total Balance',
                                  style: TextStyle(
                                    fontFamily: 'HubotSans',
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  '\$3,000.00',
                                  style: TextStyle(
                                    fontFamily: 'HubotSans',
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardPaiment(
                      text: 'Receive',
                      color: const Color(0xFF4CAF50),
                      icon: Icons.arrow_downward,
                    ),
                    CardPaiment(
                      text: 'Send',
                      color: const Color(0xFFF44336),
                      icon: Icons.arrow_upward,
                    ),
                    CardPaiment(
                      text: 'Payments',
                      color: const Color(0xFF3F51B5),
                      icon: Icons.credit_card,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey.shade700, width: 1),

                    color: const Color(0xFF292929),
                  ),
                  child: const Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.access_time_rounded, color: Colors.grey),
                        SizedBox(width: 10),
                        Text(
                          "You don't have transactions yet",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade900,
                        ),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.spa_rounded,
                                  color: Colors.redAccent,
                                  size: 25,
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_circle_right_rounded,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ],
                            ),
                            SizedBox(height: 3),
                            Text(
                              "Reach New Heights",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "Unlock exclusive\nrewards and bonuses as\nyou invest.",
                              style: TextStyle(color: Colors.grey.shade500, fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade900,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.spa_rounded,
                                  color: Colors.purple,
                                  size: 25,
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_circle_right_rounded,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ],
                            ),
                            SizedBox(height: 3),
                            Text(
                              "Double you gains",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "Special promotions for\ntop-performing\ncryptocurencies.",
                              style: TextStyle(color: Colors.grey.shade500, fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.wallet_rounded), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class CardPaiment extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;

  const CardPaiment({
    super.key,
    required this.text,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.shade900,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color,
            ),
            child: Icon(icon, color: Colors.white, size: 26),
          ),
          const SizedBox(height: 5),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
