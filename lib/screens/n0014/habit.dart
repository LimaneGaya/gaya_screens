import 'package:flutter/material.dart';
import 'theme.dart';

class P3 extends StatelessWidget {
  const P3({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.themeData;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: theme.cardTheme.color,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context), // Go back
                      color: theme.iconTheme.color,
                      iconSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'New Habit',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 48), // To balance the close button
                ],
              ),
              const SizedBox(height: 30),

              // Habit Name
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: theme.cardTheme.color,
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Habit name', style: theme.textTheme.bodyLarge),
                    Container(
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Icon(
                        Icons.edit_outlined,
                        color: theme.scaffoldBackgroundColor,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              Container(
                height: 85,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: theme.cardTheme.color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.emoji_emotions_outlined,
                        color: theme.iconTheme.color,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Icon', style: theme.textTheme.bodyLarge),
                              Icon(
                                Icons.chevron_right,
                                color: theme.iconTheme.color,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Divider(
                            height: 1,
                            color: theme.primaryColor,
                            thickness: 2,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Color', style: theme.textTheme.bodyLarge),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: theme.primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Icon(
                                    Icons.chevron_right,
                                    color: theme.iconTheme.color,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              Text(
                'Repeat',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: theme.cardTheme.color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Do It At', style: theme.textTheme.bodyLarge),
                        Container(
                          decoration: BoxDecoration(
                            color: theme.scaffoldBackgroundColor.withValues(alpha: 
                              0.5,
                            ),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(6),
                          child: Icon(
                            Icons.more_horiz,
                            color: theme.iconTheme.color,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        ('Anytime', Icons.access_time, true),
                        ('Morning', Icons.wb_sunny_outlined, false),
                        ('Afternoon', Icons.brightness_6_outlined, false),
                        ('Evening', Icons.nightlight_round, false),
                      ].map((data) => SizedBox(
                        width: (MediaQuery.of(context).size.width - 72) / 2,
                        child: _TimeChip(
                          label: data.$1,
                          icon: data.$2,
                          isSelected: data.$3,
                          onTap: () {
                            // Handle tap
                          },
                        ),
                      )).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Daily Goal Section
              Text(
                'Daily goal',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: theme.cardTheme.color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Goal', style: theme.textTheme.bodyLarge),
                    Switch(
                      value: false, // Example state
                      onChanged: (value) {},
                      activeColor: theme.primaryColor,
                      activeTrackColor: theme.primaryColor.withValues(alpha: 0.5),
                      inactiveThumbColor: theme.hintColor,
                      inactiveTrackColor: theme.scaffoldBackgroundColor
                          .withValues(alpha: 0.5),
                    ),
                  ],
                ),
              ),

              const Spacer(), // Push button to bottom
              // Save Button
              ElevatedButton(onPressed: () {}, child: const Text('Save')),
              const SizedBox(height: 16), // Padding at the bottom
            ],
          ),
        ),
      ),
    );
  }
}

// Helper Widget for Time Chips
class _TimeChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isSelected;
  final VoidCallback? onTap;

  const _TimeChip({
    required this.label, 
    this.icon, 
    required this.isSelected, 
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.themeData;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected 
              ? theme.primaryColor
              : theme.scaffoldBackgroundColor.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 18,
                color: isSelected
                    ? theme.scaffoldBackgroundColor
                    : theme.iconTheme.color,
              ),
              const SizedBox(width: 6),
            ],
            SizedBox(
              width: 70,
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    color: isSelected
                        ? theme.scaffoldBackgroundColor
                        : theme.iconTheme.color,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
