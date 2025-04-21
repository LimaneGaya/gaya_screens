import 'package:flutter/material.dart';

const Map<String, Map<String, String>> _localizedStringsScreen2 = {
  'en': {
    'greeting': 'Hi, Alice!',
    'myBalance': 'My Balance',
    'statistics': 'Statistics',
    'income': 'Income',
    'outcome': 'Outcome',
    'activities': 'Activities',
    'recentTransfers': 'Recent Transfers',
    'cardHolder': 'Ziad Emad',
  },
  'fr': {
    'greeting': 'Salut, Alice !',
    'myBalance': 'Mon Solde',
    'statistics': 'Statistiques',
    'income': 'Revenu',
    'outcome': 'Dépense',
    'activities': 'Activités',
    'recentTransfers': 'Transferts Récents',
    'cardHolder': 'Ziad Emad',
  },
  'ar': {
    'greeting': 'مرحباً، أليس!',
    'myBalance': 'رصيدي',
    'statistics': 'إحصائيات',
    'income': 'الدخل',
    'outcome': 'المصروف',
    'activities': 'الأنشطة',
    'recentTransfers': 'التحويلات الأخيرة',
    'cardHolder': 'زياد عماد',
  },
};

class P2 extends StatelessWidget {
  final String currentLanguage = 'en'; // 'en', 'fr', 'ar'

  const P2({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = _localizedStringsScreen2[currentLanguage]!;
    final textDirection = currentLanguage == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr;

    final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.deepPurpleAccent,
      scaffoldBackgroundColor: const Color(0xFF1C1C1E),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleMedium: TextStyle(fontSize: 14, color: Colors.white70),
        bodyLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
        bodySmall: TextStyle(fontSize: 12, color: Colors.white70),
        labelLarge: TextStyle(fontSize: 16, color: Colors.white),
        labelMedium: TextStyle(fontSize: 12, color: Colors.white70),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      fontFamily: 'Roboto',
    );

    return Theme(
      data: darkTheme,
      child: Directionality(
        textDirection: textDirection,
        child: Scaffold(
            body: SafeArea(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  children: [
                    _buildTopBar(context, strings['greeting']!, darkTheme),
                    const SizedBox(height: 15),
            
                    _buildBalanceSection(context, strings, darkTheme),
                    const SizedBox(height: 15),
            
                    _buildIncomeOutcomeSection(context, strings, darkTheme),
                    const SizedBox(height: 15),
            
                    _buildMainCard(context, strings['cardHolder']!, darkTheme),
                    const SizedBox(height: 15),
            
                    _buildActivitiesSection(context, strings, darkTheme),
                    const SizedBox(height: 15),
            
                    _buildBottomNavBar(context, darkTheme),
                  ],
                ),
              ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context, String greeting, ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage('https://picsum.photos/100'),
              backgroundColor: Colors.grey,
            ),
            const SizedBox(width: 15),
            Text(greeting, style: theme.textTheme.titleLarge),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade800.withValues(alpha: 0.5),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.notifications_none,
            color: Colors.purpleAccent,
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildBalanceSection(
    BuildContext context,
    Map<String, String> strings,
    ThemeData theme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(strings['myBalance']!, style: theme.textTheme.titleMedium),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.shade800.withValues(alpha: 0.5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                strings['statistics']!,
                style: theme.textTheme.labelLarge?.copyWith(fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(r'$7,658.50', style: theme.textTheme.bodyLarge),
            Row(
              children: [
                Text(
                  'USD',
                  style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white70,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIncomeOutcomeSection(
    BuildContext context,
    Map<String, String> strings,
    ThemeData theme,
  ) {
    numberFormat(num value) => value.toStringAsFixed(1).replaceAll('.', ',');

    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context: context,
            label: strings['income']!,
            amount: numberFormat(8680.2),
            icon: Icons.arrow_downward,
            iconColor: Colors.greenAccent,
            theme: theme,
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: _buildStatCard(
            context: context,
            label: strings['outcome']!,
            amount: numberFormat(4689.2),
            icon: Icons.arrow_upward,
            iconColor: Colors.redAccent,
            theme: theme,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required BuildContext context,
    required String label,
    required String amount,
    required IconData icon,
    required Color iconColor,
    required ThemeData theme,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade800.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(label, style: theme.textTheme.labelMedium),
                const SizedBox(height: 4),
                Text(
                  amount,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainCard(
    BuildContext context,
    String cardHolderName,
    ThemeData theme,
  ) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: [Color(0xFFFFAA7F), Color(0xFFE47FFF), Color(0xFF8C7FFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withValues(alpha: 0.5),
            blurRadius: 30,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RotatedBox(
                quarterTurns: 1,
                child: const Icon(
                  Icons.wifi,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              Text(
                'VISA',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Text(
            '667 234 512 741',
            style: theme.textTheme.titleLarge?.copyWith(
              letterSpacing: 3,
              fontFamily: 'monospace',
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardHolderName,
                style: theme.textTheme.bodySmall?.copyWith(fontSize: 14),
              ),
              const SizedBox(width: 20),
              Text(
                '16/26',
                style: theme.textTheme.bodySmall?.copyWith(fontSize: 14),
              ),
              Spacer(),
              SizedBox(
                width: 50,
                height: 30,
                child: Stack(
                  fit: StackFit.passthrough,
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment(-0.5, 0),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white.withValues(
                          alpha: 0.2,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.5, 0),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.lightBlue.shade100
                            .withValues(alpha: 0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivitiesSection(
    BuildContext context,
    Map<String, String> strings,
    ThemeData theme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          strings['activities']!,
          style: theme.textTheme.labelLarge?.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade800.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.grey.shade700.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    strings['recentTransfers']!,
                    style: theme.textTheme.labelLarge?.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 36,
                    width: 120,
                    child: Stack(
                      children: List.generate(
                        4,
                        (index) => Positioned(
                          left: index * 25.0,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundImage: NetworkImage(
                              'https://picsum.photos/50?random=${index + 1}',
                            ),
                            backgroundColor: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavBar(BuildContext context, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, isSelected: true, theme: theme),
          _buildNavItem(
            Icons.bar_chart_outlined,
            isSelected: false,
            theme: theme,
          ),
          _buildNavItem(
            Icons.credit_card_outlined,
            isSelected: false,
            theme: theme,
          ),
          _buildNavItem(Icons.person_outline, isSelected: false, theme: theme),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon, {
    required bool isSelected,
    required ThemeData theme,
  }) {
    return IconButton(
      icon: Icon(
        icon,
        color: isSelected ? theme.primaryColor : Colors.grey.shade500,
        size: 28,
      ),
      onPressed: () {},
    );
  }
}
