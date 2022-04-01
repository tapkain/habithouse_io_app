import 'package:habithouse_io/models/habit.dart';
import 'package:habithouse_io/models/habit_entry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class IStorage {
  Future<Habit?> fetchHabitById(int id);
  Future<Habit> putHabit(Habit h);
  Future<void> deleteHabit(int habitId);
  Future<List<Habit>> fetchHabitsForDate(DateTime date, [int? parentHabitId]);
  Future<void> deleteEntry(int entryId);
  Future<HabitEntry> putEntry(HabitEntry entry);
  Future<HabitEntry?> fetchEntryForDate(
    DateTime date,
    int habitId,
  );

  Stream<List<Habit>> watchHabitsForDate(DateTime date, [int? parentHabitId]);
}

final storageProvider = Provider<IStorage>((_) => throw UnimplementedError());
