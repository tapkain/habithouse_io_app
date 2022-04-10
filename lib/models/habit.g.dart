// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Habit _$$_HabitFromJson(Map<String, dynamic> json) => _$_Habit(
      id: json['id'] as int? ?? autoIncrementId,
      isChallenge: json['isChallenge'] as bool? ?? false,
      parentId: json['parentId'] as int?,
      name: json['name'] as String,
      createdAt: DateTimeUtils.fromJson(json['createdAt']),
      startDate: DateTimeUtils.fromJson(json['startDate']),
      endDate: DateTimeUtils.fromJsonN(json['endDate']),
      durationSeconds: json['durationSeconds'] as int?,
      description: json['description'] as String?,
      isArchived: json['isArchived'] as bool? ?? false,
      emojiIcon: json['emojiIcon'] as String?,
      reminders: json['reminders'] == null
          ? const []
          : remindersFromJson(json['reminders']),
      localFileAttachmentUris:
          (json['localFileAttachmentUris'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
      repeatDays: (json['repeatDays'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          DateFormatUtils.everyDay,
      targetGoal: json['targetGoal'] as String?,
      backgroundColor: json['backgroundColor'] as int? ?? 1,
      sortKey: json['sortKey'] as int? ?? 0,
    );

Map<String, dynamic> _$$_HabitToJson(_$_Habit instance) => <String, dynamic>{
      'id': instance.id,
      'isChallenge': instance.isChallenge,
      'parentId': instance.parentId,
      'name': instance.name,
      'createdAt': DateTimeUtils.toJson(instance.createdAt),
      'startDate': DateTimeUtils.toJson(instance.startDate),
      'endDate': DateTimeUtils.toJsonN(instance.endDate),
      'durationSeconds': instance.durationSeconds,
      'description': instance.description,
      'isArchived': instance.isArchived,
      'emojiIcon': instance.emojiIcon,
      'reminders': remindersToJson(instance.reminders),
      'localFileAttachmentUris': instance.localFileAttachmentUris,
      'repeatDays': instance.repeatDays,
      'targetGoal': instance.targetGoal,
      'backgroundColor': instance.backgroundColor,
      'sortKey': instance.sortKey,
    };
