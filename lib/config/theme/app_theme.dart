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

  AppTheme({this.selectedColor = 0})
    : assert(
        selectedColor >= 0 && selectedColor < colors.length,
        'Seleccione un colo y un numero que existan dentro de las opciones',
      );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colors[selectedColor],
    appBarTheme: AppBarTheme(centerTitle: true),
  );
}
