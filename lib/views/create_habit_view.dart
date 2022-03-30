import 'package:dartx/dartx.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/const.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/service/service.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:habithouse_io/util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_date_range_picker/reactive_date_range_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../widgets/widgets.dart';

DateTime _lastDate() => DateTime.now().add((365 * 3).days);

class CreateHabitView extends HookConsumerWidget {
  const CreateHabitView({this.editHabitId, Key? key}) : super(key: key);

  final int? editHabitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (editHabitId != null) {
      final editHabit = ref.watch(habitByIdProvider(editHabitId!));
      return editHabit == null ? Container() : buildView(editHabit, ref);
    }

    return buildView(null, ref);
  }

  Widget buildView(
    Habit? editHabit,
    WidgetRef ref,
  ) {
    return CreateHabitFormBuilder(
      model: editHabit?.toCreateHabitForm() ??
          CreateHabit(
            backgroundColor: randomColor(),
            startDate: DateTime.now(),
          ),
      builder: (context, formModel, child) => ReactiveCreateHabitFormConsumer(
        builder: (context, formModel, child) => Scaffold(
          appBar: ModalAppBar(
            appBarColor: formModel.backgroundColorValue,
            title: Text(editHabit == null ? 'New Routine' : 'Edit Routine'),
            leading: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Cancel'),
            ),
            trailing: TextButton(
              onPressed: formModel.form.valid
                  ? () => submitForm(context, ref, formModel)
                  : null,
              child: Text(
                'Save',
                style: context.textTheme().button!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: formModel.form.valid
                          ? formModel.backgroundColorValue.textColor
                          : context.theme().disabledColor,
                    ),
              ),
            ),
          ),
          body: Theme(
            data: context.theme().copyWith(
                  colorScheme: ColorScheme.fromSeed(
                      seedColor: formModel.backgroundColorValue),
                  primaryColor: formModel.backgroundColorValue,
                  appBarTheme:
                      AppBarTheme(color: formModel.backgroundColorValue),
                ),
            child: ListView(
              padding: const EdgeInsets.all(padding * 2),
              children: [
                ReactiveTextField<String>(
                  autofocus: true,
                  formControl: formModel.nameControl,
                  decoration: const InputDecoration(labelText: 'Habit name'),
                ),
                const SizedBox(height: padding),
                ReactiveColorPicker(
                  formControl: formModel.backgroundColorControl,
                ),
                const Divider(),
                ReactiveEmojiPicker(
                  formControl: formModel.emojiControl,
                ),
                const Divider(),
                if (formModel.dateTimeRangeValue != null)
                  ReactiveDateRangePicker(
                    formControl: formModel.dateTimeRangeControl,
                    showClearIcon: false,
                    decoration: const InputDecoration(border: InputBorder.none),
                  )
                else
                  ReactiveDatePicker(
                    formControl: formModel.startDateControl,
                    builder: (context, picker, child) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text('Start date'),
                          trailing: Text(formatStartDate(picker.value!)),
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          onTap: picker.showPicker,
                        ),
                        const Divider(),
                        ListTile(
                          title: Text('End date'),
                          trailing: Switch(
                            value: false,
                            onChanged: (value) => onShowDateRangePickerPressed(
                                context, formModel),
                          ),
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          onTap: () =>
                              onShowDateRangePickerPressed(context, formModel),
                        ),
                      ],
                    ),
                    initialDate: formModel.startDateValue,
                    firstDate: DateTime.now().date,
                    lastDate: _lastDate(),
                  ),
                const Divider(),
                ReactiveFrequencyPicker(
                  checkboxFillColor: formModel.backgroundColorValue,
                  formControl: formModel.repeatDaysControl,
                ),
                const Divider(),
                HabitReminderFormSection(
                  formModel: formModel,
                  remindersControl: formModel.remindersControl,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onShowDateRangePickerPressed(
    BuildContext context,
    CreateHabitForm formModel,
  ) async {
    final dateRange = await showDateRangePicker(
      context: context,
      currentDate: formModel.startDateValue,
      firstDate: DateTime.now().date,
      lastDate: _lastDate(),
    );

    if (dateRange != null) {
      formModel.dateTimeRangeControl?.updateValue(dateRange);
    }
  }

  String formatStartDate(DateTime dateTime) {
    if (dateTime.isToday) {
      return 'Today';
    }

    if (dateTime.isTomorrow) {
      return 'Tomorrow';
    }

    return DateFormat.yMMMMd().format(dateTime);
  }

  void submitForm(
    BuildContext context,
    WidgetRef ref,
    CreateHabitForm form,
  ) async {
    final habitsNotifier = ref.read(habitsProvider.notifier);
    var habit = form.toHabit();

    if (editHabitId != null) {
      final editHabit = ref.read(habitByIdProvider(editHabitId!))!;
      habit = form.applyTo(editHabit);
    }

    habitsNotifier.putHabit(habit);
    context.pop();
  }
}

class HabitReminderFormSection extends StatefulWidget {
  const HabitReminderFormSection({
    required this.remindersControl,
    required this.formModel,
    Key? key,
  }) : super(key: key);

  final FormArray<TimeOfDay> remindersControl;
  final CreateHabitForm formModel;

  @override
  State<HabitReminderFormSection> createState() =>
      _HabitReminderFormSectionState();
}

class _HabitReminderFormSectionState extends State<HabitReminderFormSection> {
  var switchValue = false;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormArray<TimeOfDay>(
      formArray: widget.remindersControl,
      builder: (context, formArray, child) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('Remind me'),
            dense: true,
            onTap: () => setState(() => switchValue = true),
            contentPadding: EdgeInsets.zero,
            trailing: HookConsumer(
              builder: (context, ref, _) => Switch(
                activeColor: widget.formModel.backgroundColorValue,
                onChanged: (value) => setState(() {
                  switchValue = value;
                  if (switchValue) {
                    ref.read(localNotificationsProvider).requestPermission();
                  } else {
                    formArray.clear();
                  }
                }),
                value: switchValue,
              ),
            ),
          ),
          if (switchValue) ...[
            ...ListTile.divideTiles(
              context: context,
              tiles: formArray.controls.map(
                (control) => Dismissible(
                  onDismissed: (_) => formArray.remove(control),
                  background: Container(
                    color: context.theme().colorScheme.error,
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

  void onAddReminderPressed(FormArray<TimeOfDay> formArray) async {
    widget.formModel.addRemindersItem(
      const TimeOfDay(hour: 9, minute: 0),
    );

    final formControl = formArray.control(
      (formArray.controls.length - 1).toString(),
    ) as AbstractControl<TimeOfDay>;

    final result = await showDialog<TimeOfDay>(
        context: context,
        builder: (_) => TimePickerDialog(
              initialTime: formControl.value ?? TimeOfDay.now(),
            ));

    if (result != null) {
      formControl.updateValue(result);
    }
  }
}
