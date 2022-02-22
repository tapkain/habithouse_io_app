import 'package:flutter_test/flutter_test.dart';
import 'package:habithouse_io/models/habit.dart';
import 'package:habithouse_io/models/habit_entry.dart';
import 'package:habithouse_io/repository/isar_storage.dart';
import 'package:isar/isar.dart';
import 'package:time/src/extensions.dart';
import 'common.dart';

class TestHabit {
  TestHabit(this.parent, this.children);

  final Habit parent;
  final List<Habit> children;
}

abstract class TestData {
  static final habits = [
    TestHabit(
      Habit(name: 'Habit 1', createdAt: DateTime(2020, 11, 12, 30)),
      [],
    ),
    TestHabit(
      Habit(name: 'Habit 2', createdAt: DateTime(2020, 8, 12, 30)),
      [],
    ),
    TestHabit(
      Habit(name: 'Habit 3', createdAt: DateTime(2020, 1, 12, 30)),
      [],
    ),
    TestHabit(
      Habit(name: 'Habit 4', createdAt: DateTime(2020, 1, 12, 30)),
      [],
    ),
  ];
}

void main() {
  group('Isar Storage', () {
    late Isar isar;
    late IsarStorage isarStorage;

    setUp(() async {
      isar = await openTempIsar([HabitSchema, HabitEntrySchema]);
      isarStorage = IsarStorage(isar);
    });

    tearDown(() async {
      await isar.close();
    });

    test('shouls be empty on start', () {
      expect(
        isar.habits.filter().idGreaterThan(isarAutoIncrementId).findAll(),
        completion(equals([])),
      );
      expect(
        isar.habitEntrys.filter().idGreaterThan(isarAutoIncrementId).findAll(),
        completion(equals([])),
      );
    });

    test('put habit', () async {
      final h = TestData.habits.first.parent;
      expect(
        await isarStorage.putHabit(h),
        equals(h.copyWith(id: 1)),
      );

      const newDescrition = 'check';
      expect(
        await isarStorage
            .putHabit(h.copyWith(description: newDescrition, id: 1)),
        equals(h.copyWith(description: newDescrition, id: 1)),
      );

      expect(
        await isarStorage.putHabit(h.copyWith(description: newDescrition)),
        equals(h.copyWith(description: newDescrition, id: 2)),
      );

      expect(
        await isar.habits.filter().idGreaterThan(isarAutoIncrementId).findAll(),
        equals([
          h.copyWith(description: newDescrition, id: 1),
          h.copyWith(description: newDescrition, id: 2),
        ]),
      );
    });

    test('delete habit', () async {
      final h = TestData.habits.first.parent;
      expect(
        await isarStorage.putHabit(h),
        equals(h.copyWith(id: 1)),
      );

      expect(
        await isarStorage.deleteHabit(1),
        equals(true),
      );
    });
  });
}
