import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:habithouse_io/models/form_validators.dart';
import 'package:habithouse_io/widgets/widgets.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'create_habit_form.gform.dart';

@ReactiveFormAnnotation()
class CreateHabit {
  final String name;
  final Emoji? emoji;
  final Color? backgroundColor;
  // TODO: implement on view
  final DateTime? startDate;
  final DateTime? endDate;
  final List<int> repeatDays;
  final List<TimeOfDay> reminders;

  CreateHabit({
    @FormControlAnnotation(validators: [requiredValidator]) this.name = '',
    @FormControlAnnotation(validators: [
      emojiValidator,
      maxEmojiLengthValidator
    ])
        this.emoji,
    @FormControlAnnotation() this.backgroundColor = Colors.black,
    @FormControlAnnotation() this.repeatDays = everyDay,
    @FormArrayAnnotation() this.reminders = const [],
    @FormControlAnnotation(validators: [startDateValidator]) this.startDate,
    @FormControlAnnotation() this.endDate,
  });
}
