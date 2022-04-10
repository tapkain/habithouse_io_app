import 'dart:io';

import 'package:dartx/dartx.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:habithouse_io/repository/drift/habit_entry_table.dart';
import 'package:habithouse_io/repository/drift/habit_table.dart';
import 'package:habithouse_io/repository/drift/populate_db_data.dart';
import 'package:habithouse_io/repository/drift/shared_prefs_table.dart';
import 'package:habithouse_io/repository/storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:habithouse_io/models/models.dart' as m;
import 'list_converter.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  HabitEntryTable,
  HabitTable,
  SharedPrefsTable,
])
class AppDb extends _$AppDb implements IStorage {
  AppDb({
    required bool transientDb,
    required this.populateDb,
    required bool logStatements,
  }) : super(
          transientDb
              ? NativeDatabase.memory(logStatements: logStatements)
              : _openConnection(logStatements),
        );

  final bool populateDb;

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection(bool logStatements) =>
      LazyDatabase(() async {
        final dbFolder = await getApplicationDocumentsDirectory();
        final file = File(p.join(dbFolder.path, 'db.sqlite'));
        return NativeDatabase(file, logStatements: logStatements);
      });

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
        onCreate: (Migrator m) async {
          await m.createAll();

          if (populateDb) {
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
  Future<bool> deleteEntry(int entryId) =>
      (delete(habitEntryTable)..where((tbl) => tbl.id.equals(entryId)))
          .go()
          .then((value) => value == 1);

  @override
  Future<bool> deleteHabit(int habitId) =>
      (delete(habitTable)..where((tbl) => tbl.id.equals(habitId)))
          .go()
          .then((value) => value == 1);

  @override
  Future<m.HabitEntry?> fetchEntryForDate(DateTime date, int habitId) =>
      _entryForDateQuery(date, habitId).getSingleOrNull().then((value) =>
          value == null ? null : m.HabitEntry.fromJson(value.toJson()));

  @override
  Future<m.HabitEntry> putEntry(m.HabitEntry entry) async {
    final oldEntry = await fetchEntryForDate(entry.createdAt, entry.habitId);
    if (oldEntry != null) {
      return oldEntry;
    }

    final id =
        await into(habitEntryTable).insertOnConflictUpdate(entry.toCompanion());
    return entry.copyWith(id: id);
  }

  @override
  Future<m.Habit> putHabit(m.Habit habit) async {
    final id =
        await into(habitTable).insertOnConflictUpdate(habit.toCompanion());
    return habit.copyWith(id: id);
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
  ]) =>
      _habitsForDateQuery(date, parentHabitId).get().then(
          (value) => value.map((e) => m.Habit.fromJson(e.toJson())).toList());

  SimpleSelectStatement<$HabitTableTable, HabitTableData> _habitsForDateQuery(
    DateTime date, [
    int? parentHabitId,
  ]) {
    var query = select(habitTable)
      ..where((tbl) => tbl.startDate.julianday
          .roundToInt()
          .isSmallerOrEqual(date.julianday.roundToInt()))
      ..where((tbl) => tbl.endDate.isNull().caseMatch<bool>(
            when: {const Constant(true): const Constant(true)},
            orElse: tbl.endDate.julianday
                .roundToInt()
                .isBiggerOrEqual(date.julianday.roundToInt()),
          ))
      ..where((tbl) => tbl.repeatDays.contains(date.weekday.toString()))
      ..orderBy([
        (tbl) => OrderingTerm(expression: tbl.sortKey, mode: OrderingMode.desc),
        (tbl) => OrderingTerm(expression: tbl.createdAt)
      ]);

    if (parentHabitId == null) {
      query = query..where((tbl) => tbl.parentId.isNull());
    } else {
      query = query..where((tbl) => tbl.parentId.equals(parentHabitId));
    }
    return query;
  }

  @override
  Stream<List<m.Habit>> watchHabitsForDate(
    DateTime date, [
    int? parentHabitId,
  ]) =>
      _habitsForDateQuery(date, parentHabitId).watch().map(
          (value) => value.map((e) => m.Habit.fromJson(e.toJson())).toList());

  @override
  Future<void> putHabits(List<m.Habit> habits) => batch((batch) {
        batch.insertAllOnConflictUpdate(
          habitTable,
          habits.map((e) => e.toCompanion()),
        );
      });

  SimpleSelectStatement<$HabitEntryTableTable, HabitEntryTableData>
      _entryForDateQuery(
    DateTime date,
    int habitId,
  ) =>
          (select(habitEntryTable)
            ..where((tbl) => tbl.createdAt.julianday
                .roundToInt()
                .equalsExp(date.julianday.roundToInt()))
            ..where((tbl) => tbl.habitId.equals(habitId)));

  @override
  Stream<m.HabitEntry?> watchEntryForDate(DateTime date, int habitId) =>
      _entryForDateQuery(date, habitId).watchSingleOrNull().map((value) =>
          value == null ? null : m.HabitEntry.fromJson(value.toJson()));
}

extension DateTimeExpressionsX on Expression<DateTime?> {
  Expression<double?> get julianday {
    return FunctionCallExpression(
      'julianday',
      [
        this,
        const Constant<String>('unixepoch'),
        const Constant<String>('localtime'),
      ],
    );
  }
}

extension DateTimeJulianday on DateTime {
  Expression<double?> get julianday {
    return FunctionCallExpression(
      'julianday',
      [
        Constant(millisecondsSinceEpoch ~/ 1000),
        const Constant<String>('unixepoch'),
        const Constant<String>('localtime'),
      ],
    );
  }
}
