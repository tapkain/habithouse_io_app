import 'dart:async';

import 'package:habithouse_io/models/habit_entry.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/repository/storage.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HabitEntryModifyForbidden implements Exception {}

class ChildHabitEntryNotifier extends StateNotifier<HabitEntry?> {
  ChildHabitEntryNotifier(
    this.storage,
    this.viewDate,
    int habitId,
  ) : super(null) {
    _queryListener =
        storage.watchEntryForDate(viewDate, habitId).listen((event) {
      state = event;
    });
  }

  Future<void> putEntry(HabitEntry entry) => storage.putEntry(entry);
  Future<void> deleteEntry(HabitEntry entry) => storage.deleteEntry(entry.id);

  @override
  void dispose() {
    _queryListener.cancel();
    super.dispose();
  }

  final DateTime viewDate;
  final IStorage storage;
  late final StreamSubscription<HabitEntry?> _queryListener;
}

final childHabitEntryProvider = StateNotifierProvider.family
    .autoDispose<ChildHabitEntryNotifier, HabitEntry?, int>(
  (ref, habitId) => ChildHabitEntryNotifier(
    ref.read(storageProvider),
    ref.watch(viewDateProvider),
    habitId,
  ),
);
