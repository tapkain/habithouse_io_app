import 'dart:math';

import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:habithouse_io/util.dart';
import 'package:habithouse_io/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pageDateProvider = StateProvider((_) => DateTime.now().date);

class HabitListView extends HookConsumerWidget {
  const HabitListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewDate = ref.watch(pageDateProvider);

    // generate each viewDate change a new key to rebuild completely
    // snappinglist below in order to avoid bugs with state
    final randomKey = Random().nextDouble();

    return SnappingListView(
      key: ValueKey(randomKey),
      onItemChanged: (fromIndex, toIndex) {
        final delta = toIndex - fromIndex;
        ref.read(viewDateProvider.state).update((state) => state + delta.days);
      },
      scrollDirection: Axis.horizontal,
      itemExtent: MediaQuery.of(context).size.width,
      itemBuilder: (context, index) {
        final habits = ref.watch(habitsByDateProvider(viewDate + index.days));
        return ListView(
          key: ValueKey(index),
          children: habits.map((e) => HomeHabitWidget(habit: e)).toList(),
        );
      },
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
      color: Color(habit.backgroundColor),
      elevation: 1,
      child: ListTile(
        onTap: () => context.go('/habits/view/${habit.id}'),
        leading: habit.emojiIcon == null
            ? null
            : Text(
                habit.emojiIcon!,
                style: context.textTheme.emoji,
              ),
        title: Text(
          habit.name,
          style: context.textTheme.headline6!.copyWith(
            color: Color(habit.backgroundColor).textColor,
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
