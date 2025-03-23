import 'package:flutter/material.dart';

class N0004 extends StatelessWidget {
  const N0004({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primarySwatch: Colors.blue, fontFamily: 'SF Pro Display'),
      child: CardScreen(),
    );
  }
}

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      body: Center(
        child: Container(
          width: 340,
          height: 460,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildHeader(),
              const SizedBox(height: 20),
              _buildCardContent(),
              const SizedBox(height: 25),
              _buildSpendingLimit(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Text(
          "My Cards",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF181C1E),
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            "+ Add Card",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF007BFF),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardContent() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFE0E0E0), Color(0xFFF5F5F5)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: const Center(
                      child: Icon(Icons.wifi, color: Colors.white, size: 16),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Active',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4CAF50),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.credit_card, color: Colors.red, size: 20),
                  Icon(Icons.credit_card, color: Colors.orange, size: 20),
                ],
              ),
            ],
          ),
          const SizedBox(height: 50),
          const Text(
            "Savings Card",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF181C1E),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "\$16,058.94",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF181C1E),
                ),
              ),
              Spacer(),
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade500, width: 1),
                    right: BorderSide(color: Colors.grey.shade500, width: 0.5),
                    top: BorderSide(color: Colors.grey.shade500, width: 1),
                    left: BorderSide(color: Colors.grey.shade500, width: 1),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7),
                    bottomLeft: Radius.circular(7),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 10,
                    color: Color(0xFF181C1E),
                  ),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade500, width: 1),
                    right: BorderSide(color: Colors.grey.shade500, width: 1),
                    top: BorderSide(color: Colors.grey.shade500, width: 1),
                    left: BorderSide(color: Colors.grey.shade500, width: 0.5),
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(7),
                    bottomRight: Radius.circular(7),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 10,
                    color: Color(0xFF181C1E),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSpendingLimit() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: SegmentedButton(
            showSelectedIcon: false,
            onSelectionChanged: (_) {},
            segments: const [
              ButtonSegment(value: 1, label: Text("Daily")),
              ButtonSegment(value: 2, label: Text("Weekly")),
              ButtonSegment(value: 3, label: Text("Monthly")),
            ],
            selected: const {2},
          ),
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                value: 0.5,
                strokeWidth: 8,
                color: Color(0xFF007BFF),
                backgroundColor: Color(0xFFE0E0E0),
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Spending Limit",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF181C1E),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "\$1,500.00 ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF181C1E),
                      ),
                    ),
                    Text(
                      "/ week",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade500, width: 1),
                  right: BorderSide(color: Colors.grey.shade500, width: 1),
                  top: BorderSide(color: Colors.grey.shade500, width: 1),
                  left: BorderSide(color: Colors.grey.shade500, width: 1),
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 10,
                  color: Color(0xFF181C1E),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
