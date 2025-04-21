import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:gaya_screens/screens/screen_shot.dart';

// --- Localization Helper ---

class AppLocalizations {
  final String languageCode;

  AppLocalizations(this.languageCode);

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'usd_wallet': 'USD wallet',
      'available_balance': 'AVAILABLE BALANCE',
      'send': 'Send',
      'receive': 'Receive',
      'buy': 'Buy',
      'my_assets': 'MY ASSETS',
      'litecoin': 'Litecoin',
      'transactions': 'TRANSACTIONS',
      'dogecoin': 'Dogecoin',
      'received': 'Received',
      'solana': 'Solana',
      'sent': 'Sent', // Assuming the second transaction was 'Sent'
      'main_wallet': 'Main Wallet',
      'israel': 'Algeria', // Added for completeness based on image
    },
    'ar': {
      'usd_wallet': 'محفظة دولار أمريكي',
      'available_balance': 'الرصيد المتاح',
      'send': 'إرسال',
      'receive': 'استلام',
      'buy': 'شراء',
      'my_assets': 'أصولي',
      'litecoin': 'لايتكوين',
      'transactions': 'المعاملات',
      'dogecoin': 'دوجكوين',
      'received': 'مستلم',
      'solana': 'سولانا',
      'sent': 'مرسل', // Assuming the second transaction was 'Sent'
      'main_wallet': 'المحفظة الرئيسية',
      'israel': 'الجزائر', // Changed to Algeria in Arabic
    },
  };

  String getString(String key) {
    return _localizedValues[languageCode]?[key] ??
        _localizedValues['en']?[key] ?? // Fallback to English
        key; // Fallback to key itself if not found
  }

  TextDirection get textDirection =>
      languageCode == 'ar' ? TextDirection.rtl : TextDirection.ltr;
}

// --- Main Screen Widget ---

class N0011 extends StatelessWidget {
  // Simulate passing language preference
  final String languageCode; // 'en' or 'ar'

  const N0011({super.key, this.languageCode = 'en'});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations(languageCode);
    final TextDirection currentTextDirection = l10n.textDirection;

