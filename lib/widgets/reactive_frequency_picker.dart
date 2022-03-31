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

  return customDayLabel;
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
            final toggleDay = (int day) {
              final copy = [...value];
              if (value.contains(day)) {
                copy.remove(day);
              } else {
                copy.add(day);
              }
              field.didChange(copy);
            };

            final state = field as _ReactiveFrequencyPickerState<T>;
            // ignore: prefer_function_declarations_over_variables
            final onTap = () => state.setExpanded(true);

            return Listener(
              onPointerDown: (_) => field.control.markAsTouched(),
              child: ListTile(
                onTap: field.control.enabled ? onTap : null,
                title: Text(inputDecoration?.labelText ?? 'How often?'),
                trailing: Text(
                  parseWeekdays(value),
                  style: Theme.of(field.context).textTheme.subtitle2,
                ),
                subtitle: state.expanded
                    ? Row(
                        children: everyDay
                            .map((e) => _DayCheckbox(
                                  day: e,
                                  value: value.contains(e),
                                  onChanged: (_) => toggleDay(e),
                                ))
                            .toList(),
                      )
                    : null,
              ),
            );
          },
          key: key,
        );

  @override
  ReactiveFormFieldState<T, List<int>> createState() =>
      _ReactiveFrequencyPickerState<T>();
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

  String formatDay() {
    var date = DateTime(2020, 1, 1);
    while (date.weekday != day) {
      date = date.add(1.days);
    }
    return DateFormat('EEE').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          shape: const CircleBorder(),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Text(formatDay())
      ],
    );
  }
}

class _ReactiveFrequencyPickerState<T>
    extends ReactiveFormFieldState<T, List<int>> {
  var expanded = false;
  void setExpanded(bool value) {
    if (value != expanded) {
      setState(() => expanded = value);
    }
  }

  void toggleExpanded() => setExpanded(!expanded);
}
