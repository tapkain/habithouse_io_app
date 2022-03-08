import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:habithouse_io/state/select_child_habits_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CreateChildHabitView extends HookConsumerWidget {
  const CreateChildHabitView({
    required this.parentHabitId,
    this.editHabitId,
    Key? key,
  }) : super(key: key);

  final int? editHabitId;
  final int parentHabitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (editHabitId != null) {
      final editHabit = ref.watch(habitByIdProvider(editHabitId!));
      return editHabit == null ? Container() : buildView(editHabit, ref);
    }

    return buildView(null, ref);
  }

  Widget buildView(Habit? editHabit, WidgetRef ref) => Scaffold(
        body: CreateChildHabitFormBuilder(
          model: CreateChildHabit(
            name: editHabit?.name ?? '',
          ),
          builder: (context, formModel, child) => ListView(
            children: [
              Text('Habit name'),
              ReactiveTextField<String>(
                formControl: formModel.nameControl,
                decoration: const InputDecoration(labelText: 'name'),
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
      final editHabit = ref.read(habitByIdProvider(editHabitId!))!;
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
