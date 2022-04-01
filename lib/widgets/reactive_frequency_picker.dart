import 'package:dartx/dartx.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habithouse_io/util.dart';
import 'package:reactive_forms/reactive_forms.dart';

const everyDay = [
  DateTime.monday,
  DateTime.tuesday,
  DateTime.wednesday,
  DateTime.thursday,
  DateTime.friday,
  DateTime.saturday,
  DateTime.sunday,
];

String parseWeekdays(
  Iterable<int> days, {
  String everyDayLabel = 'Every Day',
  String anyDayLabel = 'Any Day',
  String customDayLabel = 'Custom',
}) {
  if (days.isEmpty) {
    return anyDayLabel;
  }

  if (days.reduce((v, e) => v + e) == everyDay.reduce((v, e) => v + e)) {
    return everyDayLabel;
  }

  return days
      .sorted()
      .map((e) => DateFormatUtils.formatDay(e, 'EEE'))
      .join(',');
}

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
            final value = field.value == null ? everyDay : field.value!;

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
                trailing: Text(parseWeekdays(value)),
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
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
      value: value,
      onChanged: onChanged,
      title: Text(DateFormatUtils.formatDay(day)),
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

  String formatDay(int day) {
    var date = DateTime(2020, 1, 1);
    while (date.weekday != day) {
      date = date.add(1.days);
    }
    return DateFormat('EEEE').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select weekdays'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: everyDay
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
