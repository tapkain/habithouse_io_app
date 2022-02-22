import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

abstract class Config {
  static const String supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const String supabaseKey = String.fromEnvironment('SUPABASE_KEY');
  static const bool isDebug = kDebugMode;
  static const loggingLevel = Level.FINE;
  static const localDbName = 'isar';
  static const transientDb = false;
  static const sentryDsn = String.fromEnvironment('SENTRY_DSN');
}
