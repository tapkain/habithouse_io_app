import 'dart:math';
import 'package:dartx/dartx.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habithouse_io/theme.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData flexTheme(Color primary) => theme.brightness == Brightness.dark
      ? darkTheme(primary: primary)
      : lightTheme(primary: primary);
}

extension TextThemeX on TextTheme {
  TextStyle? get emoji => headline4;
}

abstract class ColorUtils {
  static Color randomColor() =>
      Colors.primaries[Random().nextInt(Colors.primaries.length - 1)];
}

// workaround DateTimeRange, cause end cannot be null :(
abstract class DateTimeRangeUtils {
  static final _defaultLastDate = DateTime(3000);

  static DateTimeRange fromStart(DateTime start) => DateTimeRange(
        start: start,
        end: _defaultLastDate,
      );

  static DateTimeRange dateTimeRange(DateTime start, DateTime? end) =>
      end == null ? fromStart(start) : DateTimeRange(start: start, end: end);

  static DateTimeRange now() => fromStart(DateTime.now());
}

extension DateTimeRangeX on DateTimeRange {
  DateTime? get endDate =>
      end.isAtSameMomentAs(DateTimeRangeUtils._defaultLastDate) ? null : end;
}

extension ColorX on Color {
  Color get textColor {
    if (ThemeData.estimateBrightnessForColor(this) == Brightness.dark) {
      return Colors.white;
    }
    return Colors.black;
  }
}

extension DateFormatX on DateFormat {
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
