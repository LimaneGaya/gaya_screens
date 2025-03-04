import 'package:flutter/material.dart';

class P3 extends StatelessWidget {
  const P3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            height: MediaQuery.of(context).size.height - 65,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton.small(
                      heroTag: 'new',
                      backgroundColor: Colors.grey.shade900,
                      child: Icon(Icons.close, color: Colors.white),
                      onPressed: () {},
                    ),
                    Spacer(flex: 2),
                    Text(
                      'Send Crypto',
                      style: TextStyle(
                        fontFamily: 'HubotSans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(flex: 3),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 15, bottom: 5),
                  height: 135,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(27),
                    border: Border.all(color: Colors.grey.shade800, width: 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton.filledTonal(
                        onPressed: () {},
                        icon: Icon(Icons.monetization_on),
                      ),
                      Text(
                        'Balance By',
                        style: TextStyle(fontFamily: 'HubotSans', fontSize: 12),
                      ),
                      Text(
                        '15500,00',
                        style: TextStyle(
                          fontFamily: 'HubotSans',
                          fontSize: 37,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...['\$100', '\$200', '\$500', '\$1000'].map(
                        (e) => Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 2,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                          child: Center(
                            child: Text(
                              e,
                              style: TextStyle(
                                fontFamily: 'HubotSans',
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 300),
                  child: Center(
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                      childAspectRatio: 2,
                      children:
                          [
                            '1',
                            '2',
                            '3',
                            '4',
                            '5',
                            '6',
                            '7',
                            '8',
                            '9',
                            '0',
                            '000',
                            'delete',
                          ].map((e) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child:
                                    e == 'delete'
                                        ? Icon(
                                          Icons.backspace,
                                          color: Colors.white,
                                        )
                                        : Text(
                                          e,
                                          style: TextStyle(
                                            fontFamily: 'HubotSans',
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 300),
                  child: Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(minimumSize: Size(100, 60),
                          backgroundColor: Theme.of(context).colorScheme.onPrimary,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Send Crypto',
                          style: TextStyle(
                            fontFamily: 'HubotSans',
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
