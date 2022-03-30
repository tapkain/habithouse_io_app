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
      if (editHabit != null) {
        return CreateHabitFormView(
          model: editHabit.toCreateHabitForm(),
          editHabitId: editHabitId,
        );
      }
    }

    return CreateHabitFormView(
      model: CreateHabit(
        backgroundColor: randomColor(),
        startDate: DateTime.now(),
      ),
    );
  }
}

class CreateHabitFormView extends HookConsumerWidget {
  const CreateHabitFormView({
    required this.model,
    this.editHabitId,
    Key? key,
  }) : super(key: key);

  final CreateHabit model;
  final int? editHabitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CreateHabitFormBuilder(
      model: model,
      builder: (context, formModel, child) => ReactiveCreateHabitFormConsumer(
        builder: (context, formModel, child) => Scaffold(
          appBar: ModalAppBar(
            appBarColor: formModel.backgroundColorValue,
            title: Text(editHabitId == null ? 'New Routine' : 'Edit Routine'),
            leading: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Cancel'),
            ),
            trailing: TextButton(
              onPressed: formModel.form.valid
                  ? () => submit(context, ref, formModel)
                  : null,
              child: Text(
                'Save',
                style: context.textTheme.button!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: formModel.form.valid
                      ? formModel.backgroundColorValue.textColor
                      : context.theme.disabledColor,
                ),
              ),
            ),
          ),
          body: Theme(
            data: context.theme.copyWith(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: formModel.backgroundColorValue),
              primaryColor: formModel.backgroundColorValue,
              appBarTheme: AppBarTheme(color: formModel.backgroundColorValue),
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
                          trailing:
                              Text(DateFormat().formatStartDate(picker.value!)),
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
                ReactiveRemindersPicker(
                  remindersControl: formModel.remindersControl,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submit(
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
}
