import 'package:dartx/dartx.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/const.dart';
import 'package:habithouse_io/repository/repository.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:habithouse_io/theme.dart';
import 'package:habithouse_io/util.dart';
import 'package:habithouse_io/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  void onFloatingButtonPressed(BuildContext context) {
    HapticFeedback.lightImpact();
    context.go('/habits/create');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewDate = ref.watch(viewDateProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => onFloatingButtonPressed(context),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) =>
            headerSliverBuilder(
          context,
          innerBoxIsScrolled,
          viewDate,
          ref,
        ),
        body: const HabitListView(),
      ),
    );
  }

  List<Widget> headerSliverBuilder(
    BuildContext context,
    bool innerBoxIsScrolled,
    DateTime viewDate,
    WidgetRef ref,
  ) =>
      [
        SliverAppBar(
          title: Text(viewDate.formatTitleDate),
          stretch: true,
          actions: [
            if (kDebugMode)
              IconButton(
                onPressed: () => context.go('/habits/dbviewer'),
                icon: const Icon(Icons.perm_data_setting_outlined),
              ),
            if (kDebugMode)
              PopupMenuButton<ThemeMode>(
                icon: const Icon(Icons.design_services_outlined),
                onSelected: (ThemeMode mode) =>
                    ref.read(sharedPrefsProvider).setThemeMode(mode),
                itemBuilder: (_) => [
                  const PopupMenuItem<ThemeMode>(
                    value: ThemeMode.system,
                    child: Text('System'),
                  ),
                  const PopupMenuItem<ThemeMode>(
                    value: ThemeMode.dark,
                    child: Text('Dark mode'),
                  ),
                  const PopupMenuItem<ThemeMode>(
                    value: ThemeMode.light,
                    child: Text('Light mode'),
                  ),
                ],
              ),
          ],
        ),
        const SliverToBoxAdapter(child: SizedBox(height: padding)),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: padding * 6,
            child: DateListView(),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: padding)),
      ];
}
