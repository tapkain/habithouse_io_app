// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HabitEntry _$$_HabitEntryFromJson(Map<String, dynamic> json) =>
    _$_HabitEntry(
      id: json['id'] as int? ?? autoIncrementId,
      habitId: json['habitId'] as int,
      createdAt: DateTimeUtils.fromJson(json['createdAt']),
      targetGoal: json['targetGoal'] as String?,
    );

Map<String, dynamic> _$$_HabitEntryToJson(_$_HabitEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'habitId': instance.habitId,
      'createdAt': DateTimeUtils.toJson(instance.createdAt),
      'targetGoal': instance.targetGoal,
    };
