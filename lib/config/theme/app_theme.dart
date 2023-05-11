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

  AppTheme({
    this.selectedColor = 0,
  })  : assert(selectedColor >= 0, 'Selected-color must be grater than 0'),
        assert(selectedColor <= colors.length,
            'Selected-color must be smaller than ${colors.length}');

  ThemeData appTheme() {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: const AppBarTheme(centerTitle: true),
      colorSchemeSeed: colors[selectedColor],
    );
  }
}
