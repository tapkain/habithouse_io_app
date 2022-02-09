import 'package:built_collection/built_collection.dart';
import 'package:dartx/dartx.dart';
import 'package:habithouse_io/config.dart';
import 'package:habithouse_io/models/habit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

class ChildHabitsNotifier extends StateNotifier<BuiltList<Habit>> {
  ChildHabitsNotifier(this.habitId) : super(BuiltList()) {
    _isar.habits
        .filter()
        .parentIdEqualTo(habitId)
        .findAll()
        .then((value) => state = BuiltList(value));
  }

  void putHabits(int parentHabitId, List<Habit> habits) {
    _isar.writeTxn((isar) async {
      if (state.isNotEmpty) {
        await isar.habits.deleteAll(state.map((e) => e.id).toList());
      }

      final ids = await isar.habits.putAll(
        habits
            .map(
              (e) => e
                ..parentId = parentHabitId
                ..createdAt = e.createdAt ?? DateTime.now(),
            )
            .toList(),
        replaceOnConflict: true,
      );

      for (var i = 0; i < ids.length; i++) {
        habits[i].id = ids[i];
      }

      state = BuiltList(habits);
    });
  }

  final int habitId;
  final _isar = Isar.getInstance(Config.localDbName)!;
}

final childHabitsProvider =
    StateNotifierProvider.family<ChildHabitsNotifier, BuiltList<Habit>, int>(
  (ref, habitId) => ChildHabitsNotifier(habitId),
);
