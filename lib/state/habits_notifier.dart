import 'package:built_collection/built_collection.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/repository/repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time/src/extensions.dart';

class HabitsNotifier extends StateNotifier<BuiltList<Habit>> {
  HabitsNotifier(this.storage, this.viewDate)
      : super(BuiltList(storage.fetchHabitsAfterDate(viewDate)));

  void putHabit(Habit h) async {
    state = BuiltList([...state, await storage.putHabit(h)]);
  }

  Habit? getById(int id) => storage.fetchHabitById(id);

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
  final habitsNotifier = ref.watch(habitsProvider.notifier);
  return habitsNotifier.getById(habitId);
});

final viewDateProvider = StateProvider((_) => DateTime.now().copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      millisecond: 0,
      microsecond: 0,
    ));
