import 'package:built_collection/built_collection.dart';
import 'package:habithouse_io/config.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

class HabitsNotifier extends StateNotifier<BuiltList<Habit>> {
  HabitsNotifier() : super(BuiltList()) {
    _isar.habits
        .filter()
        .parentIdIsNull()
        .findAll()
        .then((value) => state = BuiltList(value));
  }

  void putHabit(Habit h) {
    h.createdAt = DateTime.now();
    h.ownerId = 0;

    state = BuiltList([h, ...state]);
    _isar.writeTxn((isar) async {
      await isar.habits.put(h);
    });
  }

  Future<Habit?> getById(int id) => _isar.habits.get(id);

  final _isar = Isar.getInstance(Config.localDbName)!;
}

final habitsProvider = StateNotifierProvider<HabitsNotifier, BuiltList<Habit>>(
  (_) => HabitsNotifier(),
);

final habitByIdProvider = FutureProvider.family<Habit?, int>((ref, habitId) {
  final habits = ref.watch(habitsProvider.notifier);
  return habits.getById(habitId);
});
