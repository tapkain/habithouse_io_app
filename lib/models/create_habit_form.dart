import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:habithouse_io/models/form_validators.dart';
import 'package:habithouse_io/models/habit.dart';
import 'package:habithouse_io/widgets/widgets.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'create_habit_form.gform.dart';

@ReactiveFormAnnotation()
class CreateHabit {
  final String name;
  final Emoji emoji;
  final Color backgroundColor;
  final DateTime startDate;
  final DateTimeRange? dateTimeRange;
  final List<int> repeatDays;
  final List<TimeOfDay> reminders;

  CreateHabit({
    @FormControlAnnotation(validators: [habitNameValidator]) this.name = '',
    @FormControlAnnotation() this.emoji = const Emoji('emoji', '🎯'),
    @FormControlAnnotation() this.backgroundColor = Colors.black,
    @FormControlAnnotation() this.repeatDays = everyDay,
    @FormArrayAnnotation() this.reminders = const [],
    @FormControlAnnotation() this.dateTimeRange,
    @FormControlAnnotation(validators: [habitStartDateValidator])
        required this.startDate,
  });
}

extension CreateHabitFormX on CreateHabitForm {
  Habit toHabit() => applyTo(Habit.initial());

  Habit applyTo(Habit habit) => habit.copyWith(
        name: nameValue,
        startDate: startDateValue,
        createdAt: DateTime.now(),
        backgroundColor: backgroundColorValue.value,
        emojiIcon: emojiValue.emoji,
        reminders: remindersValue,
        repeatDays: repeatDaysValue,
      );
}
