import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class ReminderScheduler {
  void initialize() {
    tz.initializeTimeZones();
  }

  tz.TZDateTime nextDateFromDay(
    int day,
    TimeOfDay time,
    tz.TZDateTime startDate,
  ) {
    var scheduledDate = nextDateFromTime(time, startDate);
    while (scheduledDate.weekday != day) {
      scheduledDate = scheduledDate.add(1.days);
    }
    return scheduledDate;
  }

  tz.TZDateTime nextDateFromTime(TimeOfDay time, tz.TZDateTime startDate) {
    var scheduledDate = tz.TZDateTime(
      tz.local,
      startDate.year,
      startDate.month,
      startDate.day,
      time.hour,
      time.minute,
    );

    if (scheduledDate.isBefore(startDate)) {
      scheduledDate = scheduledDate.add(1.days);
    }

    return scheduledDate;
  }
}
