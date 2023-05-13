import 'package:flutter/material.dart';

const List<Color> colors = [
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    required this.isDarkMode,
  })  : assert(selectedColor >= 0, 'Selected-color must be grater than 0'),
        assert(selectedColor <= colors.length,
            'Selected-color must be smaller than ${colors.length}');

  ThemeData appTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      appBarTheme: const AppBarTheme(centerTitle: true),
      colorSchemeSeed: colors[selectedColor],
    );
  }
}
