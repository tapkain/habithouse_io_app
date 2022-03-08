import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/const.dart';
import 'package:habithouse_io/models/models.dart';
import 'package:habithouse_io/service/service.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:habithouse_io/util.dart';
import 'package:habithouse_io/widgets/reactive_frequency_picker.dart';
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
      return editHabit == null
          ? Container()
          : buildView(context, editHabit, ref);
    }

    return buildView(context, null, ref);
  }

  Widget buildView(
    BuildContext context,
    Habit? editHabit,
    WidgetRef ref,
  ) {
    return CreateHabitFormBuilder(
      model: editHabit != null
          ? Mapper.makeHabitForm(editHabit)
          : CreateHabit(
              backgroundColor: getRandomColor(),
              emoji: getRandomEmoji(),
              repeatFrequency: everyDay,
            ),
      builder: (context, formModel, child) => ReactiveCreateHabitFormConsumer(
        builder: (context, formModel, child) => Scaffold(
          appBar: ModalAppBar(
            appBarColor: formModel.backgroundColorValue!,
            title: Text(
              editHabit == null ? 'New Routine' : 'Edit Routine',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            leading: TextButton(
              onPressed: () => GoRouter.of(context).pop(),
              child: Text(
                'Cancel',
                style: Theme.of(context)
                    .textTheme
                    .button!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            trailing: TextButton(
              onPressed: formModel.form.valid
                  ? () => submitForm(context, ref, formModel)
                  : null,
              child: Text(
                'Save',
                style: Theme.of(context).textTheme.button!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: formModel.form.valid
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).disabledColor,
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
              const SizedBox(height: padding),
              ReactiveColorPicker(
                formControl: formModel.backgroundColorControl,
              ),
              const Divider(),
              ReactiveEmojiPicker(
                formControl: formModel.emojiControl,
              ),
              const Divider(),
              ReactiveFrequencyPicker(
                formControl: formModel.repeatFrequencyControl,
              ),
              const Divider(),
              HabitReminderFormSection(
                formModel: formModel,
                remindersControl: formModel.remindersControl,
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
  }

  void submitForm(
    BuildContext context,
    WidgetRef ref,
    CreateHabitForm form,
  ) async {
    final habitsNotifier = ref.read(habitsProvider.notifier);

    if (editHabitId != null) {
      final editHabit = ref.read(habitByIdProvider(editHabitId!))!;
      habitsNotifier.putHabit(
        Mapper.mapHabitFormToHabit(editHabit, form),
      );
    } else {
      habitsNotifier.putHabit(
        Mapper.makeHabitFromHabitForm(form),
      );
    }

    GoRouter.of(context).pop();
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
              tiles: widget.formModel.remindersValue
                  .asMap()
                  .map((i, reminder) => MapEntry(
                      i,
                      ReactiveReminderPicker(
                        formControlName: i.toString(),
                      )))
                  .values,
            ).toList(),
            TextButton(
              onPressed: () => widget.formModel.addRemindersItem(
                const TimeOfDay(hour: 9, minute: 0),
              ),
              child: Text('Add reminder'),
            ),
          ]
        ],
      ),
    );
  }
}
