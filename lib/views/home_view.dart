import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/models/habit.dart';
import 'package:habithouse_io/state/auth_notifier.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(habitsProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.go('/habits/create'),
      ),
      body: ListView(
        children: habits.map((e) => HomeHabitWidget(habit: e)).toList(),
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
      child: InkWell(
        onTap: () => context.go('/habits/view/${habit.id}'),
        child: Text(
          habit.name,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
