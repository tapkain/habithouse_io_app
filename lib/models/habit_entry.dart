import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'habit_entry.freezed.dart';
part 'habit_entry.g.dart';

@freezed
@Collection()
class HabitEntry with _$HabitEntry {
  const factory HabitEntry({
    @Default(isarAutoIncrementId) @Id() int id,
    required int habitId,
    required DateTime createdAt,
    String? targetGoal,
  }) = _HabitEntry;
}
