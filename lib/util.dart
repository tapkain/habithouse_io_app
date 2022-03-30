import 'dart:math';
import 'package:flutter/material.dart';

extension BuildContextUtils on BuildContext {
  ThemeData theme() => Theme.of(this);
  TextTheme textTheme() => Theme.of(this).textTheme;
}

extension TextThemeUtils on TextTheme {
  TextStyle? emoji() => headline4;
}

Color randomColor() =>
    Colors.primaries[Random().nextInt(Colors.primaries.length - 1)];

extension ColorUtils on Color {
  Color get textColor {
    if (ThemeData.estimateBrightnessForColor(this) == Brightness.dark) {
      return Colors.white;
    }
    return Colors.black;
  }
}
