import 'package:built_collection/built_collection.dart';
import 'package:habithouse_io/config.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';

class HabitsNotifier extends StateNotifier<BuiltList<Habit>> {
  HabitsNotifier(this.viewDate) : super(BuiltList()) {
    // TODO: add query by viewDate when isar has better datetime support
    // https://github.com/isar/isar/issues/222
    _isar.habits
        .filter()
        .parentIdIsNull()
        .findAll()
        .then((value) => state = BuiltList(value));
  }

  void putHabit(Habit h) {
    h.createdAt = h.createdAt ?? DateTime.now();
    _isar.writeTxn((isar) async {
      h.id = await isar.habits.put(h);
      state = BuiltList([h, ...state]);
    });
  }

  Future<Habit?> getById(int id) => _isar.habits.get(id);

  final _isar = Isar.getInstance(Config.localDbName)!;
  final DateTime viewDate;
}

final habitsProvider = StateNotifierProvider<HabitsNotifier, BuiltList<Habit>>(
  (ref) => HabitsNotifier(ref.watch(viewDateProvider)),
);

final habitByIdProvider = FutureProvider.family<Habit?, int>((ref, habitId) {
  final habits = ref.watch(habitsProvider.notifier);
  return habits.getById(habitId);
});

final viewDateProvider = StateProvider((_) => DateTime.now());
