import 'package:built_collection/built_collection.dart';
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

  final int habitId;
  final _isar = Isar.getInstance(Config.localDbName)!;
}

final childHabitsProvider =
    StateNotifierProvider.family<ChildHabitsNotifier, BuiltList<Habit>, int>(
  (ref, habitId) => ChildHabitsNotifier(habitId),
);
