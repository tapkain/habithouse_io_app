import 'package:built_collection/built_collection.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/repository/repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time/src/extensions.dart';

class HabitsNotifier extends StateNotifier<BuiltList<Habit>> {
  HabitsNotifier(this.storage, this.viewDate)
      : super(BuiltList(storage.fetchHabitsAfterDate(viewDate)));

  void putHabit(Habit habit) async {
    final stateMap = Map.fromIterables(state.map((h) => h.id), state);
    final newHabit = await storage.putHabit(habit);
    stateMap[newHabit.id] = newHabit;
    state = BuiltList(stateMap.values);
  }

  final DateTime viewDate;
  final IStorage storage;
}

final habitsProvider = StateNotifierProvider<HabitsNotifier, BuiltList<Habit>>(
  (ref) => HabitsNotifier(
    ref.read(storageProvider),
    ref.watch(viewDateProvider),
  ),
);

final habitByIdProvider = StateProvider.family<Habit?, int>((ref, habitId) {
  final habits = ref.watch(habitsProvider);
  final index = habits.indexWhere((h) => h.id == habitId);
  return index == -1 ? null : habits[index];
});

final viewDateProvider = StateProvider((_) => DateTime.now().date);
