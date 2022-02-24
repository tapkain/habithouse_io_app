import 'package:reactive_forms/reactive_forms.dart';

Map<String, dynamic>? requiredValidator(AbstractControl<dynamic> control) {
  return Validators.required(control);
}

Map<String, dynamic>? emojiValidator(AbstractControl<dynamic> control) {
  const regex =
      r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])';
  return Validators.pattern(
    regex,
    validationMessage: 'Must contain emoji character',
  )(control);
}

Map<String, dynamic>? maxEmojiLengthValidator(
    AbstractControl<dynamic> control) {
  return Validators.maxLength(5)(control);
}
