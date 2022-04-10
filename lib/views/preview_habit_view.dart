import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/state/child_habit_entry_notifier.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:habithouse_io/state/child_habits_notifier.dart';
import 'package:habithouse_io/theme.dart';
import 'package:habithouse_io/util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';

class PreviewHabitView extends HookConsumerWidget {
  const PreviewHabitView({required this.habitId, Key? key}) : super(key: key);

  final int habitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habit = ref.watch(habitByIdProvider(habitId));
    if (habit == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('Habit not found'),
        ),
      );
    }

    return FancyThemeProvider(
      primary: Color(habit.backgroundColor),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => context.pop(),
          ),
          centerTitle: false,
          title: Text(habit.name),
          actions: [
            TextButton(
              onPressed: () =>
                  context.go('${GoRouter.of(context).location}/edit'),
              child: Text('Edit'.toUpperCase()),
            ),
          ],
        ),
        body: buildView(context, habit, ref),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            HapticFeedback.lightImpact();
            context.go('${GoRouter.of(context).location}/templates');
          },
        ),
      ),
    );
  }

  Widget buildView(BuildContext context, Habit habit, WidgetRef ref) {
    final childHabits = ref.watch(childHabitsProvider(habitId));
    return CustomScrollView(
      slivers: [
        if (childHabits.isNotEmpty)
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Start ${habit.name}'),
            ),
          )
        else
          SliverFillViewport(
            delegate: SliverChildListDelegate.fixed(
              [buildNoHabitsView(context)],
            ),
            viewportFraction: 0.8,
            padEnds: false,
          ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, index) => ChildHabitListTile(habit: childHabits[index]),
            childCount: childHabits.length,
          ),
        ),
      ],
    );
  }

  Widget buildNoHabitsView(BuildContext context) => Center(
        child: InkWell(
          onTap: () => context.go('${GoRouter.of(context).location}/templates'),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('🤷', style: context.textTheme.bigEmoji),
              Text(
                'No habits here',
                style: context.textTheme.emoji,
              ),
            ],
          ),
        ),
      );
}

class ChildHabitListTile extends HookConsumerWidget {
  const ChildHabitListTile({
    required this.habit,
    Key? key,
  }) : super(key: key);

  final Habit habit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitEntry = ref.watch(childHabitEntryProvider(habit.id));
    return ListTile(
      title: Text(habit.name),
      trailing: Checkbox(
        value: habitEntry != null,
        onChanged: (value) async {
          try {
            final habitEntryNotifier =
                ref.read(childHabitEntryProvider(habit.id).notifier);

            if (value == true) {
              await habitEntryNotifier.putEntry(HabitEntry(
                habitId: habit.id,
                createdAt: DateTime.now(),
              ));
            } else if (habitEntry != null) {
              await habitEntryNotifier.deleteEntry(habitEntry);
            }
          } on HabitEntryModifyForbidden {
            showSimpleNotification(Text('Read only'));
          }
        },
      ),
    );
  }
}
