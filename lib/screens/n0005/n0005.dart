import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math' as math;

// Define colors based on the image for consistency
const Color primaryBgColor = Color(
  0xFF1A1A1A,
); // Slightly darker than pure black
const Color cardBgColor = Color(0xFF2C2C2E); // Dark grey for cards
const Color accentGreen = Color(0xFFC6FF00); // Neon green accent
const Color accentRed = Color(0xFFFF453A); // Red for losses/negative
const Color textColorPrimary = Colors.white;
const Color textColorSecondary = Colors.grey; // For less important text

class N0005 extends StatelessWidget {
  const N0005({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBgColor,
      body: Row(
        children: [
          _buildSidebar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 20),
                  _buildMainContentGrid(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Sidebar ---
  Widget _buildSidebar() {
    return Container(
      width: 70,
      color: cardBgColor, // Sidebar has a slightly different bg in the image
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Logo Placeholder
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: accentGreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                '\$', // Placeholder for logo
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          _buildSidebarIcon(Icons.home_filled, isSelected: true),
          _buildSidebarIcon(Icons.access_time),
          _buildSidebarIcon(Icons.grid_view_rounded),
          _buildSidebarIcon(Icons.chat_bubble_outline),
          _buildSidebarIcon(Icons.bar_chart_rounded),
          _buildSidebarIcon(Icons.calendar_today_outlined),
          _buildSidebarIcon(Icons.bookmark_border),
          const Spacer(), // Pushes logout to bottom
          _buildSidebarIcon(Icons.logout_outlined),
        ],
      ),
    );
  }

  Widget _buildSidebarIcon(IconData icon, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? accentGreen.withOpacity(0.2) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        color: isSelected ? accentGreen : textColorSecondary,
        size: 20,
      ),
    );
  }

