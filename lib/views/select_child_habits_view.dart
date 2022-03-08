import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/state/child_habits_notifier.dart';
import 'package:habithouse_io/state/select_child_habits_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectChildHabitsView extends HookConsumerWidget {
  const SelectChildHabitsView({required this.habitId, Key? key})
      : super(key: key);

  final int habitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChildHabits = ref.watch(selectChildHabitsProvider(habitId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Habit'),
        actions: [
          TextButton(
            onPressed: () {
              final selectedChildHabitsNotifier =
                  ref.read(selectChildHabitsProvider(habitId).notifier);
              final childHabitsNotifier =
                  ref.read(childHabitsProvider(habitId).notifier);

              childHabitsNotifier.putHabits(
                habitId,
                selectedChildHabitsNotifier.selected.toList(),
              );

              context.pop();
            },
            child: Text('Done'),
          ),
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () =>
                context.go('${GoRouter.of(context).location}/create'),
            child: Text('Add custom habit'),
          ),
          Expanded(
            child: ListView(
              children: selectedChildHabits
                  .map((e) => SelectChildHabitListTile(
                        habit: e,
                        parentHabitId: habitId,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectChildHabitListTile extends HookConsumerWidget {
  const SelectChildHabitListTile({
    required this.habit,
    required this.parentHabitId,
    Key? key,
  }) : super(key: key);

  final HabitOption habit;
  final int parentHabitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Text(habit.habit.emojiIcon ?? ''),
      title: Text(habit.habit.name),
      subtitle: Text(habit.habit.description ?? ''),
      trailing: TextButton(
        onPressed: () => ref
            .read(selectChildHabitsProvider(parentHabitId).notifier)
            .toggle(habit.habit),
        child: Text(habit.isSelected ? 'REMOVE' : 'ADD'),
      ),
    );
  }
}
