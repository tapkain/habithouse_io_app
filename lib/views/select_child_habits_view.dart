import 'package:built_collection/built_collection.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/state/child_habits_notifier.dart';
import 'package:habithouse_io/state/select_child_habits_notifier.dart';
import 'package:habithouse_io/util.dart';
import 'package:habithouse_io/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectChildHabitSearchTokenProvider = StateProvider.autoDispose<String>(
  (_) => '',
);

final filteredSelectedChildHabitsProvider = StateProvider.family
    .autoDispose<BuiltList<HabitOption>, int>((ref, habitId) {
  final selectedChildHabits = ref.watch(selectChildHabitsProvider(habitId));
  final selectedChildHabitsNotifier =
      ref.watch(selectChildHabitsProvider(habitId).notifier);
  final searchToken = ref.watch(selectChildHabitSearchTokenProvider);
  return searchToken.isEmpty
      ? selectedChildHabits
      : BuiltList(selectedChildHabitsNotifier.searchByName(searchToken));
});

class SelectChildHabitsView extends HookConsumerWidget {
  const SelectChildHabitsView({required this.habitId, Key? key})
      : super(key: key);

  final int habitId;

  void onCreateHabitPressed(BuildContext context, String habitName) =>
      context.go(
        '${GoRouter.of(context).location}/create',
        extra: Habit(name: habitName, createdAt: DateTime.now()),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChildHabits =
        ref.watch(filteredSelectedChildHabitsProvider(habitId));
    final searchToken = ref.watch(selectChildHabitSearchTokenProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverModalAppBar(
            title: const Text('Add Habit'),
            trailing: TextButton(
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
              child: const Text('Done'),
            ),
          ),
          SliverAppBar(
            backgroundColor: context.theme().colorScheme.background,
            automaticallyImplyLeading: false,
            pinned: true,
            title: SearchBox(
              hintText: 'Search or add new habit',
              onChanged: (token) => ref
                  .read(selectChildHabitSearchTokenProvider.notifier)
                  .state = token,
            ),
          ),
          SliverToBoxAdapter(
            child: AnimatedContainer(
              height: searchToken.isEmpty ? 0 : 80,
              duration: 300.milliseconds,
              child: ListTile(
                onTap: () => onCreateHabitPressed(context, searchToken),
                leading: Text(
                  '🎯',
                  style: context.textTheme().emoji(),
                ),
                title: Text(searchToken),
                subtitle: const Text('Create custom habit'),
                trailing: TextButton(
                  child: const Text('CREATE'),
                  onPressed: () => onCreateHabitPressed(context, searchToken),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              selectedChildHabits
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
      onTap: () => context.go(
        '${GoRouter.of(context).location}/create',
        extra: habit.habit.copyWith(templateId: null),
      ),
      leading: Text(
        habit.habit.emojiIcon ?? '',
        style: context.textTheme().emoji(),
      ),
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
