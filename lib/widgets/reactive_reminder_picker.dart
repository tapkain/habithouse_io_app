import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

void showTimePickerDialog(
  BuildContext context,
  AbstractControl<TimeOfDay> formControl,
) async {
  final result = await showDialog<TimeOfDay>(
      context: context,
      builder: (_) => TimePickerDialog(
            initialTime: formControl.value ?? TimeOfDay.now(),
          ));

  if (result != null) {
    formControl.updateValue(result);
  }
}

class ReactiveReminderPicker<T> extends ReactiveFormField<T, TimeOfDay> {
  ReactiveReminderPicker({
    String? formControlName,
    FormControl<T>? formControl,
    InputDecoration? inputDecoration,
    Key? key,
  }) : super(
          formControlName: formControlName,
          formControl: formControl,
          builder: (field) {
            final value = field.value ?? TimeOfDay.now();
            // ignore: prefer_function_declarations_over_variables
            final onTap = () async {
              final result = await showDialog<TimeOfDay>(
                context: field.context,
                builder: (_) => TimePickerDialog(initialTime: value),
              );

              if (result != null) {
                field.didChange(result);
              }
            };

            return Listener(
              onPointerDown: (_) => field.control.markAsTouched(),
              child: ListTile(
                onTap: field.control.enabled ? onTap : null,
                contentPadding: EdgeInsets.zero,
                dense: true,
                title: Text(value.format(field.context)),
                trailing: const Icon(Icons.chevron_right),
              ),
            );
          },
          key: key,
        );
}
