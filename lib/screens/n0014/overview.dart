import 'package:flutter/material.dart';
import 'theme.dart';

class P2 extends StatelessWidget {
  const P2({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.themeData;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                          'https://picsum.photos/id/1015/1000/600',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Alex Cole',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.hintColor,
                            ),
                          ),
                          Text(
                            "Today's Habit",
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: theme.cardTheme.color,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: theme.primaryColor,
                        size: 28,
                      ),
                      onPressed: () {
                        /* Add action */
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Calendar Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.cardTheme.color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'March 2025',
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            _ArrowButton(
                              icon: Icons.chevron_left,
                              onPressed: () {},
                            ),
                            const SizedBox(width: 8),
                            _ArrowButton(
                              icon: Icons.chevron_right,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        _DateChip(day: 'Sun', date: '2', isSelected: false),
                        _DateChip(day: 'Mon', date: '3', isSelected: true),
                        _DateChip(day: 'Tue', date: '4', isSelected: false),
                        _DateChip(day: 'Wed', date: '5', isSelected: false),
                        _DateChip(day: 'Thu', date: '6', isSelected: false),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        _TimeOfDayChip(label: 'Morning'),
                        _TimeOfDayChip(label: 'Afternoon'),
                        _TimeOfDayChip(label: 'Evening'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Start New Habits Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Start New Habits',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: TextStyle(color: theme.primaryColor, fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Expanded(
                child: _HabitCard(
                  title: 'Eat & drink\nhealthily',
                  description:
                      'Stay healthy, track\ndaily food and drink\nintake easily.',
                  imagePath: 'assets/habit_drink.png',
                  icon: Icons.restaurant_menu,
                  theme: theme,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Today',
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.bar_chart_outlined),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.settings_outlined),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.person_outline),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Helper Widgets specific to this screen

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _ArrowButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor.withValues(alpha: 
            0.5,
          ), // Slightly darker background
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 20, color: theme.iconTheme.color),
      ),
    );
  }
}

class _DateChip extends StatelessWidget {
  final String day;
  final String date;
  final bool isSelected;

  const _DateChip({
    required this.day,
    required this.date,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.themeData;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: isSelected ? theme.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border(
          top: BorderSide(width: 0.5, color: theme.primaryColor),
          left: BorderSide(width: 0.5, color: theme.primaryColor),
          right: BorderSide(width: 0.5, color: theme.primaryColor),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            day,
            style: theme.textTheme.bodySmall?.copyWith(
              color: isSelected
                  ? theme.scaffoldBackgroundColor
                  : theme.hintColor,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: isSelected
                  ? theme.scaffoldBackgroundColor
                  : theme.iconTheme.color,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimeOfDayChip extends StatelessWidget {
  final String label;

  const _TimeOfDayChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Chip(
      label: Text(label),
      backgroundColor: theme.scaffoldBackgroundColor.withValues(alpha: 0.5),
      labelStyle: TextStyle(color: theme.iconTheme.color, fontSize: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: theme.hintColor.withValues(alpha: 0.2), width: 0.4),
      ),
    );
  }
}

class _HabitCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final IconData icon;
  final ThemeData theme;

  const _HabitCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.icon,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [theme.primaryColor, Colors.transparent],

          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.primaryColor.withValues(alpha: 0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: theme.textTheme.bodyMedium?.copyWith(height: 1.4),
                ),
                const SizedBox(height: 16),
                IconButton.filled(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                  ),
                  icon: Icon(
                    Icons.play_arrow_rounded,
                    color: theme.scaffoldBackgroundColor,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/N0014/women 2.webp',
              alignment: Alignment(1, -0.75),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
