import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habithouse_io/service/service.dart';
import 'package:timezone/timezone.dart' as tz;

void main() {
  group('Reminder Scheduler', () {
    final reminderScheduler = ReminderScheduler();
    reminderScheduler.initialize();

    test('Scheduling before start date', () {
      final date = tz.TZDateTime(tz.local, 2020, 12, 3, 11, 30);
      const time = TimeOfDay(hour: 9, minute: 30);

      final out = reminderScheduler.nextDateFromTime(time, date);

      expect(
        out,
        equals(date.add(1.days).copyWith(
              hour: time.hour,
              minute: time.minute,
            )),
      );
    });

    test('Scheduling after start date', () {
      final date = tz.TZDateTime(tz.local, 2020, 12, 3, 11, 30);
      const time = TimeOfDay(hour: 15, minute: 30);

      final out = reminderScheduler.nextDateFromTime(time, date);

      expect(
        out,
        equals(date.copyWith(
          hour: time.hour,
          minute: time.minute,
        )),
      );
    });

    test('Scheduling next monday', () {
      // thursday
      final date = tz.TZDateTime(tz.local, 2020, 12, 3, 11, 30);
      const time = TimeOfDay(hour: 9, minute: 30);

      final out = reminderScheduler.nextDateFromDay(
        DateTime.monday,
        time,
        date,
      );

      expect(
        out,
        equals(date.add(4.days).copyWith(
              hour: time.hour,
              minute: time.minute,
            )),
      );
    });
  });
}
