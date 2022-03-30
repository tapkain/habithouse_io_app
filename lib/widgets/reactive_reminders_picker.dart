import 'package:flutter/material.dart';
import 'package:habithouse_io/service/service.dart';
import 'package:habithouse_io/util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveRemindersPicker extends StatefulWidget {
  const ReactiveRemindersPicker({
    required this.remindersControl,
    Key? key,
  }) : super(key: key);

  final FormArray<TimeOfDay> remindersControl;

  @override
  State<ReactiveRemindersPicker> createState() =>
      _ReactiveRemindersPickerState();
}

class _ReactiveRemindersPickerState extends State<ReactiveRemindersPicker> {
  var switchValue = false;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormArray<TimeOfDay>(
      formArray: widget.remindersControl,
      builder: (context, formArray, child) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HookConsumer(builder: (context, ref, _) {
            return ListTile(
              title: Text('Remind me'),
              dense: true,
              onTap: () => setState(() {
                if (!switchValue) {
                  switchValue = true;
                  onSwitchEnabled(ref, formArray);
                }
              }),
              contentPadding: EdgeInsets.zero,
              trailing: Switch(
                onChanged: (value) => setState(() {
                  switchValue = value;
                  if (switchValue) {
                    onSwitchEnabled(ref, formArray);
                  } else {
                    formArray.clear();
                  }
                }),
                value: switchValue,
              ),
            );
          }),
          if (switchValue) ...[
            ...ListTile.divideTiles(
              context: context,
              tiles: formArray.controls.map(
                (control) => Dismissible(
                  onDismissed: (_) => formArray.remove(control),
                  background: Container(
                    color: context.theme.colorScheme.error,
                  ),
                  key: ValueKey(control.value!.hashCode),
                  child: ReactiveTimePicker(
                    builder: (context, picker, child) => ListTile(
                      onTap: picker.showPicker,
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      title: Text(picker.value!.format(context)),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                    formControl: control as FormControl<TimeOfDay>,
                  ),
                ),
              ),
            ).toList(),
            TextButton(
              onPressed: () => onAddReminderPressed(formArray),
              child: Text('Add reminder'),
            ),
          ]
        ],
      ),
    );
  }

  void onSwitchEnabled(WidgetRef ref, FormArray<TimeOfDay> formArray) async {
    await ref.read(localNotificationsProvider).requestPermission();
    onAddReminderPressed(formArray);
  }

  void onAddReminderPressed(FormArray<TimeOfDay> formArray) async {
    final formControl = FormControl<TimeOfDay>(
      value: const TimeOfDay(hour: 9, minute: 0),
    );

    formArray.add(formControl);
    final result = await showDialog<TimeOfDay>(
      context: context,
      builder: (_) => TimePickerDialog(
        initialTime: formControl.value!,
      ),
    );

    if (result != null) {
      formControl.updateValue(result);
    }
  }
}
