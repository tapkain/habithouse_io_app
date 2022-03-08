import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/const.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/state/child_habit_entry_notifier.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:habithouse_io/state/child_habits_notifier.dart';
import 'package:habithouse_io/util.dart';
import 'package:habithouse_io/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';

// TODO: finish widget
class PreviewHabitAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const PreviewHabitAppBarBottom({
    required this.habit,
    Key? key,
  }) : super(key: key);

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text('LOL'),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kPreviewHabitAppBarBottomHeight);
}

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

    return Scaffold(
      appBar: ModalAppBar(
        appBarColor: Color(habit.backgroundColor ?? 1),
        title: Text(habit.name),
        leading: TextButton(
          onPressed: () => context.pop(),
          child: const Text('Back'),
        ),
        trailing: TextButton(
          onPressed: () => context.push('/habits/edit/${habit.id}'),
          child: const Text('Edit'),
        ),
      ),
      body: buildView(habit, ref),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.go('${GoRouter.of(context).location}/select'),
      ),
    );
  }

  Widget buildView(Habit habit, WidgetRef ref) {
    final childHabits = ref.watch(childHabitsProvider(habitId));
    return CustomScrollView(
      slivers: [
        if (childHabits.isNotEmpty)
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Start ${habit.name}'),
            ),
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
