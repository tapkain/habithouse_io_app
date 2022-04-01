import 'package:dartx/dartx.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/const.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:habithouse_io/theme.dart';
import 'package:habithouse_io/util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../widgets/widgets.dart';

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
        backgroundColor: ColorUtils.randomColor(),
        dateTimeRange: DateTimeRangeUtils.now(),
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
        builder: (context, formModel, child) => FormThemeProvider(
          primary: formModel.backgroundColorValue,
          child: Scaffold(
            appBar: AppBar(
              title: Text(editHabitId == null ? 'New Routine' : 'Edit Routine'),
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.close),
              ),
              centerTitle: false,
              actions: [
                TextButton(
                  onPressed: formModel.form.valid
                      ? () => submit(context, ref, formModel)
                      : null,
                  child: Text('Save'.toUpperCase()),
                ),
              ],
            ),
            body: ListView(
              padding: const EdgeInsets.all(padding),
              children: [
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ReactiveTextField<String>(
                        autofocus: true,
                        keyboardAppearance: context.theme.brightness,
                        formControl: formModel.nameControl,
                        decoration:
                            const InputDecoration(hintText: 'Habit name'),
                      ),
                      ReactiveColorPicker(
                        formControl: formModel.backgroundColorControl,
                      ),
                      const Divider(),
                      ReactiveEmojiPicker(formControl: formModel.emojiControl),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ReactiveDateRangePicker(
                        formControl: formModel.dateTimeRangeControl,
                      ),
                      const Divider(),
                      ReactiveFrequencyPicker(
                        formControl: formModel.repeatDaysControl,
                      ),
                    ],
                  ),
                ),
                Card(
                  child: ReactiveRemindersPicker(
                    remindersControl: formModel.remindersControl,
                  ),
                ),
                const SizedBox(height: padding * 2),
                ElevatedButton(
                  onPressed: formModel.form.valid
                      ? () => submit(context, ref, formModel)
                      : null,
                  child: Text('Next'),
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

    final habitId = await habitsNotifier.putHabit(habit);

    if (editHabitId == null) {
      context.go('/habits/view/$habitId/templates');
    } else {
      context.pop();
    }
  }
}
