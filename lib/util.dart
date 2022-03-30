import 'dart:math';
import 'package:dartx/dartx.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension BuildContextUtils on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension TextThemeUtils on TextTheme {
  TextStyle? get emoji => headline4;
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

extension DateFormatUtils on DateFormat {
  String formatStartDate(DateTime dateTime) {
    if (dateTime.isToday) {
      return 'Today';
    }

    if (dateTime.isTomorrow) {
      return 'Tomorrow';
    }

    return DateFormat.yMMMMd().format(dateTime);
  }
}
