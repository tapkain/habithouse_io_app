import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as fln;

abstract class Config {
  static const String supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const String supabaseKey = String.fromEnvironment('SUPABASE_KEY');
  static const bool isDebug = kDebugMode;
  static const loggingLevel = Level.FINE;
  static const localDbName = 'isar';
  static const transientDb = false;
  static const sentryDsn = String.fromEnvironment('SENTRY_DSN');

  static const localNotificationSettings = fln.InitializationSettings(
    android: fln.AndroidInitializationSettings('app_icon'),
    iOS: fln.IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    ),
    macOS: fln.MacOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    ),
  );
}
