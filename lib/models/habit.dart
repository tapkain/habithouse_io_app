import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habithouse_io/models/create_child_habit_form.dart';
import 'package:habithouse_io/models/create_habit_form.dart';
import 'package:habithouse_io/util.dart';
import 'package:habithouse_io/widgets/widgets.dart';
import 'package:isar/isar.dart';

part 'habit.freezed.dart';
part 'habit.g.dart';

const habitNameMinLength = 2;
const habitNameMaxLength = 30;
const habitDurationMin = 0;
const habitDescriptionMinLength = 0;
const habitDescriptionMaxLength = 300;

@freezed
@Collection()
class Habit with _$Habit {
  @Assert('name.length != 0', 'name cannot be empty')
  @Assert(
    'name.length > $habitNameMinLength && name.length < $habitNameMaxLength',
    'name length should be > $habitNameMinLength && < $habitNameMaxLength',
  )
  @Assert(
    'durationSeconds == null ? true : durationSeconds > $habitDurationMin',
    'duration should be more that $habitDurationMin',
  )
  @Assert(
    'description == null ? true : description.length > $habitDescriptionMinLength && description.length < $habitDescriptionMaxLength',
    'desc length should be > $habitDescriptionMinLength && < $habitDescriptionMaxLength',
  )
  @Assert(
    'endDate == null ? true : endDate.isAfter(startDate)',
    'endDate should be after startDate',
  )
  @Assert(
    'emojiIcon == null ? true : emojiIcon.length != 0',
    'emojiIcon cannot be empty',
  )
  factory Habit({
    // local isar db unique autoincrement id
    @Default(isarAutoIncrementId) @Id() int id,

    // true if this habit is part of a challenge
    // TODO: implement challenges
    @Default(false) bool isChallenge,

    // if null, habit is a routine which could contain other habits
    int? parentId,
    required String name,
    required DateTime createdAt,
    required DateTime startDate,
    DateTime? endDate,

    // duration of habit in seconds
    int? durationSeconds,
    String? description,
    @Default(false) bool isArchived,
    String? emojiIcon,

    // time during the day when app will notify about the routine
    @Default([]) List<TimeOfDay> reminders,

    // list of file uris
    @Default([]) List<String> localFileAttachmentUris,

    // days on which this habit will be repeated (DateTime.monday etc)
    @Default(everyDay) List<int> repeatDays,
    String? targetGoal,
    @Default(1) int backgroundColor,
  }) = _Habit;

  factory Habit.initial() => Habit(
        name: List.generate(habitNameMinLength + 1, (index) => '-').join(),
        startDate: DateTime.now(),
        createdAt: DateTime.now(),
      );
}

extension HabitX on Habit {
  CreateHabit toCreateHabitForm() => CreateHabit(
        name: name,
        backgroundColor: Color(backgroundColor),
        emoji: Emoji('emoji', emojiIcon ?? '🎯'),
        reminders: reminders,
        repeatDays: repeatDays,
        dateTimeRange: DateTimeRangeUtils.dateTimeRange(startDate, endDate),
      );

  CreateChildHabit toCreateChildHabitForm() => CreateChildHabit(
        name: name,
        // emoji: Emoji('emoji', emojiIcon!),
      );
}
