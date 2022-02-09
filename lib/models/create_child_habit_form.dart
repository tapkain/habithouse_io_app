import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'create_child_habit_form.gform.dart';

@ReactiveFormAnnotation()
class CreateChildHabit {
  final String name;

  CreateChildHabit({
    @FormControlAnnotation() this.name = '',
  });
}
