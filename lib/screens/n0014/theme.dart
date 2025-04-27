// app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static final Color _darkBackgroundColor = const Color(0xFF1A1C18);
  static final Color _primaryColor = const Color(0xFFBDEE63);
  static final Color _secondaryTextColor = Colors.white.withValues(alpha: 0.7);
  static final Color _cardBackgroundColor = Color(0xFFBDEE63).withValues(alpha: 0.08);
  static final Color _iconColor = Colors.white;

  static ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _darkBackgroundColor,
      primaryColor: _primaryColor,
      hintColor: _secondaryTextColor,
      fontFamily: 'YourAppFont', // Replace if you have a specific font

      appBarTheme: AppBarTheme(
        backgroundColor: _darkBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: _iconColor),
        titleTextStyle: TextStyle(
          color: _iconColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),

      textTheme: TextTheme(
        displayLarge: TextStyle(color: _primaryColor, fontSize: 28, fontWeight: FontWeight.bold), // "Your Path to Success..." Title
        headlineMedium: TextStyle(color: _iconColor, fontSize: 22, fontWeight: FontWeight.bold), // Screen Titles like "Today's Habit", "New Habit"
        titleLarge: TextStyle(color: _iconColor, fontSize: 18, fontWeight: FontWeight.w500), // Card Titles, Section Headers
        bodyLarge: TextStyle(color: _iconColor, fontSize: 16), // Regular text
        bodyMedium: TextStyle(color: _secondaryTextColor, fontSize: 14), // Subtitles, descriptions
        labelLarge: TextStyle(color: _darkBackgroundColor, fontSize: 16, fontWeight: FontWeight.w500), // Button text
      ),

      iconTheme: IconThemeData(
        color: _iconColor,
        size: 24,
      ),

      cardTheme: CardThemeData(
        color: _cardBackgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          foregroundColor: _darkBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'YourAppFont', // Use the same font
          ),
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: _cardBackgroundColor,
        disabledColor: _cardBackgroundColor,
        selectedColor: _primaryColor,
        secondarySelectedColor: _primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        labelStyle: TextStyle(color: _iconColor, fontSize: 12),
        secondaryLabelStyle: TextStyle(color: _darkBackgroundColor, fontSize: 12, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        brightness: Brightness.dark,
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: _darkBackgroundColor,
        selectedItemColor: _primaryColor,
        unselectedItemColor: _secondaryTextColor,
        selectedIconTheme: IconThemeData(color: _primaryColor),
        elevation: 0,
      ),

       listTileTheme: ListTileThemeData(
         iconColor: _iconColor,
         textColor: _iconColor,
         tileColor: _cardBackgroundColor,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(16),
         ),
         contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
       ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _cardBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        hintStyle: TextStyle(color: _secondaryTextColor),
        prefixIconColor: _secondaryTextColor,
        suffixIconColor: _primaryColor,
      ),

      dividerTheme: DividerThemeData(
        color: Colors.white.withValues(alpha: 0.1),
        thickness: 1,
      ),
    );
  }
}