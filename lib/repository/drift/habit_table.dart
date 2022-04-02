import 'package:drift/drift.dart';
import 'package:habithouse_io/models/habit.dart';
import 'package:habithouse_io/models/models.dart' as m;
import 'package:habithouse_io/repository/drift/database.dart';
import 'package:habithouse_io/repository/drift/list_converter.dart';
import 'package:habithouse_io/util.dart';

class HabitTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get parentId => integer().nullable().references(HabitTable, #id)();
  TextColumn get name =>
      text().withLength(min: habitNameMinLength, max: habitNameMaxLength)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime().nullable()();
  IntColumn get durationSeconds => integer().nullable()();
  TextColumn get description => text()
      .withLength(
          min: habitDescriptionMinLength, max: habitDescriptionMaxLength)
      .nullable()();
  TextColumn get emojiIcon => text().nullable()();
  IntColumn get backgroundColor => integer().nullable()();
  TextColumn get repeatDays => text().map(
        ListConverter<int>(
          fromJson: (j) => int.parse(j),
          toJson: (v) => v.toString(),
        ),
      )();
}

extension HabitsCompanionX on m.Habit {
  HabitTableCompanion toCompanion() => HabitTableCompanion(
        id: id == autoIncrementId ? const Value.absent() : Value(id),
        parentId: Value(parentId),
        name: Value(name),
        createdAt: Value(createdAt),
        startDate: Value(startDate),
        endDate: Value(endDate),
        durationSeconds: Value(durationSeconds),
        description: Value(description),
        emojiIcon: Value(emojiIcon),
        backgroundColor: Value(backgroundColor),
        repeatDays: Value(repeatDays),
      );
}
