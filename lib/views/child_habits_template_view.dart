import 'package:built_collection/built_collection.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/const.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/state/child_habits_notifier.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:habithouse_io/state/select_child_habits_notifier.dart';
import 'package:habithouse_io/theme.dart';
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

class ChildHabitsTemplateView extends HookConsumerWidget {
  const ChildHabitsTemplateView({required this.habitId, Key? key})
      : super(key: key);

  final int habitId;

  void onCreateHabitPressed(BuildContext context, String habitName) =>
      context.go(
        '${GoRouter.of(context).location}/create',
        extra: Habit(
          name: habitName,
          createdAt: DateTime.now(),
          startDate: DateTime.now(),
        ),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChildHabits =
        ref.watch(filteredSelectedChildHabitsProvider(habitId));
    final searchToken = ref.watch(selectChildHabitSearchTokenProvider);
    final habit = ref.watch(habitByIdProvider(habitId));

    return WillPopScope(
      onWillPop: () async {
        final selectedChildHabits =
            ref.read(selectChildHabitsProvider(habitId).notifier);
        if (selectedChildHabits.isStatePristine) {
          return true;
        }
        final result = await showDialog<bool>(
            context: context, builder: (_) => const _ConfirmPopDialog());
        return result!;
      },
      child: FancyThemeProvider(
        primary: Color(habit!.backgroundColor),
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.close),
                ),
                centerTitle: false,
                title: Text(habit.name),
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
                    child: Text('save'.toUpperCase()),
                  ),
                ],
              ),
              SliverAppBar(
                backgroundColor: context.theme.colorScheme.background,
                automaticallyImplyLeading: false,
                pinned: true,
                centerTitle: true,
                titleSpacing: 0,
                toolbarHeight: kToolbarHeight - 10,
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: padding),
                  child: SearchBox(
                    hintText: 'Search or add new habit',
                    onChanged: (token) => ref
                        .read(selectChildHabitSearchTokenProvider.notifier)
                        .state = token,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: padding)),
              SliverToBoxAdapter(
                child: AnimatedContainer(
                  height: searchToken.isEmpty ? 0 : 80,
                  duration: 300.milliseconds,
                  child: ListTile(
                    onTap: () => onCreateHabitPressed(context, searchToken),
                    leading: Text(
                      '🎯',
                      style: context.textTheme.emoji,
                    ),
                    title: Text(searchToken),
                    subtitle: const Text('Create custom habit'),
                    trailing: TextButton(
                      child: const Text('CREATE'),
                      onPressed: () =>
                          onCreateHabitPressed(context, searchToken),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  selectedChildHabits
                      .map((e) => ChildHabitTemplateListTile(
                            habit: e,
                            parentHabitId: habitId,
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChildHabitTemplateListTile extends HookConsumerWidget {
  const ChildHabitTemplateListTile({
    required this.habit,
    required this.parentHabitId,
    Key? key,
  }) : super(key: key);

  final HabitOption habit;
  final int parentHabitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      onTap: () => context.go(
        '${GoRouter.of(context).location}/create',
        extra: habit.habit,
      ),
      leading: Text(
        habit.habit.emojiIcon ?? '',
        style: context.textTheme.emoji,
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

class _ConfirmPopDialog extends StatelessWidget {
  const _ConfirmPopDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text('Continue without saving?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('CANCEL'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('OK'),
        ),
      ],
    );
  }
}
