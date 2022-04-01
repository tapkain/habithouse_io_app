import 'package:drift/drift.dart';
import 'package:habithouse_io/models/models.dart' as m;
import 'package:habithouse_io/repository/drift/database.dart';
import 'package:habithouse_io/util.dart';
import 'habit_table.dart';

class HabitEntryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get habitId => integer().references(HabitTable, #id)();
  DateTimeColumn get createdAt => dateTime()();
}

extension HabitEntryCompanionX on m.HabitEntry {
  HabitEntryTableCompanion toCompanion() => HabitEntryTableCompanion(
        id: id == autoIncrementId ? const Value.absent() : Value(id),
        habitId: Value(habitId),
        createdAt: Value(createdAt),
      );
}
