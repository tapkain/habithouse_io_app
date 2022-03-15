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
    this.editHabitExtra,
    this.editHabitId,
    this.habitTemplateId,
    Key? key,
  }) : super(key: key);

  final int? editHabitId;
  final int? habitTemplateId;
  final Habit? editHabitExtra;
  final int parentHabitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (editHabitId != null) {
      final editHabit = ref.watch(childHabitByIdProvider(editHabitId!));
      return editHabit == null ? Container() : buildView(editHabit, ref);
    }

    return buildView(null, ref);
  }

  Widget buildView(Habit? editHabit, WidgetRef ref) =>
      CreateChildHabitFormBuilder(
        model: editHabit != null
            ? Mapper.makeChildHabitForm(editHabit)
            : CreateChildHabit(),
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
                  style: context.textTheme().button!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: formModel.form.valid
                            ? getTextColorFor(
                                context.theme().colorScheme.primary)
                            : context.theme().disabledColor,
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
                ReactiveCreateChildHabitFormConsumer(
                  builder: (context, form, child) => ElevatedButton(
                    child: Text('Submit'),
                    onPressed: form.form.valid
                        ? () => submitForm(context, ref, form)
                        : null,
                  ),
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

    if (editHabitId != null) {
      final editHabit = ref.read(childHabitByIdProvider(editHabitId!))!;
      childHabitsNotifier.putHabit(
        Mapper.mapChildHabitFormToHabit(editHabit, form, parentHabitId),
      );
    } else {
      childHabitsNotifier.putHabit(
        Mapper.makeHabitFromChildHabitForm(form, parentHabitId),
      );
    }

    context.pop();
  }
}
