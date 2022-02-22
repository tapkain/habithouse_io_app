import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:habithouse_io/models/habit.dart';
import 'package:habithouse_io/state/child_habits_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dartx/dartx.dart';

final _premadeHabits = [
  Habit(
    emojiIcon: '🧘',
    name: 'Meditation',
    description: 'Meditation is gud',
    createdAt: DateTime.now(),
  ),
  Habit(
    emojiIcon: '🚿',
    name: 'Cold Shower',
    description: 'Cold Shomer is too cold',
    createdAt: DateTime.now(),
  ),
  Habit(
    emojiIcon: '🍺',
    name: 'Drink Beer',
    description: 'Makes u ugly',
    createdAt: DateTime.now(),
  ),
];

@immutable
class HabitOption {
  const HabitOption(this.habit, this.isSelected);

  final bool isSelected;
  final Habit habit;
}

class SelectChildHabitsNotifier extends StateNotifier<BuiltList<HabitOption>> {
  SelectChildHabitsNotifier(BuiltList<Habit> habits) : super(BuiltList()) {
    final list = [
      ...habits.map((e) => HabitOption(e, true)),
      ..._premadeHabits.map((e) => HabitOption(e, false)),
    ];
    state = BuiltList(list.distinctBy((e) => e.habit.name));
  }

  void toggle(Habit habit) {
    final index = state.indexWhere((e) => e.habit.name == habit.name);
    final old = state[index];
    state = state.rebuild(
      (e) => e
        ..removeAt(index)
        ..insert(index, HabitOption(habit, !old.isSelected))
        ..build(),
    );
  }

  void putHabit(Habit h) {
    state = BuiltList([HabitOption(h, true), ...state]);
  }

  BuiltList<Habit> get selected => state
      .where((e) => e.isSelected)
      .map((e) => e.habit.copyWith(createdAt: DateTime.now()))
      .toBuiltList();
}

final selectChildHabitsProvider = StateNotifierProvider.family
    .autoDispose<SelectChildHabitsNotifier, BuiltList<HabitOption>, int>(
  (ref, habitId) {
    final childHabits = ref.watch(childHabitsProvider(habitId));
    return SelectChildHabitsNotifier(childHabits);
  },
);
