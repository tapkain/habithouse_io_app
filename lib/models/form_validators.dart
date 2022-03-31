import 'package:dartx/dartx.dart';
import 'package:habithouse_io/models/create_habit_form.dart';
import 'package:habithouse_io/models/habit.dart';
import 'package:reactive_forms/reactive_forms.dart';

Map<String, dynamic>? habitNameValidator(AbstractControl<dynamic> control) {
  return Validators.compose([
    Validators.required,
    Validators.minLength(habitNameMinLength),
    Validators.maxLength(habitNameMaxLength),
  ])(control);
}

Map<String, dynamic>? habitDescriptionValidator(
  AbstractControl<dynamic> control,
) {
  return Validators.compose([
    Validators.maxLength(habitDescriptionMaxLength),
    Validators.minLength(habitDescriptionMinLength),
  ])(control);
}

Map<String, dynamic>? habitDurationValidator(
  AbstractControl<dynamic> control,
) {
  return Validators.compose([Validators.min(habitDurationMin)])(control);
}
