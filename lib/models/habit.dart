import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habithouse_io/models/create_child_habit_form.dart';
import 'package:habithouse_io/models/create_habit_form.dart';
import 'package:isar/isar.dart';

part 'habit.freezed.dart';
part 'habit.g.dart';

@freezed
@Collection()
class Habit with _$Habit {
  const factory Habit({
    // local isar db unique autoincrement id
    @Default(isarAutoIncrementId) @Id() int id,

    // used for distinquishing templated habits vs user generated ones
    int? templateId,

    // true if this habit is part of a challenge
    @Default(false) bool isChallenge,

    // if null, habit is a routine which contains other habits
    int? parentId,
    required String name,
    required DateTime createdAt,

    // duration of habit in seconds
    int? durationSeconds,
    String? description,
    @Default(false) bool isArchived,
    String? emojiIcon,

    // time during the day when app will notify about the routine
    List<TimeOfDay>? reminders,

    // list of file uris
    List<String>? localFileAttachmentUris,

    // cron string to know how often to repeat this habit (daily, weekly, every monday etc)
    String? repeatCron,
    String? targetGoal,
    int? backgroundColor,
  }) = _Habit;
}
