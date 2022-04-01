import 'package:habithouse_io/models/habit_entry.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/repository/storage.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time/src/extensions.dart';

class HabitEntryModifyForbidden implements Exception {}

class ChildHabitEntryNotifier extends StateNotifier<HabitEntry?> {
  ChildHabitEntryNotifier(
    this.storage,
    this.viewDate,
    int habitId,
  ) : super(null) {
    storage.fetchEntryForDate(viewDate, habitId).then((value) => state = value);
  }

  Future<void> putEntry(HabitEntry entry) async {
    if (viewDate.copyWith(hour: 23, minute: 59).isBefore(DateTime.now())) {
      throw HabitEntryModifyForbidden();
    }

    state = await storage.putEntry(entry);
  }

  Future<void> deleteEntry(HabitEntry entry) async {
    if (viewDate.copyWith(hour: 23, minute: 59).isBefore(DateTime.now())) {
      throw HabitEntryModifyForbidden();
    }

    await storage.deleteEntry(entry.id);
    state = null;
  }

  final DateTime viewDate;
  final IStorage storage;
}

final childHabitEntryProvider = StateNotifierProvider.family
    .autoDispose<ChildHabitEntryNotifier, HabitEntry?, int>(
  (ref, habitId) => ChildHabitEntryNotifier(
    ref.read(storageProvider),
    ref.watch(viewDateProvider),
    habitId,
  ),
);
