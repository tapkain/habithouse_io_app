import 'package:flutter/material.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:habithouse_io/state/child_habits_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PreviewHabitView extends HookConsumerWidget {
  const PreviewHabitView({required this.habitId, Key? key}) : super(key: key);

  final int habitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habit = ref.watch(habitByIdProvider(habitId));

    return Scaffold(
      body: habit.when(
        data: (data) => buildView(data!, ref),
        error: (_, __) => Container(),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget buildView(Habit habit, WidgetRef ref) {
    final childHabits = ref.watch(childHabitsProvider(habitId));

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(habit.name),
        ),
        SliverToBoxAdapter(
          child: ElevatedButton(onPressed: () {}, child: Text('Start FLOW')),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, index) => LeafHabitListItem(habit: childHabits[index]),
            childCount: childHabits.length,
          ),
        ),
      ],
    );
  }
}

class LeafHabitListItem extends StatelessWidget {
  const LeafHabitListItem({required this.habit, Key? key}) : super(key: key);

  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
