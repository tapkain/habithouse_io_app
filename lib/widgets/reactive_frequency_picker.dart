import 'package:dartx/dartx.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habithouse_io/util.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveFrequencyPicker<T> extends ReactiveFormField<T, List<int>> {
  ReactiveFrequencyPicker({
    String? formControlName,
    FormControl<T>? formControl,
    InputDecoration? inputDecoration,
    Key? key,
  }) : super(
          formControlName: formControlName,
          formControl: formControl,
          builder: (field) {
            final value =
                field.value == null ? DateFormatUtils.everyDay : field.value!;

            // ignore: prefer_function_declarations_over_variables
            final onTap = () async {
              final result = await showDialog<List<int>>(
                context: field.context,
                builder: (_) => _FrequencyPickerDialog(days: field.value!),
              );

              if (result != null) {
                field.didChange(result);
              }
            };

            return Listener(
              onPointerDown: (_) => field.control.markAsTouched(),
              child: ListTile(
                onTap: field.control.enabled ? onTap : null,
                title: Text(inputDecoration?.labelText ?? 'How often?'),
                trailing: Text(DateFormatUtils.formatWeekday(value)),
              ),
            );
          },
          key: key,
        );
}

class _DayCheckbox extends StatelessWidget {
  const _DayCheckbox({
    required this.day,
    required this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final int day;
  final bool value;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(
          listTileTheme: context.theme.listTileTheme.copyWith(
        tileColor: Colors.transparent,
      )),
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        dense: true,
        value: value,
        onChanged: onChanged,
        title: Text(DateFormatUtils.formatDay(day)),
      ),
    );
  }
}

class _FrequencyPickerDialog extends StatefulWidget {
  const _FrequencyPickerDialog({
    required this.days,
    Key? key,
  }) : super(key: key);

  final List<int> days;

  @override
  State<_FrequencyPickerDialog> createState() => __FrequencyPickerDialogState();
}

class __FrequencyPickerDialogState extends State<_FrequencyPickerDialog> {
  late var selectedDays = widget.days.toList();

  bool isSelected(int day) => selectedDays.contains(day);
  void toggle(int day) {
    setState(() {
      if (isSelected(day)) {
        selectedDays.remove(day);
      } else {
        selectedDays.add(day);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select weekdays'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: DateFormatUtils.everyDay
              .map(
                (e) => _DayCheckbox(
                  day: e,
                  value: isSelected(e),
                  onChanged: (_) => toggle(e),
                ),
              )
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('CANCEL'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(selectedDays),
          child: Text('OK'),
        ),
      ],
    );
  }
}
