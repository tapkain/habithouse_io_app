// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habithouse_io/util.dart';

part 'habit_entry.freezed.dart';
part 'habit_entry.g.dart';

@freezed
class HabitEntry with _$HabitEntry {
  const factory HabitEntry({
    @Default(autoIncrementId) int id,
    required int habitId,
    @JsonKey(fromJson: DateTimeUtils.fromJson, toJson: DateTimeUtils.toJson)
        required DateTime createdAt,
    String? targetGoal,
  }) = _HabitEntry;

  factory HabitEntry.fromJson(Map<String, dynamic> json) =>
      _$HabitEntryFromJson(json);
}