  // --- Header ---
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left side: Title and Filters
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dashboard',
              style: TextStyle(
                color: textColorPrimary,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildFilterChip(
                  'Overview',
                  Icons.star_border,
                  isSelected: true,
                ),
                _buildFilterChip('Favorites', Icons.favorite_border),
                _buildFilterChip('PPC', Icons.flash_on_outlined),
                _buildFilterChip('Customize', Icons.settings_outlined),
              ],
            ),
          ],
        ),
        // Right side: Search and Actions
        Row(
          children: [
            // Search Bar
            Container(
              width: 250,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: cardBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                style: TextStyle(color: textColorPrimary),
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: textColorSecondary),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: textColorSecondary),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(width: 15),
            // Action Buttons
            _buildActionButton(Icons.add, isPrimary: true),
            const SizedBox(width: 10),
            _buildActionButton(Icons.notifications_none),
            const SizedBox(width: 10),
            _buildActionButton(Icons.swap_horiz),
            const SizedBox(width: 10),
            _buildActionButton(Icons.history),
          ],
        ),
      ],
    );
  }

  Widget _buildFilterChip(
    String label,
    IconData icon, {
    bool isSelected = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? accentGreen : textColorSecondary,
            size: 18,
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? accentGreen : textColorSecondary,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, {bool isPrimary = false}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isPrimary ? Colors.white : cardBgColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: isPrimary ? Colors.black : textColorSecondary,
        size: 20,
      ),
    );
  }

  // --- Overview Top Cards ---
  Widget _buildOverviewSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          child: _buildInfoCard(
            'Total Income',
            '\$3,433.0',
            Icons.monetization_on_outlined,
            Colors.green.shade900.withOpacity(0.8),
            Colors.green,
          ),
        ),
        SizedBox(width: 5),
        Flexible(
          child: _buildInfoCard(
            'Total Payers',
            '11,443',
            Icons.people_alt_outlined,
            Colors.orange.shade900.withOpacity(0.8),
            Colors.orange,
          ),
        ),
        SizedBox(width: 5),
        Flexible(
          child: _buildInfoCard(
            'Total Time',
            '11,443',
            Icons.timer_outlined,
            Colors.red.shade900.withOpacity(0.8),
            Colors.red,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(
    String title,
    String value,
    IconData icon,
    Color backColor,
    Color iconColor,
  ) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 2),
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: iconColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.black, size: 20),
              ),
              Icon(Icons.more_horiz, color: Colors.white, size: 16),
            ],
          ),
          const SizedBox(height: 25),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),

          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          Center(
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: BoxBorder.all(width: 1, color: Colors.white),
              ),
              child: SizedBox(width: 50),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContentGrid() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            primary: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildOverviewSection(),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Top 5 Sport Categories',
                        style: TextStyle(
                          color: textColorPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(Icons.more_horiz, color: textColorSecondary),
                    ],
                  ),
                  const SizedBox(height: 5),
                  _buildHalfCircleChart(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Top 5 Leagues',
                        style: TextStyle(
                          color: textColorPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(Icons.more_horiz, color: textColorSecondary),
                    ],
                  ),
                  const SizedBox(height: 15),
                  _buildLeagueRow(
                    'NFL',
                    'assets/nfl_logo.png',
                    0.38,
                  ),
                  _buildLeagueRow(
                    'NFL',
                    'assets/nhl_logo.png',
                    0.78,
                  ),
                  _buildLeagueRow('NBA', 'assets/nba_logo.png', 0.78),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        // Middle Column
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildStatsAndPlayersCard(),
                const SizedBox(height: 20),
                _buildPlayersAndActivityCard(),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),
        // Right Column
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: BoxBorder.all(width: 1, color: Colors.white),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildProfileAndEarningsCard(),
                  const SizedBox(height: 20),
                  _buildFundsActivityCard(),
                  const SizedBox(height: 20),
                  _buildTransactionsCard(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHalfCircleChart() {
    return Container(
      padding: EdgeInsets.only(bottom: 8, top: 8, left: 8, right: 8),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxWidth / 1.5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(constraints.maxWidth, constraints.maxWidth / 1.5),
                  painter: HalfCircleChartPainter(),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '\$3,223.55',
                      style: TextStyle(
                        color: textColorPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Total profit',
                      style: TextStyle(color: textColorSecondary, fontSize: 12),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.shade800,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildSportIcon(Icons.sports_volleyball_outlined),
                        _buildSportIcon(Icons.sports_mma_outlined),
                        _buildSportIcon(Icons.sports_soccer),
                        _buildSportIcon(Icons.sports_football_outlined),
                        _buildSportIcon(Icons.sports_baseball_outlined),
                        _buildSportIcon(Icons.sports_hockey_outlined),
                      ],
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

  Widget _buildSportIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: primaryBgColor, shape: BoxShape.circle),
      child: Icon(icon, color: textColorSecondary, size: 20),
    );
  }

  Widget _buildLeagueRow(String name, String logoAssetPath, double progress) {
    // Placeholder for logo if asset fails
    Widget logoWidget = CircleAvatar(
      radius: 12,
      backgroundColor: Colors.grey[700],
      child: Text(name[0], style: TextStyle(color: Colors.white, fontSize: 10)),
    );
    // Uncomment below if you have actual assets:
    // try {
    //   logoWidget = Image.asset(logoAssetPath, height: 24, width: 24);
    // } catch (e) {
    //   // Keep placeholder if asset loading fails
    //   print("Error loading logo: $logoAssetPath");
    // }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          logoWidget,
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(color: textColorPrimary, fontSize: 14),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2, // Give progress bar more space
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: primaryBgColor,
                valueColor: const AlwaysStoppedAnimation<Color>(accentGreen),
                minHeight: 6,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '${(progress * 100).toInt()}%',
            style: const TextStyle(color: textColorSecondary, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsAndPlayersCard() {
    // Using Column for vertical stacking of stats and the tab section
    return Column(
      children: [
        _buildStatItem("Total Wagered", "\$3,433.0", "+4.5%", true),
        const SizedBox(height: 10),
        _buildStatItem("Percentage of Total Bets", "34%", "+4.5%", true),
        const SizedBox(height: 10),
        _buildStatItem("Event Count", "35", "+4.5%", true),
        const SizedBox(height: 15),
        _buildPlayerInfoSection(), // Contains Tabs and player details
      ],
    );
  }

  Widget _buildStatItem(
    String title,
    String value,
    String percentage,
    bool positive,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
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
          ),
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
    );
  }

  // This represents the section with Tabs (Players, Bets, Plays) and content below
  Widget _buildPlayerInfoSection() {
    // State management would be needed for real tab switching
    // For this static clone, we'll just show the "Players" state
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Tabs Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTab("Players", isSelected: true),
              _buildTab("Bets"),
              _buildTab("Plays"),
            ],
          ),
          const SizedBox(height: 15),
          // Content related to the selected tab (Showing Players content)
          _buildPlayerDetailRow(),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildUserFundInfo("Users", "67"),
              _buildUserFundInfo("Funds", "\$22.4k"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String text, {bool isSelected = false}) {
    return Text(
      text,
      style: TextStyle(
        color: isSelected ? accentGreen : textColorSecondary,
        fontSize: 14,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  Widget _buildPlayerDetailRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Placeholder for Red Sox logo
            CircleAvatar(
              radius: 16,
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
                SizedBox(height: 2),
                Text(
                  "25% Full",
                  style: TextStyle(color: textColorSecondary, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: const [
            Text(
              "\$4,450",
              style: TextStyle(color: accentGreen, fontWeight: FontWeight.bold),
            ), // Assuming this is profit/positive
            SizedBox(width: 5),
            Icon(
              Icons.flag_outlined,
              color: textColorSecondary,
              size: 16,
            ), // Flag icon?
            SizedBox(width: 10),
            Icon(Icons.more_horiz, color: textColorSecondary, size: 20),
          ],
        ),
      ],
    );
  }

  Widget _buildUserFundInfo(String label, String value) {
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

  Widget _buildProfileAndEarningsCard() {
    return Column(
      children: [
        _buildProfileHeader(),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _buildEarningLossCard(
                "Earned",
                "\$3,433.0",
                "+4.5%",
                true,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: _buildEarningLossCard("Lost", "\$11,443", "-5.2%", false),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            // Placeholder - replace with Image.network or Image.asset
            backgroundImage: NetworkImage(
              'https://via.placeholder.com/100/C6FF00/000000?text=JW',
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "John Williams",
                style: TextStyle(
                  color: textColorPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Last activity:",
                style: TextStyle(color: textColorSecondary, fontSize: 12),
              ),
              Text(
                "6 Dec, 2025 at 12:43 pm",
                style: TextStyle(color: textColorSecondary, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEarningLossCard(
    String title,
    String amount,
    String percentage,
    bool isEarning,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(12),
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
                  color: (isEarning ? accentGreen : accentRed).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6),
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
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(color: textColorSecondary, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Text(
            amount,
            style: const TextStyle(
              color: textColorPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            percentage,
            style: TextStyle(
              color: isEarning ? accentGreen : accentRed,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFundsActivityCard() {
    return Container(
      height: 250, // Give the chart enough height
      padding: const EdgeInsets.all(16),
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
                'Funds Activity',
                style: TextStyle(
                  color: textColorPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.segment,
                color: textColorSecondary,
              ), // Represents filter/sort icon
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            // Chart needs to expand within the column
            child: LineChart(_buildLineChartData()),
          ),
          const SizedBox(height: 10),
          // Legend/Summary below chart
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildLegendItem(Colors.green.shade300, "Active", "\$1,443"),
              _buildLegendItem(accentGreen, "Playing", "\$440"),
            ],
          ),
        ],
      ),
    );
  }

  LineChartData _buildLineChartData() {
    // Dummy data points
    final List<FlSpot> spots1 = [
      const FlSpot(0, 2), // Sat
      const FlSpot(1, 3.5), // Mon
      const FlSpot(2, 3), // Tue
      const FlSpot(3, 5), // Wed
      const FlSpot(4, 4), // Thr
      const FlSpot(5, 6), // Fri
      const FlSpot(6, 5.5), // Sat
    ];
    final List<FlSpot> spots2 = [
      const FlSpot(0, 1), // Sat
      const FlSpot(1, 2), // Mon
      const FlSpot(2, 4), // Tue
      const FlSpot(3, 3), // Wed
      const FlSpot(4, 2), // Thr
      const FlSpot(5, 3.5), // Fri
      const FlSpot(6, 3), // Sat
    ];

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false, // Only horizontal lines
        horizontalInterval: 2, // Interval based on y-axis values (e.g., 2k)
        getDrawingHorizontalLine: (value) {
          return FlLine(color: Colors.grey.withOpacity(0.2), strokeWidth: 1);
        },
      ),
      titlesData: FlTitlesData(
        // Bottom Titles (Days)
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
        // Left Titles (Amount)
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 2, // Show labels for every 2k
            reservedSize: 35,
            getTitlesWidget: (value, meta) {
              if (value == 0 || value == 2 || value == 4 || value == 6) {
                // Only show labels at intervals
                return Text(
                  '${value.toInt()}k',
                  style: const TextStyle(
                    color: textColorSecondary,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.left,
                );
              }
              return Container(); // Return empty for other values
            },
          ),
        ),
        // Hide Top and Right Titles
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      borderData: FlBorderData(show: false), // No border around the chart
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 7, // Adjust based on max data value + buffer
      lineBarsData: [
        _buildLineChartBarData(spots1, Colors.green.shade300), // Green line
        _buildLineChartBarData(spots2, accentGreen), // Yellowish-green line
      ],
      // Customize touch points/tooltips if needed
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
              ); // Assuming y represents thousands
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
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false), // Hide dots on the line
      belowBarData: BarAreaData(show: false), // No area fill below line
    );
  }

  Widget _buildLegendItem(Color color, String title, String value) {
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

  Widget _buildPlayersAndActivityCard() {
    // Contains "Best Players" and "Week activity"
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Best Players Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Best Players',
                style: TextStyle(
                  color: textColorPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: const [
                  Text(
                    'Pro',
                    style: TextStyle(color: textColorSecondary, fontSize: 12),
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
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Stacked Avatars
              SizedBox(
                width: 120, // Limit width for stacking effect
                height: 35,
                child: Stack(
                  children: [
                    _buildAvatar(
                      'https://via.placeholder.com/50/FF0000/FFFFFF?text=P1',
                      0,
                    ),
                    _buildAvatar(
                      'https://via.placeholder.com/50/00FF00/000000?text=P2',
                      1,
                    ),
                    _buildAvatar(
                      'https://via.placeholder.com/50/0000FF/FFFFFF?text=P3',
                      2,
                    ),
                    _buildAvatar(
                      'https://via.placeholder.com/50/FFFF00/000000?text=P4',
                      3,
                    ),
                    // Add + button visually overlapping
                    Positioned(
                      left: 4 * 20.0 + 5, // Position after last avatar
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: cardBgColor, width: 2),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Arrow and number
              Row(
                children: const [
                  Icon(
                    Icons.arrow_forward,
                    color: textColorSecondary,
                    size: 16,
                  ),
                  SizedBox(width: 5),
                  Text(
                    '+145',
                    style: TextStyle(color: textColorSecondary, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const Divider(height: 30, color: textColorSecondary),
          // Week Activity Section
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
                  ), // Example trend
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
          // Simple Bar Chart placeholder (fl_chart)
          SizedBox(
            height: 50, // Small height for the activity bars
            child: BarChart(
              _buildBarChartData(),
              swapAnimationDuration: const Duration(milliseconds: 250),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(String imageUrl, int index) {
    return Positioned(
      left: index * 20.0, // Overlap avatars
      child: CircleAvatar(
        radius: 15,
        backgroundColor: cardBgColor, // Border effect
        child: CircleAvatar(
          radius: 13,
          backgroundImage: NetworkImage(imageUrl),
        ),
      ),
    );
  }

  BarChartData _buildBarChartData() {
    // Simple data for 7 days
    return BarChartData(
      alignment: BarChartAlignment.spaceAround,
      maxY: 10, // Max value for the bars (adjust based on data)
      gridData: FlGridData(show: false), // Hide grid lines
      titlesData: FlTitlesData(show: false), // Hide titles
      borderData: FlBorderData(show: false), // Hide border
      barTouchData: BarTouchData(enabled: false), // Disable touch
      barGroups: List.generate(7, (index) {
        // Generate 7 bars
        // Example: Make bars taller towards the end of the week
        double yValue = (index * 1.2 + 2).toDouble();
        return BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: yValue,
              color: accentGreen.withOpacity(0.6), // Use semi-transparent green
              width: 10, // Width of the bars
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

  Widget _buildTransactionsCard() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10), // Less bottom padding
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
          // List Item
          _buildTransactionItem(),
          // Add more items or a ListView if needed
        ],
      ),
    );
  }

  Widget _buildTransactionItem() {
    // Single transaction row example
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0), // Space below item
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                // Icon background
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: accentGreen.withOpacity(0.2),
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
                    // Small logos/tags for the transaction
                    children: [
                      _buildSmallLogo(
                        'https://via.placeholder.com/20/FF0000/FFFFFF?text=L1',
                      ), // Placeholder logo 1
                      const SizedBox(width: 4),
                      _buildSmallLogo(
                        'https://via.placeholder.com/20/0000FF/FFFFFF?text=L2',
                      ), // Placeholder logo 2
                      const SizedBox(width: 8),
                      Text(
                        '43:32',
                        style: const TextStyle(
                          color: textColorSecondary,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: primaryBgColor, // Darker bg for tag
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'Parlay',
                          style: TextStyle(
                            color: textColorSecondary,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // Amount and Date on the right
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
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

  Widget _buildSmallLogo(String imageUrl) {
    return CircleAvatar(radius: 8, backgroundImage: NetworkImage(imageUrl));
  }
}

class HalfCircleChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 1.4);
    final radius = math.min(size.width / 2 - 20, size.height);
    final startAngle = math.pi * 0.9;
    final sweepAngle = math.pi * 1.2;

    final paint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 35
          ..strokeCap = StrokeCap.butt;

    final sections = [
      {'color': accentGreen, 'value': 0.4},
      {'color': Colors.blue, 'value': 0.15},
      {'color': accentRed, 'value': 0.2},
      {'color': Colors.orange, 'value': 0.25},
    ];

    double currentStartAngle = startAngle;
    for (Map<String, dynamic> section in sections) {
      final sectionSweepAngle = sweepAngle * section['value'];
      paint.color = section['color'] as Color;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        currentStartAngle,
        sectionSweepAngle,
        false,
        paint,
      );
      currentStartAngle += sectionSweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
