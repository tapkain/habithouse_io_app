import 'package:dartx/dartx.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/const.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:habithouse_io/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  String appBarTitleText(DateTime viewDate) {
    if (viewDate.isToday) {
      return 'Today';
    }

    if (viewDate.isTomorrow) {
      return 'Tomorrow';
    }

    return DateFormat()
        .addPattern(DateFormat.ABBR_WEEKDAY + ',')
        .addPattern(DateFormat.ABBR_MONTH)
        .addPattern(DateFormat.DAY)
        .format(viewDate);
  }

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
        ),
        body: const HabitListView(),
      ),
    );
  }

  List<Widget> headerSliverBuilder(
    BuildContext context,
    bool innerBoxIsScrolled,
    DateTime viewDate,
  ) =>
      [
        SliverAppBar(
          title: Text(appBarTitleText(viewDate)),
          stretch: true,
          actions: [
            if (kDebugMode)
              IconButton(
                onPressed: () => context.go('/habits/dbviewer'),
                icon: const Icon(Icons.perm_data_setting_outlined),
              )
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
