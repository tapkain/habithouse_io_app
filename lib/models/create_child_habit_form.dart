import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'create_child_habit_form.gform.dart';

@ReactiveFormAnnotation()
class CreateChildHabit {
  final String name;
  final Emoji? emoji;

  CreateChildHabit({
    @FormControlAnnotation(validators: [requiredValidator]) this.name = '',
    @FormControlAnnotation(validators: [
      emojiValidator,
      maxEmojiLengthValidator
    ])
        this.emoji,
  });
}
