import 'package:built_collection/built_collection.dart';
import 'package:habithouse_io/models/habit.dart';
import 'package:habithouse_io/models/habit_entry.dart';

abstract class IStorage {
  Habit? fetchHabitById(int id);
  Future<Habit> putHabit(Habit h);
  List<Habit> fetchHabitsAfterDate(DateTime date, [int? parentHabitId]);
  Future<void> deleteEntry(int entryId);
  Future<HabitEntry> putEntry(HabitEntry entry);
  HabitEntry? fetchEntryForDate(
    DateTime date,
    int habitId,
  );
}
