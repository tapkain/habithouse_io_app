export 'local_notifications_service.dart';
export 'reminder_scheduler.dart';

import 'package:habithouse_io/service/local_notifications_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final localNotificationsProvider =
    Provider<LocalNotificationsService>((_) => throw UnimplementedError());
