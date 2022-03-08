import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/const.dart';
import 'package:habithouse_io/models/habit.dart';
import 'package:habithouse_io/state/auth_notifier.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:habithouse_io/widgets/date_list_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(habitsProvider);
    final viewDate = ref.watch(viewDateProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('habithouse'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => context.go('/habits/create'),
      ),
      body: Column(
        children: [
          const SizedBox(height: padding),
          Container(
            alignment: Alignment.center,
            height: padding * 12,
            child: const DateListView(),
          ),
          Expanded(
            child: ListView(
              children: habits.map((e) => HomeHabitWidget(habit: e)).toList(),
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
                style: Theme.of(context).textTheme.headline4,
              ),
        title: Text(
          habit.name,
          style: Theme.of(context).textTheme.headline6,
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
