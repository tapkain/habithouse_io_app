import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/models/create_habit_form.dart';
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
      return editHabit.when(
        data: (data) => buildView(data, ref),
        error: (_, __) => Container(),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      );
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
                      ? () {
                          final habit = editHabit ?? Habit();
                          ref
                              .read(
                                selectChildHabitsProvider(parentHabitId)
                                    .notifier,
                              )
                              .putHabit(habit..name = form.nameValue);
                          GoRouter.of(context).pop();
                        }
                      : null,
                ),
              ),
            ],
          ),
        ),
      );
}
