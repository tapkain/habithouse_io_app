import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

// TODO: finish frequency picker implementation

const everyDay = [
  DateTime.monday,
  DateTime.tuesday,
  DateTime.wednesday,
  DateTime.thursday,
  DateTime.friday,
  DateTime.saturday,
  DateTime.sunday,
];

const _everyDayMap = {
  DateTime.monday: 'MON',
  DateTime.tuesday: 'TUE',
  DateTime.wednesday: 'WED',
  DateTime.thursday: 'THU',
  DateTime.friday: 'FRI',
  DateTime.saturday: 'SAT',
  DateTime.sunday: 'SUN',
};

String parseWeekdays(
  Iterable<int> days, {
  String everyDayLabel = 'Every Day',
}) {
  if (days.reduce((v, e) => v + e) ==
      _everyDayMap.keys.reduce((v, e) => v + e)) {
    return everyDayLabel;
  }

  return days.map((e) => _everyDayMap[e]).join(',');
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
            // ignore: prefer_function_declarations_over_variables
            final onTap = () {
              // showModalBottomSheet(
              //   context: field.context,
              //   builder: (context) =>
              //       // DraggableScrollableSheet(builder: (_, __) {

              //       // }),
              // );
            };
            return Listener(
              onPointerDown: (_) => field.control.markAsTouched(),
              child: ListTile(
                onTap: field.control.enabled ? onTap : null,
                contentPadding: EdgeInsets.zero,
                dense: true,
                title: Text(inputDecoration?.labelText ?? 'Repeat'),
                trailing: Text(
                  parseWeekdays(field.value ?? everyDay),
                  style: Theme.of(field.context).textTheme.subtitle2,
                ),
              ),
            );
          },
          key: key,
        );
}
