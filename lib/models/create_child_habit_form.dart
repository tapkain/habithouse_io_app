import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'create_child_habit_form.gform.dart';

@ReactiveFormAnnotation()
class CreateChildHabit {
  final String name;
  final Emoji emoji;
  final String description;
  final int? durationSeconds;

  CreateChildHabit({
    @FormControlAnnotation(validators: [habitNameValidator]) this.name = '',
    @FormControlAnnotation() this.emoji = const Emoji('emoji', '🎯'),
    @FormControlAnnotation(validators: [habitDescriptionValidator])
        this.description = '',
    @FormControlAnnotation(validators: [habitDurationValidator])
        this.durationSeconds,
  });
}

extension CreateChildHabitX on CreateChildHabitForm {
  Habit toHabit(int parentId) => applyTo(Habit.initial(), parentId);

  Habit applyTo(Habit habit, int parentId) => habit.copyWith(
        name: nameValue,
        startDate: DateTime.now(),
        createdAt: DateTime.now(),
        parentId: parentId,
      );
}
