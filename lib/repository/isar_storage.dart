import 'package:habithouse_io/config.dart';
import 'package:habithouse_io/models/habit.dart';
import 'package:habithouse_io/models/habit_entry.dart';
import 'package:habithouse_io/repository/storage.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:time/src/extensions.dart';

class IsarStorage implements IStorage {
  IsarStorage(this._isar);

  @override
  Future<Habit> putHabit(Habit habit) async {
    final id = await _isar.writeTxn(
      (isar) => isar.habits.put(habit, replaceOnConflict: true),
    );
    return habit.copyWith(id: id);
  }

  @override
  Future<bool> deleteHabit(int habitId) {
    return _isar.writeTxn((isar) => isar.habits.delete(habitId));
  }

  final Isar _isar;

  @override
  Future<bool> deleteEntry(int entryId) {
    return _isar.writeTxn((isar) => isar.habitEntrys.delete(entryId));
  }

  @override
  Future<HabitEntry> putEntry(HabitEntry entry) async {
    final id = await _isar.writeTxn((isar) => isar.habitEntrys.put(entry));
    return entry.copyWith(id: id);
  }

  @override
  HabitEntry? fetchEntryForDate(
    DateTime date,
    int habitId,
  ) {
    final list = _isar.habitEntrys
        .filter()
        .createdAtBetween(
          date,
          date.copyWith(hour: 23, minute: 59),
          includeLower: true,
          includeUpper: true,
        )
        .and()
        .habitIdEqualTo(habitId)
        .sortByCreatedAt()
        .findAllSync();
    return list.isEmpty ? null : list.first;
  }

  @override
  Habit? fetchHabitById(int id) => _isar.habits.getSync(id);

  @override
  List<Habit> fetchHabitsAfterDate(DateTime date, [int? parentHabitId]) {
    return _isar.habits
        .filter()
        .createdAtLessThan(date.copyWith(hour: 23, minute: 59))
        .and()
        .parentIdEqualTo(parentHabitId)
        .findAllSync();
  }

  static Future<Isar> initialize() async {
    final dir = await getApplicationSupportDirectory();
    final isar = await Isar.open(
      schemas: [HabitSchema, HabitEntrySchema],
      directory: dir.path,
      name: Config.localDbName,
      inspector: Config.isDebug,
    );

    if (Config.transientDb) {
      await isar.writeTxn((isar) => isar.clear());
    }

    return isar;
  }
}
