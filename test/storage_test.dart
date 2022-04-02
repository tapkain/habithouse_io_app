import 'package:flutter_test/flutter_test.dart';
import 'package:habithouse_io/models/habit.dart';
import 'package:habithouse_io/repository/drift/database.dart';
import 'package:habithouse_io/repository/storage.dart';
import 'package:time/src/extensions.dart';

void main() {
  group('Isar Storage', () {
    late AppDb db;
    late IStorage storage;

    setUp(() async {
      db = AppDb(transientDb: true, populateDb: false, logStatements: false);
      storage = db;
    });

    tearDown(() async {
      await db.close();
    });

    test('put habit', () async {
      final h = Habit.initial();
      expect(
        await storage.putHabit(h),
        equals(h.copyWith(id: 1)),
      );

      const newDescrition = 'check';
      expect(
        await storage.putHabit(h.copyWith(description: newDescrition, id: 1)),
        equals(h.copyWith(description: newDescrition, id: 1)),
      );

      expect(
        await storage.putHabit(h.copyWith(description: newDescrition)),
        equals(h.copyWith(description: newDescrition, id: 2)),
      );
    });

    test('delete habit', () async {
      final h = Habit.initial();
      expect(
        await storage.putHabit(h),
        equals(h.copyWith(id: 1)),
      );

      expect(
        await storage.deleteHabit(1),
        equals(true),
      );
    });
  });
}
