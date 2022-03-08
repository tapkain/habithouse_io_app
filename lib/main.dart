import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habithouse_io/repository/isar_storage.dart';
import 'package:habithouse_io/repository/storage.dart';
import 'package:habithouse_io/router.dart';
import 'package:habithouse_io/service/service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

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
      await Supabase.initialize(
        anonKey: Config.supabaseKey,
        url: Config.supabaseUrl,
        debug: Config.isDebug,
      );

      final isar = await IsarStorage.initialize();
      final localNotifications = LocalNotificationsService();
      await localNotifications.initialize();

      runApp(ProviderScope(
        overrides: [
          storageProvider.overrideWithValue(IsarStorage(isar)),
          localNotificationsProvider.overrideWithValue(localNotifications),
        ],
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
      builder: (context, child) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: FlexColorScheme.themedSystemNavigationBar(
          context,
          systemNavBarStyle: FlexSystemNavBarStyle.background,
          useDivider: false,
          opacity: 0.60,
        ),
        child: child ?? Container(),
      ),
      debugShowCheckedModeBanner: false,
      darkTheme: FlexThemeData.light(
        scheme: FlexScheme.blueWhale,
        useSubThemes: true,
        blendLevel: 5,
      ).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          border: UnderlineInputBorder(),
        ),
      ),
      theme: FlexThemeData.light(
        scheme: FlexScheme.blueWhale,
        useSubThemes: true,
      ),
      themeMode: ThemeMode.system,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
    ));
  }
}
