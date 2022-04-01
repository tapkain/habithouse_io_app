import 'package:built_collection/built_collection.dart';
import 'package:dartx/dartx.dart';
import 'package:habithouse_io/config.dart';
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
    storage
        .fetchHabitsForDate(viewDate, habitId)
        .then((value) => state = BuiltList(value));
  }

  void putHabits(int parentHabitId, List<Habit> habits) {
    // TODO: move this to repo + find a better logic
    // _isar.writeTxn((isar) async {
    //   if (state.isNotEmpty) {
    //     await isar.habits.deleteAll(state.map((e) => e.id).toList());
    //   }

    //   final ids = await isar.habits.putAll(
    //     habits.map((e) => e.copyWith(parentId: parentHabitId)).toList(),
    //     replaceOnConflict: true,
    //   );

    //   for (var i = 0; i < ids.length; i++) {
    //     habits[i] = habits[i].copyWith(id: ids[i]);
    //   }

    //   state = BuiltList(habits);
    // });
  }

  final int habitId;
  final DateTime viewDate;
  final IStorage storage;
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
