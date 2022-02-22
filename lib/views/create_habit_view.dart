import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/models/create_habit_form.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

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

  Widget buildView(Habit? editHabit, WidgetRef ref) => Scaffold(
        body: CreateHabitFormBuilder(
          model: CreateHabit(
            name: editHabit?.name ?? '',
          ),
          builder: (context, formModel, child) => ListView(
            children: [
              Text('Habit name'),
              ReactiveTextField<String>(
                formControl: formModel.nameControl,
                decoration: const InputDecoration(labelText: 'name'),
              ),
              ReactiveCreateHabitFormConsumer(
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
    CreateHabitForm form,
  ) async {
    final habitsNotifier = ref.read(habitsProvider.notifier);
    final editHabit = ref.read(habitByIdProvider(editHabitId!));

    if (editHabit != null) {
      habitsNotifier.putHabit(
        editHabit.copyWithCreateHabitForm(form),
      );
    } else {
      habitsNotifier.putHabit(
        Habit.fromCreateHabitForm(form),
      );
    }

    GoRouter.of(context).pop();
  }
}
