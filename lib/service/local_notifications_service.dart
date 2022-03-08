import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:habithouse_io/config.dart';

class LocalNotificationsService {
  LocalNotificationsService() : _plugin = FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;

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
}
