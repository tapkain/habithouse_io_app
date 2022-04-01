import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/repository/repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time/src/extensions.dart';

// TODO:
// 1. (maybe) listen to isar query watcher for fetching habits
// 2. filter by weekday
// 3. if viewDate is less than DateTime.now() we are in "history browsing mode"
// history browsing - filter additionally by habit entries

class HabitsNotifier extends StateNotifier<BuiltList<Habit>> {
  HabitsNotifier(this.storage, this.viewDate) : super(BuiltList([])) {
    _queryListener = storage.watchHabitsForDate(viewDate).listen((event) {
      state = BuiltList(event);
    });
  }

  Future<int> putHabit(Habit habit) async {
    final stateMap = Map.fromIterables(state.map((h) => h.id), state);
    final newHabit = await storage.putHabit(habit);
    stateMap[newHabit.id] = newHabit;
    state = BuiltList(stateMap.values);
    return newHabit.id;
  }

  @override
  void dispose() {
    _queryListener.cancel();
    super.dispose();
  }

  final DateTime viewDate;
  final IStorage storage;
  late final StreamSubscription<List<Habit>> _queryListener;
}

final habitsProvider = StateNotifierProvider<HabitsNotifier, BuiltList<Habit>>(
  (ref) => HabitsNotifier(
    ref.read(storageProvider),
    ref.watch(viewDateProvider),
  ),
);

final habitsByDateProvider = StateNotifierProvider.family
    .autoDispose<HabitsNotifier, BuiltList<Habit>, DateTime>(
  (ref, viewDate) => HabitsNotifier(
    ref.read(storageProvider),
    viewDate,
  ),
);

final habitByIdProvider = StateProvider.family<Habit?, int>((ref, habitId) {
  final habits = ref.watch(habitsProvider);
  final index = habits.indexWhere((h) => h.id == habitId);
  return index == -1 ? null : habits[index];
});

final viewDateProvider = StateProvider((_) => DateTime.now().date);
