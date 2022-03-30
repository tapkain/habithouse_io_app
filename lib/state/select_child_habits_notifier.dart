import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/state/child_habits_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dartx/dartx.dart';

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
      ...templateHabits.map((e) => HabitOption(e, false)),
    ];
    state = BuiltList(list.distinctBy((e) => e.habit.hashCode));
  }

  void toggle(Habit habit) {
    final index = state.indexWhere((e) => e.habit.hashCode == habit.hashCode);

    if (index == -1) {
      return;
    }

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

  Iterable<HabitOption> searchByName(String nameToken) => state.where(
        (h) => h.habit.name.toLowerCase().contains(nameToken.toLowerCase()),
      );

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
