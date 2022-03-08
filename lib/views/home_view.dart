import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/const.dart';
import 'package:habithouse_io/models/habit.dart';
import 'package:habithouse_io/state/auth_notifier.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:habithouse_io/util.dart';
import 'package:habithouse_io/widgets/date_list_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(habitsProvider);
    final viewDate = ref.watch(viewDateProvider);

    // TODO: finish sliver app bar
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.go('/habits/create'),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            // stretch: true,
            title: Text('habithouse'),
            expandedHeight: 200,

            flexibleSpace: FlexibleSpaceBar(
              // background: Text('habithouse'),
              title: Text('habithouse'),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: DateListView().preferredSize.height,
              child: const DateListView(),
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
                style: context.textTheme().headline4,
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
