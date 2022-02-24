import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:habithouse_io/models/create_child_habit_form.dart';
import 'package:habithouse_io/models/habit.dart';

import 'create_habit_form.dart';

abstract class Mapper {
  static Habit makeHabitFromHabitForm(CreateHabitForm form) =>
      mapHabitFormToHabit(
        Habit(createdAt: DateTime.now(), name: form.nameValue),
        form,
      );

  static CreateHabit makeHabitForm(Habit habit) => CreateHabit(
        name: habit.name,
        backgroundColor: habit.backgroundColor != null
            ? Color(habit.backgroundColor!)
            : null,
        emoji:
            habit.emojiIcon != null ? Emoji('emoji', habit.emojiIcon!) : null,
        reminders: habit.reminders ?? [],
      );

  static Habit mapHabitFormToHabit(Habit habit, CreateHabitForm form) =>
      habit.copyWith(
        name: form.nameValue,
        backgroundColor: form.backgroundColorValue?.value,
        emojiIcon: form.emojiValue?.emoji,
        reminders: form.remindersValue,
      );

  static Habit makeHabitFromChildHabitForm(
          CreateChildHabitForm form, int parentId) =>
      mapChildHabitFormToHabit(
        Habit(createdAt: DateTime.now(), name: form.nameValue),
        form,
        parentId,
      );

  static Habit mapChildHabitFormToHabit(
    Habit habit,
    CreateChildHabitForm form,
    int parentId,
  ) =>
      habit.copyWith(
        name: form.nameValue,
        createdAt: DateTime.now(),
        parentId: parentId,
      );

  static CreateChildHabit makeChildHabitForm(Habit habit) => CreateChildHabit(
        name: habit.name,
      );
}
