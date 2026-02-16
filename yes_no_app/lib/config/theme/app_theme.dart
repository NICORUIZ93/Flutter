import 'package:flutter/material.dart';

const List<Color> _seedColors = [
  Color.fromARGB(255, 0, 128, 255),
  Color.fromARGB(255, 0, 255, 8),
  Colors.teal,
  Colors.amber,
];

class AppTheme {
  final int selectedColorIndex;

  AppTheme({this.selectedColorIndex = 0})
    : assert(
        selectedColorIndex >= 0 && selectedColorIndex < _seedColors.length,
        'selectedColorIndex must be between 0 and ${_seedColors.length - 1}',
      );

  ThemeData theme() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColors[selectedColorIndex],
      brightness: Brightness.light,
    );

    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,

      // AppBar visual customization
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 1,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
      ),

      // Inputs (including message field) styling
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),

      // Elevated buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),

      // Text theme adjustments
      textTheme: TextTheme(
        titleLarge: TextStyle(fontWeight: FontWeight.w600, color: colorScheme.onSurface),
        bodyMedium: TextStyle(color: colorScheme.onSurface),
        // Avoid deprecated `withOpacity` by using `withAlpha` to set opacity precisely
        bodySmall: TextStyle(color: colorScheme.onSurface.withAlpha((0.6 * 255).round()), fontSize: 12),
      ),

      // Slightly nicer scaffold background by default (keeps apps flexible)
      scaffoldBackgroundColor: colorScheme.surface,
    );
  }
}
