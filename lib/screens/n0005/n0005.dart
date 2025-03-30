import 'package:flutter/material.dart';
import 'package:gaya_screens/screens/n0005/first_column.dart';
import 'package:gaya_screens/screens/n0005/second_column.dart';
import 'package:gaya_screens/screens/n0005/third_column.dart';

const Color primaryBgColor = Color(0xFF1A1A1A);
const Color cardBgColor = Color(0xFF2C2C2E);
const Color accentGreen = Color(0xFFC6FF00);
const Color accentRed = Color(0xFFFF453A);
const Color textColorPrimary = Colors.white;
const Color textColorSecondary = Colors.grey;

class N0005 extends StatelessWidget {
  const N0005({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryBgColor,
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [MyHeader(), SizedBox(height: 10), MainContentGrid()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainContentGrid extends StatelessWidget {
  const MainContentGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FirstColumn(),
          SizedBox(width: 10),
          SecondColumn(),
          SizedBox(width: 10),
          ThirdColumn(),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      color: cardBgColor,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _SidebarLogo(),
          SizedBox(height: 30),
          SidebarIcon(Icons.home_filled, isSelected: true),
          SidebarIcon(Icons.access_time),
          SidebarIcon(Icons.grid_view_rounded),
          SidebarIcon(Icons.chat_bubble_outline),
          SidebarIcon(Icons.bar_chart_rounded),
          SidebarIcon(Icons.calendar_today_outlined),
          SidebarIcon(Icons.bookmark_border),
          Spacer(),
          SidebarIcon(Icons.logout_outlined),
        ],
      ),
    );
  }
}

class _SidebarLogo extends StatelessWidget {
  const _SidebarLogo();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: accentGreen,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Text(
          '\$',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class SidebarIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  const SidebarIcon(this.icon, {super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color:
            isSelected
                ? accentGreen.withValues(alpha: 0.2)
                : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        color: isSelected ? accentGreen : textColorSecondary,
        size: 20,
      ),
    );
  }
}

class MyHeader extends StatelessWidget {
  const MyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Dashboard',
              style: TextStyle(
                color: textColorPrimary,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            _SearchBar(),
            Spacer(),
            MyActionButton(Icons.add, isPrimary: true),
            SizedBox(width: 10),
            MyActionButton(Icons.notifications_none),
            SizedBox(width: 10),
            MyActionButton(Icons.swap_horiz),
            SizedBox(width: 10),
            MyActionButton(Icons.history),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            MyFilterChip('Overview', Icons.star_border, isSelected: true),
            MyFilterChip('Favorites', Icons.favorite_border),
            MyFilterChip('PPC', Icons.flash_on_outlined),
            MyFilterChip('Customize', Icons.settings_outlined),
          ],
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(30),
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
    );
  }
}

class MyFilterChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  const MyFilterChip(
    this.label,
    this.icon, {
    super.key,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
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
}

class MyActionButton extends StatelessWidget {
  final IconData icon;
  final bool isPrimary;
  const MyActionButton(this.icon, {super.key, this.isPrimary = false});

  @override
  Widget build(BuildContext context) {
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
}
