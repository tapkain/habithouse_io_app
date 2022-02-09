import 'package:built_collection/built_collection.dart';
import 'package:habithouse_io/config.dart';
import 'package:habithouse_io/models/habit_entry.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/state/child_habits_notifier.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

class ChildHabitEntryNotifier extends StateNotifier<BuiltList<HabitEntry>> {
  ChildHabitEntryNotifier(this.viewDate, this.childHabits)
      : super(BuiltList()) {
    // TODO: add query by viewDate when isar has better datetime support
    // https://github.com/isar/isar/issues/222

    // TODO: replace this by IN clause or better join
    if (childHabits.isNotEmpty) {
      var query = _isar.habitEntrys.filter();
      for (var i = 0; i < childHabits.length - 1; i++) {
        query = query.habitIdEqualTo(childHabits[i].id).or();
      }

      query
          .habitIdEqualTo(childHabits.last.id)
          .findAll()
          .then((value) => state = BuiltList(value));
    }
  }

  void putEntry(HabitEntry entry) {
    _isar.writeTxn((isar) async {
      entry.id = await isar.habitEntrys.put(entry);
      state = BuiltList([entry, ...state]);
    });
  }

  void deleteEntry(HabitEntry entry) {
    _isar.writeTxn((isar) async {
      await isar.habitEntrys.delete(entry.id);
      state = state.rebuild((e) => e.removeWhere((r) => r.id == entry.id));
    });
  }

  final BuiltList<Habit> childHabits;
  final _isar = Isar.getInstance(Config.localDbName)!;
  final DateTime viewDate;
}

final childHabitEntryProvider = StateNotifierProvider.family<
    ChildHabitEntryNotifier, BuiltList<HabitEntry>, int>(
  (ref, habitId) => ChildHabitEntryNotifier(
    ref.watch(viewDateProvider),
    ref.watch(childHabitsProvider(habitId)),
  ),
);
