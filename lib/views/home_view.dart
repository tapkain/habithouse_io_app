import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/const.dart';
import 'package:habithouse_io/models/habit.dart';
import 'package:habithouse_io/state/auth_notifier.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:habithouse_io/util.dart';
import 'package:habithouse_io/widgets/date_list_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HabitViewSlivePersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return AppBar(
      title: Text('HABITHOUSE'),
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(habitsProvider);
    final viewDate = ref.watch(viewDateProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.go('/habits/create'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            stretch: true,
            title: Text(
              DateFormat()
                  .addPattern(DateFormat.ABBR_WEEKDAY + ',')
                  .addPattern(DateFormat.ABBR_MONTH)
                  .addPattern(DateFormat.DAY)
                  .format(viewDate),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: padding)),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: padding * 6,
              child: DateListView(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: padding)),
          SliverList(
            delegate: SliverChildListDelegate(
              habits.map((e) => HomeHabitWidget(habit: e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeHabitWidget extends StatelessWidget {
  const HomeHabitWidget({
    required this.habit,
    Key? key,
  }) : super(key: key);

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(habit.backgroundColor ?? 1),
      elevation: 1,
      child: ListTile(
        onTap: () => context.go('/habits/view/${habit.id}'),
        leading: habit.emojiIcon == null
            ? null
            : Text(
                habit.emojiIcon!,
                style: context.textTheme().emoji(),
              ),
        title: Text(
          habit.name,
          style: context.textTheme().headline6!.copyWith(
                color: getTextColorFor(
                  Color(habit.backgroundColor ?? 1),
                ),
              ),
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
