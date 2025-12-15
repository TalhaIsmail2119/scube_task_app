import 'package:flutter/material.dart';
import 'app_theme.dart';

class AppThemeConfig {
  AppThemeConfig._();

  // ===== Light Theme =====
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppTheme.primaryColor,
    scaffoldBackgroundColor: AppTheme.scaffoldBackground,

    // ===== AppBar =====
    appBarTheme: const AppBarTheme(
      backgroundColor: AppTheme.primaryColor,
      foregroundColor: AppTheme.textOnPrimary,
      elevation: 0,
      centerTitle: true,
    ),

    // ===== ElevatedButton =====
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: AppTheme.textPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppTheme.borderRadius),
          ),
        ),
      ),
    ),

    // ===== TextButton =====
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppTheme.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    ),

    // ===== OutlinedButton =====
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppTheme.primaryColor,
        side: BorderSide(color: AppTheme.primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.borderRadius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    ),

    // ===== InputDecoration (TextField) =====
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppTheme.surfaceBackground,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppTheme.borderRadius),
        borderSide: BorderSide(color: AppTheme.sectionBackground),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppTheme.borderRadius),
        borderSide: BorderSide(color: AppTheme.primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppTheme.borderRadius),
        borderSide: BorderSide(color: AppTheme.errorColor),
      ),
    ),

    // ===== SnackBar =====
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppTheme.primaryColor,
      contentTextStyle: const TextStyle(color: AppTheme.textOnPrimary),
      behavior: SnackBarBehavior.floating,
    ),

    // ===== FloatingActionButton =====
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppTheme.primaryColor,
      foregroundColor: AppTheme.textOnPrimary,
    ),
    cardTheme: CardThemeData(
      color: AppTheme.cardBackground,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.borderRadius),
      ),
    ),

    // ===== ColorScheme (used internally) =====
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppTheme.primaryColor,
      background: AppTheme.scaffoldBackground,
      surface: AppTheme.surfaceBackground,
      brightness: Brightness.light,
    ),

    // ===== TextTheme (optional) =====
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppTheme.textPrimary),
      bodyMedium: TextStyle(color: AppTheme.textSecondary),
    ),
  );

  // ===================== Dark Theme  =============================
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppTheme.primaryColor,
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppTheme.primaryColor,
      foregroundColor: AppTheme.textOnPrimary,
      elevation: 0,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: AppTheme.textOnPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppTheme.borderRadius),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppTheme.primaryColor),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppTheme.primaryColor,
        side: BorderSide(color: AppTheme.primaryColor),
      ),
    ),
    // cardTheme: CardTheme(
    //   color: const Color(0xFF1E1E1E),
    //   elevation: 4,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(AppTheme.borderRadius),
    //   ),
    // ),
    cardTheme: CardThemeData(
      color: AppTheme.cardBackground,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.borderRadius),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF1E1E1E),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppTheme.borderRadius),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppTheme.borderRadius),
        borderSide: BorderSide(color: AppTheme.primaryColor, width: 2),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppTheme.primaryColor,
      contentTextStyle: const TextStyle(color: AppTheme.textOnPrimary),
      behavior: SnackBarBehavior.floating,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppTheme.primaryColor,
      foregroundColor: AppTheme.textOnPrimary,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppTheme.primaryColor,
      background: const Color(0xFF121212),
      surface: const Color(0xFF1E1E1E),
      brightness: Brightness.dark,
    ),
  );
}
