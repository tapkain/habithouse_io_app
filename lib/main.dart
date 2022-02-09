import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:habithouse_io/models/habit_entry.dart';
import 'package:habithouse_io/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:logging/logging.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:path_provider/path_provider.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'config.dart';

class HabithouseProviderObserver extends ProviderObserver {
  final log = Logger('ProviderObserver');

  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    log.finest('Add: ${provider.name ?? provider.runtimeType.toString()}');
    log.finest(value);
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer containers) {
    log.finest('Dispose: ${provider.name ?? provider.runtimeType.toString()}');
    super.didDisposeProvider(provider, containers);
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log.finest('Update: ${provider.name ?? provider.runtimeType.toString()}');
    log.finest('$previousValue -> $newValue');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.root.level = Config.loggingLevel;
  Logger.root.onRecord.listen((rec) {
    print(
      '[${rec.time} | ${rec.loggerName} | ${rec.level.name}] ${rec.message}',
    );
  });

  final sentryClient = SentryClient(SentryOptions(dsn: Config.sentryDsn));

  Catcher(
    debugConfig: CatcherOptions.getDefaultDebugOptions(),
    releaseConfig: CatcherOptions(
      DialogReportMode(),
      [SentryHandler(sentryClient)],
    ),
    enableLogger: false,
    runAppFunction: () async {
      final dir = await getApplicationSupportDirectory();
      await Isar.open(
        schemas: [HabitSchema, HabitEntrySchema],
        directory: dir.path,
        name: Config.localDbName,
        inspector: Config.isDebug,
      );

      await Supabase.initialize(
        anonKey: Config.supabaseKey,
        url: Config.supabaseUrl,
        debug: Config.isDebug,
      );

      runApp(ProviderScope(
        observers: [HabithouseProviderObserver()],
        child: const HabithouseIO(),
      ));
    },
  );
}

class HabithouseIO extends HookConsumerWidget {
  const HabithouseIO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return OverlaySupport.global(
        child: MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
    ));
  }
}