    // --- Theming ---
    final darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF1A1A1A), // Dark background
      primaryColor: Colors.blueAccent, // Accent color
      fontFamily: 'Roboto', // Example font
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
        bodyMedium: TextStyle(
          color: Color(0xFFB0B0B0),
          fontSize: 14,
        ), // Lighter grey
        titleMedium: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(color: Color(0xFFB0B0B0), fontSize: 12),
        headlineSmall: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: const IconThemeData(color: Color(0xFFB0B0B0)),
      dividerColor: Colors.grey[800],
      cardColor: const Color(0xFF2C2C2E), // Slightly lighter card background
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: const Color(0xFF1A1A1A),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xFFB0B0B0),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed, // Ensure all items are visible
        selectedIconTheme: const IconThemeData(size: 28),
        unselectedIconTheme: const IconThemeData(size: 24),
      ),
    );

    return Theme(
      data: darkTheme,
      child: Directionality(
        textDirection: currentTextDirection,
        child: ScreenShot(
          languageCode: languageCode,
          widgetName: 'N0011',
          colorBG: darkTheme.scaffoldBackgroundColor,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: darkTheme.scaffoldBackgroundColor,
              elevation: 0,
              title: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: darkTheme.cardColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.amber[700], // Bitcoin color
                      child: Icon(
                        Icons.currency_bitcoin,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "72FS...W5CL",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              toolbarHeight: 65, // Adjust height if needed
              actions: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.red,
                      child: Text(
                        "I",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.getString('israel'),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Icon(Icons.keyboard_arrow_down, size: 20),
                  ],
                ),
              ],
            ),
            body: Stack(
              fit: StackFit.passthrough,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        _buildWalletSelector(context, l10n),
                        const SizedBox(height: 25),
                        _buildBalance(context, l10n),
                        const SizedBox(height: 30),
                        _buildActionButtons(context, l10n),
                        const SizedBox(height: 35),
                        _buildAssetsSection(context, l10n),
                        const SizedBox(height: 30),
                        _buildTransactionsSection(context, l10n),
                        const SizedBox(
                          height: 20,
                        ), // Space before bottom nav bar
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildBottomNavBar(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWalletSelector(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("🇺🇸", style: TextStyle(fontSize: 13)),

            const SizedBox(width: 8),
            Text(
              l10n.getString('usd_wallet'),
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, size: 18),
          ],
        ),
      ),
    );
  }

  Widget _buildBalance(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        children: [
          Text(
            l10n.getString('available_balance'),
            style: theme.textTheme.titleSmall?.copyWith(letterSpacing: 0.5),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "\$481,296.89", // Hardcoded balance
                style: theme.textTheme.headlineLarge,
              ),
              const SizedBox(width: 8),
              // Eye Icon (Placeholder - using visibility icon)
              Icon(
                Icons.visibility_off_outlined, // Or Icons.visibility_outlined
                color: theme.iconTheme.color,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionButton(
          context,
          Icons.north_east,
          l10n.getString('send'),
        ), // Send Icon
        _buildActionButton(
          context,
          Icons.south_west,
          l10n.getString('receive'),
        ), // Receive Icon
        _buildActionButton(
          context,
          Icons.add,
          l10n.getString('buy'),
        ), // Buy Icon
      ],
    );
  }

  Widget _buildActionButton(BuildContext context, IconData icon, String label) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 28, color: Colors.white),
                const SizedBox(height: 8),
                Text(label, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAssetsSection(BuildContext context, AppLocalizations l10n) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16).copyWith(bottom: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [Colors.blue.shade600, Colors.grey.shade500],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.getString('my_assets'),
                style: theme.textTheme.titleMedium,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.add, size: 18, color: Colors.black),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha:
                        0.5,
                      ), // Darker background for dots
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.more_horiz,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 18),
          // Stacked Asset Cards
          SizedBox(
            height: 110, // Adjust height to fit cards comfortably
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // Card 1 (Topmost, partially visible) - Filecoin 'f'
                Positioned(
                  top: 0,
                  left: 20,
                  right: 20,

                  child: _buildAssetCard(
                    context: context,
                    iconPlaceholder: 'f', // Placeholder for Filecoin icon
                    amount: "1,623,182.90",
                    gradientColors: [
                      Colors.blue.shade300,
                      Colors.blue.shade600,
                    ],

                    opacity: 0.8, // Slightly transparent
                  ),
                ),
                // Card 2 (Middle) - 'V' Icon
                Positioned(
                  top: 35, // Offset from top card
                  left: 10,
                  right: 10,
                  child: _buildAssetCard(
                    context: context,
                    iconPlaceholder: 'V', // Placeholder for 'V' icon
                    amount: "00.4251745",
                    gradientColors: [
                      Colors.lightBlue.shade200,
                      Colors.lightBlue.shade500,
                    ],
                    opacity: 0.85, // Slightly transparent
                  ),
                ),
                // Card 3 (Bottom, fully visible) - Litecoin
                Positioned(
                  top: 70, // Offset from middle card
                  left: 0,
                  right: 0,
                  child: _buildAssetCard(
                    context: context,
                    iconPlaceholder: 'Ł', // Placeholder for Litecoin icon
                    name: l10n.getString('litecoin'),
                    amount: "2,317.05",
                    gradientColors: [
                      Colors.grey.shade300,
                      Colors.grey.shade500,
                    ], // Litecoin-like grey
                    opacity: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssetCard({
    required BuildContext context,
    required String iconPlaceholder,
    String? name,
    required String amount,
    required List<Color> gradientColors,
    double opacity = 1.0,
  }) {
    final theme = Theme.of(context);
    final double cardHeight = 60;

    return Opacity(
      opacity: opacity,
      child: Container(
        alignment: Alignment.topCenter,
        height: cardHeight,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha:0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white.withValues(alpha:0.3),
              child: Text(
                iconPlaceholder,
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                ),
              ),
            ),
            if (name != null) ...[
              const SizedBox(width: 12),
              Text(
                name,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
            Spacer(),
            Text(
              amount,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionsSection(
    BuildContext context,
    AppLocalizations l10n,
  ) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.getString('transactions'),
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: 15),
        _buildTransactionItem(
          context: context,
          iconColor: Colors.orangeAccent, // Dogecoin color
          iconChar: 'Ð', // Dogecoin symbol approximation
          coinName: l10n.getString('dogecoin'),
          status: l10n.getString('received'),
          amount: "625.118",
          tag: "ALQO",
          address: "W512...AS1Q",
        ),
        const SizedBox(height: 15),
        _buildTransactionItem(
          context: context,
          iconColor: Colors.purpleAccent, // Solana color
          iconChar: 'S', // Solana placeholder
          coinName: l10n.getString('solana'),
          status: l10n.getString('sent'), // Assuming sent
          amount: "314.890",
          tag: "ALQO",
          address: l10n.getString('main_wallet'),
        ),
      ],
    );
  }

  Widget _buildTransactionItem({
    required BuildContext context,
    required Color iconColor,
    required String iconChar,
    required String coinName,
    required String status,
    required String amount,
    required String tag,
    required String address,
  }) {
    final theme = Theme.of(context);
    final bool isReceived =
        status == AppLocalizations('en').getString('received') ||
        status ==
            AppLocalizations(
              'ar',
            ).getString('received'); // Check based on english key

    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: iconColor.withValues(alpha:0.2),
          child: Text(
            iconChar,
            style: TextStyle(
              color: iconColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coinName,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                status,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isReceived ? Colors.greenAccent : Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Text(
                  amount,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                Text(tag, style: theme.textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: 2),
            Text(address, style: theme.textTheme.titleSmall),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2E).withValues(alpha:0.5),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildNavItem(Icons.bar_chart_outlined, Icons.bar_chart, true),
                SizedBox(width: 10),
                _buildNavItem(
                  Icons.account_balance_wallet_outlined,
                  Icons.account_balance_wallet,
                  false,
                ),
                SizedBox(width: 10),
                _buildNavItem(
                  Icons.swap_horiz_outlined,
                  Icons.swap_horiz,
                  false,
                ),
                SizedBox(width: 10),
                _buildNavItem(Icons.person_outline, Icons.person, false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData inactiveIcon,
    IconData activeIcon,
    bool isActive,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isActive ? Colors.grey.withValues(alpha:0.2) : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(
        isActive ? activeIcon : inactiveIcon,
        color: isActive ? Colors.white : const Color(0xFFB0B0B0),
        size: 20,
      ),
    );
  }
}
