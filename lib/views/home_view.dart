import 'package:dartx/dartx.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/const.dart';
import 'package:habithouse_io/models/habit.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:habithouse_io/util.dart';
import 'package:habithouse_io/widgets/date_list_view.dart';
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewDate = ref.watch(viewDateProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.go('/habits/create'),
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
          forceElevated: innerBoxIsScrolled,
          stretch: true,
          title: Text(appBarTitleText(viewDate)),
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
