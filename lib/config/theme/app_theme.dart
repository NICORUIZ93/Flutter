import 'package:flutter/material.dart';

final List<Color> colors = [
  Colors.black,
  Colors.white,
  Colors.amber,
  Colors.blue,
  Colors.cyan,
  Colors.deepOrange,
  Colors.lightGreen,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
    : assert(
        selectedColor >= 0 && selectedColor < colors.length,
        'Selecciona un color valido',
      );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colors[selectedColor],
    appBarTheme: const AppBarTheme(centerTitle: true),
  );
}
