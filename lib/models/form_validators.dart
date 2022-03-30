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

Map<String, dynamic>? habitStartDateValidator(
  AbstractControl<dynamic> control,
) {
  return Validators.compose([
    Validators.required,
    _isDateAfterNow(),
  ])(control);
}

Map<String, dynamic>? habitEndDateValidator(
  AbstractControl<dynamic> control,
) {
  return Validators.compose([_isDateAfterNow()])(control);
}

Map<String, dynamic>? habitDurationValidator(
  AbstractControl<dynamic> control,
) {
  return Validators.compose([Validators.min(habitDurationMin)])(control);
}

ValidatorFunction _isDateAfterNow() {
  const validationMessageDateBefore = 'dateBefore';
  const validationMessageTypeMismatch = 'typeMismatch';

  return (control) {
    if (control.value == null) {
      return null;
    }

    if (control.disabled) {
      return null;
    }

    if (control.value! is DateTime) {
      return <String, dynamic>{validationMessageTypeMismatch: {}};
    }

    final now = DateTime.now();
    var value = control.value as DateTime;
    value = value.date;

    return value.isAfter(now)
        ? null
        : <String, dynamic>{validationMessageDateBefore: {}};
  };
}
