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

class CreateChildHabitView extends HookConsumerWidget {
  const CreateChildHabitView({
    required this.parentHabitId,
    this.editHabitId,
    this.editHabitExtra,
    Key? key,
  }) : super(key: key);

  final int? editHabitId;
  final int parentHabitId;
  final Habit? editHabitExtra;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (editHabitExtra != null) {
      return CreateChildHabitFormView(
        model: editHabitExtra!.toCreateChildHabitForm(),
        editHabitId: editHabitExtra!.id,
        parentHabitId: parentHabitId,
      );
    }

    if (editHabitId != null) {
      final editHabit = ref.watch(habitByIdProvider(editHabitId!));
      if (editHabit != null) {
        return CreateChildHabitFormView(
            model: editHabit.toCreateChildHabitForm(),
            editHabitId: editHabitId,
            parentHabitId: parentHabitId);
      }
    }

    return CreateChildHabitFormView(
      model: CreateChildHabit.initial(),
      parentHabitId: parentHabitId,
    );
  }
}

class CreateChildHabitFormView extends HookConsumerWidget {
  const CreateChildHabitFormView({
    required this.model,
    this.editHabitId,
    required this.parentHabitId,
    Key? key,
  }) : super(key: key);

  final CreateChildHabit model;
  final int? editHabitId;
  final int parentHabitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parentHabit = ref.watch(habitByIdProvider(parentHabitId))!;
    return CreateChildHabitFormBuilder(
      model: model,
      builder: (context, formModel, child) =>
          ReactiveCreateChildHabitFormConsumer(
        builder: (context, formModel, child) => FancyThemeProvider(
          applyFormTheming: true,
          primary: Color(parentHabit.backgroundColor),
          child: Scaffold(
            appBar: AppBar(
              title: Text(editHabitId == null ? 'New Habit' : 'Edit Habit'),
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
                      const Divider(),
                      ReactiveEmojiPicker(formControl: formModel.emojiControl),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ReactiveDateRangePicker(
                      //   formControl: formModel.dateTimeRangeControl,
                      // ),
                      // const Divider(),
                      // ReactiveFrequencyPicker(
                      //   formControl: formModel.repeatDaysControl,
                      // ),
                    ],
                  ),
                ),
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
    CreateChildHabitForm form,
  ) async {
    final habitsNotifier = ref.read(habitsProvider.notifier);
    var habit = form.toHabit(parentHabitId);

    if (editHabitId != null) {
      final editHabit = ref.read(habitByIdProvider(editHabitId!))!;
      habit = form.applyTo(editHabit, parentHabitId);
    }

    final habitId = await habitsNotifier.putHabit(habit);

    if (editHabitId == null) {
      context.go('/habits/view/$habitId/templates');
    } else {
      context.pop();
    }
  }
}
