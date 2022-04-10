import 'dart:math';
import 'package:dartx/dartx.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habithouse_io/theme.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ThemeData flexTheme(Color primary) =>
      themeFor(theme.brightness, primary: primary);
}

extension TextThemeX on TextTheme {
  TextStyle? get emoji => headline4;
  TextStyle? get bigEmoji => headline1;
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

extension DateTimeX on DateTime {
  String get formatStartDate {
    if (isToday) {
      return 'Today';
    }

    if (isTomorrow) {
      return 'Tomorrow';
    }

    return DateFormat.yMMMMd().format(this);
  }

  String get formatTitleDate {
    if (isToday) {
      return 'Today';
    }

    if (isTomorrow) {
      return 'Tomorrow';
    }

    return DateFormat()
        .addPattern(DateFormat.ABBR_WEEKDAY + ',')
        .addPattern(DateFormat.ABBR_MONTH)
        .addPattern(DateFormat.DAY)
        .format(this);
  }

  String get formatDay => DateFormat('EEE').format(this);
}

abstract class DateFormatUtils {
  static const everyDay = [
    DateTime.monday,
    DateTime.tuesday,
    DateTime.wednesday,
    DateTime.thursday,
    DateTime.friday,
    DateTime.saturday,
    DateTime.sunday,
  ];

  static String formatDay(int day, [String pattern = 'EEEE']) {
    var date = DateTime(2020, 1, 1);
    while (date.weekday != day) {
      date = date.add(1.days);
    }
    return DateFormat(pattern).format(date);
  }

  static String formatWeekday(Iterable<int> days) {
    if (days.isEmpty) {
      return 'Any Day';
    }

    if (days.reduce((v, e) => v + e) == everyDay.reduce((v, e) => v + e)) {
      return 'Every Day';
    }

    if (!days.contains(DateTime.sunday) &&
        !days.contains(DateTime.saturday) &&
        days.length == 5) {
      return 'Weekdays';
    }

    if (days.contains(DateTime.saturday) &&
        days.contains(DateTime.sunday) &&
        days.length == 2) {
      return 'Weekends';
    }

    return days
        .sorted()
        .map((e) => DateFormatUtils.formatDay(e, 'EEE'))
        .join(',');
  }
}

// arbitrary negative number, used to make id in models non-nullable by setting this as default
const autoIncrementId = -1;

abstract class DateTimeUtils {
  static DateTime? fromJsonN(dynamic json) =>
      json != null ? DateTime.fromMillisecondsSinceEpoch((json as int)) : null;

  static dynamic toJsonN(DateTime? dateTime) =>
      dateTime?.millisecondsSinceEpoch;

  static DateTime fromJson(dynamic json) => fromJsonN(json)!;
  static dynamic toJson(DateTime dateTime) => toJsonN(dateTime);
}
