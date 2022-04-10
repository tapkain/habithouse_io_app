import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:habithouse_io/models/habit.dart';
import 'package:habithouse_io/repository/repository.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChildHabitsNotifier extends StateNotifier<BuiltList<Habit>> {
  ChildHabitsNotifier(
    this.storage,
    this.viewDate,
    this.habitId,
  ) : super(BuiltList([])) {
    _queryListener =
        storage.watchHabitsForDate(viewDate, habitId).listen((event) {
      state = BuiltList(event);
    });
  }

  Future<void> putHabits(int parentHabitId, List<Habit> habits) =>
      storage.putHabits(
        habits.map((e) => e.copyWith(parentId: parentHabitId)).toList(),
      );

  @override
  void dispose() {
    _queryListener.cancel();
    super.dispose();
  }

  final int habitId;
  final DateTime viewDate;
  final IStorage storage;
  late final StreamSubscription<List<Habit>> _queryListener;
}

final childHabitsProvider = StateNotifierProvider.family
    .autoDispose<ChildHabitsNotifier, BuiltList<Habit>, int>(
  (ref, habitId) => ChildHabitsNotifier(
    ref.read(storageProvider),
    ref.watch(viewDateProvider),
    habitId,
  ),
);

final childHabitByIdProvider =
    StateProvider.family.autoDispose<Habit?, int>((ref, habitId) {
  final habits = ref.watch(childHabitsProvider(habitId));
  final index = habits.indexWhere((h) => h.id == habitId);
  return index == -1 ? null : habits[index];
});
