import 'dart:io';

import 'package:dartx/dartx.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:habithouse_io/config.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/service/deep_link_delegate.dart';
import 'package:habithouse_io/service/reminder_scheduler.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationsService implements DeepLinkDelegate {
  LocalNotificationsService(this.scheduler)
      : _plugin = FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;
  final ReminderScheduler scheduler;

  Future<void> initialize() async {
    await _plugin.initialize(
      Config.localNotificationSettings,
      onSelectNotification: _onSelectNotification,
    );
  }

  Future<bool> requestPermission() async {
    if (Platform.isIOS) {
      return await _plugin
              .resolvePlatformSpecificImplementation<
                  IOSFlutterLocalNotificationsPlugin>()!
              .requestPermissions(
                alert: true,
                badge: true,
                sound: true,
              ) ??
          false;
    }

    if (Platform.isMacOS) {
      return await _plugin
              .resolvePlatformSpecificImplementation<
                  MacOSFlutterLocalNotificationsPlugin>()!
              .requestPermissions(
                alert: true,
                badge: true,
                sound: true,
              ) ??
          false;
    }

    return false;
  }

  void _onSelectNotification(String? payload) {
    print('PAYLOAD RECEIVED');
  }

  Future<void> scheduleNotification(
    CreateHabit form,
    tz.TZDateTime scheduledDate,
  ) =>
      // TODO: implement scheduleNotification further
      _plugin.zonedSchedule(
        0,
        'title',
        'body',
        scheduledDate,
        const NotificationDetails(),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: false,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );

  Future<void> scheduleNotifications(CreateHabit form) {
    final scheduledDates = scheduledDatesFor(form);
    return Future.wait(scheduledDates
        .map((scheduledDate) => scheduleNotification(form, scheduledDate)));
  }

  Iterable<tz.TZDateTime> scheduledDatesFor(CreateHabit form) => form.repeatDays
      .map((day) => form.reminders.map((reminder) => scheduler.nextDateFromDay(
            day,
            reminder,
            tz.TZDateTime.from(form.startDate, tz.local),
          )))
      .flatten();

  @override
  Future<DeepLinkPayload?> fetchDeepLink() async {
    final dt = await _plugin.getNotificationAppLaunchDetails();
    if (dt == null) {
      return null;
    }

    if (!dt.didNotificationLaunchApp || dt.payload == null) {
      return null;
    }

    // TODO: parse payload
    return DeepLinkPayload(launchUrl: dt.payload!);
  }
}
