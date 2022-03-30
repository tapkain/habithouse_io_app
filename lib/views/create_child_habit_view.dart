import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/const.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/state/child_habits_notifier.dart';
import 'package:habithouse_io/state/select_child_habits_notifier.dart';
import 'package:habithouse_io/util.dart';
import 'package:habithouse_io/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CreateChildHabitView extends HookConsumerWidget {
  const CreateChildHabitView({
    required this.parentHabitId,
    this.editHabitId,
    this.editHabitExtra,
    Key? key,
  }) : super(key: key);

  final int? editHabitId;
  final Habit? editHabitExtra;
  final int parentHabitId;

  Habit? editHabit(WidgetRef ref) {
    if (editHabitExtra != null) {
      return editHabitExtra;
    }

    if (editHabitId != null) {
      return ref.watch(childHabitByIdProvider(editHabitId!));
    }

    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habit = editHabit(ref);
    return buildView(habit, ref);
  }

  Widget buildView(Habit? editHabit, WidgetRef ref) =>
      CreateChildHabitFormBuilder(
        model: editHabit?.toCreateChildHabitForm() ?? CreateChildHabit(),
        builder: (context, formModel, child) =>
            ReactiveCreateChildHabitFormConsumer(
          builder: (context, formModel, child) => Scaffold(
            appBar: ModalAppBar(
              title: Text(editHabit == null ? 'New Habit' : 'Edit Habit'),
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
                  style: context.textTheme.button!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: formModel.form.valid
                        ? context.theme.colorScheme.primary.textColor
                        : context.theme.disabledColor,
                  ),
                ),
              ),
            ),
            body: ListView(
              padding: const EdgeInsets.all(padding * 2),
              children: [
                ReactiveTextField<String>(
                  autofocus: true,
                  formControl: formModel.nameControl,
                  decoration: const InputDecoration(labelText: 'Habit name'),
                ),
                const Divider(),
                ReactiveEmojiPicker(
                  formControl: formModel.emojiControl,
                ),
                const Divider(),
                ReactiveTextField<int>(
                  keyboardType: TextInputType.number,
                  formControl: formModel.durationSecondsControl,
                  decoration: InputDecoration(
                    labelText: 'Duration',
                    labelStyle: context.textTheme.button,
                  ),
                ),
                ElevatedButton(
                  child: Text('Submit'),
                  onPressed: formModel.form.valid
                      ? () => submitForm(context, ref, formModel)
                      : null,
                ),
              ],
            ),
          ),
        ),
      );

  void submitForm(
    BuildContext context,
    WidgetRef ref,
    CreateChildHabitForm form,
  ) async {
    final childHabitsNotifier = ref.read(
      selectChildHabitsProvider(parentHabitId).notifier,
    );
    var habit = form.toHabit(parentHabitId);

    if (editHabitId != null) {
      final editHabit = ref.read(childHabitByIdProvider(editHabitId!))!;
      habit = form.applyTo(editHabit, parentHabitId);
    }

    childHabitsNotifier.putHabit(habit);
    context.pop();
  }
}
