import 'dart:io';

import 'package:dartx/dartx.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:habithouse_io/config.dart';
import 'package:habithouse_io/repository/drift/habit_entry_table.dart';
import 'package:habithouse_io/repository/drift/habit_table.dart';
import 'package:habithouse_io/repository/drift/populate_db_data.dart';
import 'package:habithouse_io/repository/storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:habithouse_io/models/models.dart' as m;

part 'database.g.dart';

@DriftDatabase(tables: [
  HabitEntryTable,
  HabitTable,
])
class AppDb extends _$AppDb implements IStorage {
  AppDb()
      : super(
          Config.transientDb
              ? NativeDatabase.memory(logStatements: true)
              : _openConnection(),
        );

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() => LazyDatabase(() async {
        final dbFolder = await getApplicationDocumentsDirectory();
        final file = File(p.join(dbFolder.path, 'db.sqlite'));
        return NativeDatabase(file);
      });

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
        onCreate: (Migrator m) async {
          await m.createAll();

          if (Config.populateDb) {
            final habitList = generateHabits(DateTime.now().date);
            await transaction(() => Future.wait(
                  habitList.map(
                    (e) => into(habitTable)
                        .insertOnConflictUpdate(e.toCompanion()),
                  ),
                ));
          }
        },
      );

  @override
  Future<void> deleteEntry(int entryId) =>
      (delete(habitEntryTable)..where((tbl) => tbl.id.equals(entryId))).go();

  @override
  Future<void> deleteHabit(int habitId) =>
      (delete(habitTable)..where((tbl) => tbl.id.equals(habitId))).go();

  @override
  Future<m.HabitEntry?> fetchEntryForDate(DateTime date, int habitId) =>
      (select(habitEntryTable)
            ..where((tbl) =>
                tbl.createdAt.isBetweenValues(date.date, date.date + 1.days))
            ..where((tbl) => tbl.habitId.equals(habitId)))
          .getSingleOrNull()
          .then((value) =>
              value == null ? null : m.HabitEntry.fromJson(value.toJson()));

  @override
  Future<m.HabitEntry> putEntry(m.HabitEntry entry) {
    // TODO: implement putEntry
    throw UnimplementedError();
  }

  @override
  Future<m.Habit> putHabit(m.Habit h) async {
    final id = await into(habitTable).insertOnConflictUpdate(h.toCompanion());
    return h.copyWith(id: id);
  }

  @override
  Future<m.Habit?> fetchHabitById(int id) => (select(habitTable)
        ..where((tbl) => tbl.id.equals(id)))
      .getSingleOrNull()
      .then((value) => value == null ? null : m.Habit.fromJson(value.toJson()));

  @override
  Future<List<m.Habit>> fetchHabitsForDate(
    DateTime date, [
    int? parentHabitId,
  ]) {
    var query = select(habitTable)
      ..where((tbl) => tbl.startDate.isSmallerOrEqualValue(date))
      ..where((tbl) => tbl.endDate.isBiggerOrEqualValue(date));

    if (parentHabitId == null) {
      query = query..where((tbl) => tbl.parentId.isNull());
    } else {
      query = query..where((tbl) => tbl.parentId.equals(parentHabitId));
    }

    return query.get().then(
        (value) => value.map((e) => m.Habit.fromJson(e.toJson())).toList());
  }
}
