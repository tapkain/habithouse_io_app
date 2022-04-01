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
              onTap: () => setState(() {
                if (!switchValue) {
                  switchValue = true;
                  onSwitchEnabled(ref, formArray);
                }
              }),
              trailing: Switch.adaptive(
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
            if (formArray.controls.isNotEmpty) const Divider(),
            ...ListTile.divideTiles(
              context: context,
              tiles: formArray.controls
                  .asMap()
                  .map(
                    (index, control) => MapEntry(
                      index,
                      Dismissible(
                        onDismissed: (_) => formArray.removeAt(index),
                        background: Container(
                          color: context.theme.colorScheme.error,
                        ),
                        key: ValueKey(hashValues(control.value!, index + 1)),
                        child: ReactiveTimePicker(
                          builder: (context, picker, child) => ListTile(
                            onTap: picker.showPicker,
                            title: Text(picker.value!.format(context)),
                            trailing: const Icon(Icons.chevron_right),
                          ),
                          formControl: control as FormControl<TimeOfDay>,
                        ),
                      ),
                    ),
                  )
                  .values,
            ).toList(),
            const Divider(),
            TextButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  const Size(double.infinity, 50),
                ),
              ),
              onPressed: () => onAddReminderPressed(formArray),
              child: Text('Add reminder'.toUpperCase()),
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
      value: TimeOfDay.now(),
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
    } else {
      formArray.removeAt(formArray.controls.length - 1);
    }
  }
}
