// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_habit_form.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveCreateHabitFormConsumer extends StatelessWidget {
  const ReactiveCreateHabitFormConsumer(
      {Key? key, required this.builder, this.child})
      : super(key: key);

  final Widget? child;

  final Widget Function(
      BuildContext context, CreateHabitForm formModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveCreateHabitForm.of(context);

    if (formModel is! CreateHabitForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class CreateHabitFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const CreateHabitFormInheritedStreamer(
      {Key? key,
      required this.form,
      required Stream<dynamic> stream,
      required Widget child})
      : super(stream, child, key: key);

  final CreateHabitForm form;
}

class ReactiveCreateHabitForm extends StatelessWidget {
  const ReactiveCreateHabitForm(
      {Key? key, required this.form, required this.child, this.onWillPop})
      : super(key: key);

  final Widget child;

  final CreateHabitForm form;

  final WillPopCallback? onWillPop;

  static CreateHabitForm? of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              CreateHabitFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        CreateHabitFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as CreateHabitFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return CreateHabitFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class CreateHabitFormBuilder extends StatefulWidget {
  const CreateHabitFormBuilder(
      {Key? key, this.model, this.child, this.onWillPop, required this.builder})
      : super(key: key);

  final CreateHabit? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
      BuildContext context, CreateHabitForm formModel, Widget? child) builder;

  @override
  _CreateHabitFormBuilderState createState() => _CreateHabitFormBuilderState();
}

class _CreateHabitFormBuilderState extends State<CreateHabitFormBuilder> {
  late FormGroup _form;

  late CreateHabitForm _formModel;

  @override
  void initState() {
    _form = FormGroup({});
    _formModel = CreateHabitForm(widget.model, _form, null);

    _form.addAll(_formModel.formElements().controls);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveCreateHabitForm(
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveForm(
        formGroup: _form,
        onWillPop: widget.onWillPop,
        child: widget.builder(context, _formModel, widget.child),
      ),
    );
  }
}

class CreateHabitForm implements FormModel<CreateHabit> {
  CreateHabitForm(this.createHabit, this.form, this.path) {}

  static String nameControlName = "name";

  static String emojiControlName = "emoji";

  static String backgroundColorControlName = "backgroundColor";

  static String repeatFrequencyControlName = "repeatFrequency";

  static String remindersControlName = "reminders";

  static String startDateControlName = "startDate";

  static String endDateControlName = "endDate";

  final CreateHabit? createHabit;

  final FormGroup form;

  final String? path;

  String nameControlPath() => pathBuilder(nameControlName);
  String emojiControlPath() => pathBuilder(emojiControlName);
  String backgroundColorControlPath() =>
      pathBuilder(backgroundColorControlName);
  String repeatFrequencyControlPath() =>
      pathBuilder(repeatFrequencyControlName);
  String startDateControlPath() => pathBuilder(startDateControlName);
  String endDateControlPath() => pathBuilder(endDateControlName);
  String remindersControlPath() => pathBuilder(remindersControlName);
  String get nameValue => nameControl.value as String;
  Emoji? get emojiValue => emojiControl?.value;
  Color? get backgroundColorValue => backgroundColorControl?.value;
  List<int> get repeatFrequencyValue =>
      repeatFrequencyControl.value as List<int>;
  DateTime? get startDateValue => startDateControl?.value;
  DateTime? get endDateValue => endDateControl?.value;
  List<TimeOfDay> get remindersValue =>
      remindersControl.value?.whereType<TimeOfDay>().toList() ?? [];
  bool get containsName {
    try {
      form.control(nameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsEmoji {
    try {
      form.control(emojiControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsBackgroundColor {
    try {
      form.control(backgroundColorControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsRepeatFrequency {
    try {
      form.control(repeatFrequencyControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsStartDate {
    try {
      form.control(startDateControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsEndDate {
    try {
      form.control(endDateControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsReminders {
    try {
      form.control(remindersControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get nameErrors => nameControl.errors;
  Object? get emojiErrors => emojiControl?.errors;
  Object? get backgroundColorErrors => backgroundColorControl?.errors;
  Object? get repeatFrequencyErrors => repeatFrequencyControl.errors;
  Object? get startDateErrors => startDateControl?.errors;
  Object? get endDateErrors => endDateControl?.errors;
  Object? get remindersErrors => remindersControl.errors;
  void get nameFocus => form.focus(nameControlPath());
  void get emojiFocus => form.focus(emojiControlPath());
  void get backgroundColorFocus => form.focus(backgroundColorControlPath());
  void get repeatFrequencyFocus => form.focus(repeatFrequencyControlPath());
  void get startDateFocus => form.focus(startDateControlPath());
  void get endDateFocus => form.focus(endDateControlPath());
  void get remindersFocus => form.focus(remindersControlPath());
  void emojiRemove({bool updateParent = true, bool emitEvent = true}) {
    if (containsEmoji) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          emojiControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            emojiControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void backgroundColorRemove(
      {bool updateParent = true, bool emitEvent = true}) {
    if (containsBackgroundColor) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          backgroundColorControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            backgroundColorControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void startDateRemove({bool updateParent = true, bool emitEvent = true}) {
    if (containsStartDate) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          startDateControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            startDateControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void endDateRemove({bool updateParent = true, bool emitEvent = true}) {
    if (containsEndDate) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          endDateControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            endDateControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void nameValueUpdate(String value,
      {bool updateParent = true, bool emitEvent = true}) {
    nameControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void emojiValueUpdate(Emoji? value,
      {bool updateParent = true, bool emitEvent = true}) {
    emojiControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void backgroundColorValueUpdate(Color? value,
      {bool updateParent = true, bool emitEvent = true}) {
    backgroundColorControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void repeatFrequencyValueUpdate(List<int> value,
      {bool updateParent = true, bool emitEvent = true}) {
    repeatFrequencyControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void startDateValueUpdate(DateTime? value,
      {bool updateParent = true, bool emitEvent = true}) {
    startDateControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void endDateValueUpdate(DateTime? value,
      {bool updateParent = true, bool emitEvent = true}) {
    endDateControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void remindersValueUpdate(List<TimeOfDay> value,
      {bool updateParent = true, bool emitEvent = true}) {
    remindersControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void nameValuePatch(String value,
      {bool updateParent = true, bool emitEvent = true}) {
    nameControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void emojiValuePatch(Emoji? value,
      {bool updateParent = true, bool emitEvent = true}) {
    emojiControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void backgroundColorValuePatch(Color? value,
      {bool updateParent = true, bool emitEvent = true}) {
    backgroundColorControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void repeatFrequencyValuePatch(List<int> value,
      {bool updateParent = true, bool emitEvent = true}) {
    repeatFrequencyControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void startDateValuePatch(DateTime? value,
      {bool updateParent = true, bool emitEvent = true}) {
    startDateControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void endDateValuePatch(DateTime? value,
      {bool updateParent = true, bool emitEvent = true}) {
    endDateControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void remindersValuePatch(List<TimeOfDay> value,
      {bool updateParent = true, bool emitEvent = true}) {
    remindersControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void nameValueReset(String value,
          {bool updateParent = true,
          bool emitEvent = true,
          bool removeFocus = false,
          bool? disabled}) =>
      nameControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void emojiValueReset(Emoji? value,
          {bool updateParent = true,
          bool emitEvent = true,
          bool removeFocus = false,
          bool? disabled}) =>
      emojiControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void backgroundColorValueReset(Color? value,
          {bool updateParent = true,
          bool emitEvent = true,
          bool removeFocus = false,
          bool? disabled}) =>
      backgroundColorControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void repeatFrequencyValueReset(List<int> value,
          {bool updateParent = true,
          bool emitEvent = true,
          bool removeFocus = false,
          bool? disabled}) =>
      repeatFrequencyControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void startDateValueReset(DateTime? value,
          {bool updateParent = true,
          bool emitEvent = true,
          bool removeFocus = false,
          bool? disabled}) =>
      startDateControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void endDateValueReset(DateTime? value,
          {bool updateParent = true,
          bool emitEvent = true,
          bool removeFocus = false,
          bool? disabled}) =>
      endDateControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void remindersValueReset(List<TimeOfDay> value,
          {bool updateParent = true,
          bool emitEvent = true,
          bool removeFocus = false,
          bool? disabled}) =>
      remindersControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<String> get nameControl =>
      form.control(nameControlPath()) as FormControl<String>;
  FormControl<Emoji>? get emojiControl => containsEmoji
      ? form.control(emojiControlPath()) as FormControl<Emoji>?
      : null;
  FormControl<Color>? get backgroundColorControl => containsBackgroundColor
      ? form.control(backgroundColorControlPath()) as FormControl<Color>?
      : null;
  FormControl<List<int>> get repeatFrequencyControl =>
      form.control(repeatFrequencyControlPath()) as FormControl<List<int>>;
  FormControl<DateTime>? get startDateControl => containsStartDate
      ? form.control(startDateControlPath()) as FormControl<DateTime>?
      : null;
  FormControl<DateTime>? get endDateControl => containsEndDate
      ? form.control(endDateControlPath()) as FormControl<DateTime>?
      : null;
  FormArray<TimeOfDay> get remindersControl =>
      form.control(remindersControlPath()) as FormArray<TimeOfDay>;
  void addRemindersItem(TimeOfDay value,
      {List<AsyncValidatorFunction>? asyncValidators,
      List<ValidatorFunction>? validators,
      int? asyncValidatorsDebounceTime,
      bool? disabled,
      ValidatorsApplyMode validatorsApplyMode = ValidatorsApplyMode.merge}) {
    List<ValidatorFunction> resultingValidators = [];
    List<AsyncValidatorFunction> resultingAsyncValidators = [];

    switch (validatorsApplyMode) {
      case ValidatorsApplyMode.merge:
        if (validators != null) resultingValidators.addAll(validators);
        if (asyncValidators != null)
          resultingAsyncValidators.addAll(asyncValidators);
        break;
      case ValidatorsApplyMode.override:
        if (validators != null) resultingValidators = validators;

        if (asyncValidators != null) resultingAsyncValidators = asyncValidators;
        break;
    }

    remindersControl.add(FormControl<TimeOfDay>(
      value: value,
      validators: resultingValidators,
      asyncValidators: resultingAsyncValidators,
      asyncValidatorsDebounceTime: asyncValidatorsDebounceTime ?? 250,
      disabled: disabled ?? false,
    ));
  }

  CreateHabit get model => CreateHabit(
      name: nameValue,
      emoji: emojiValue,
      backgroundColor: backgroundColorValue,
      repeatFrequency: repeatFrequencyValue,
      reminders: remindersValue,
      startDate: startDateValue,
      endDate: endDateValue);
  void updateValue(CreateHabit value,
          {bool updateParent = true, bool emitEvent = true}) =>
      form.updateValue(
          CreateHabitForm(value, FormGroup({}), null).formElements().rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  void resetValue(CreateHabit value,
          {bool updateParent = true, bool emitEvent = true}) =>
      form.reset(
          value: CreateHabitForm(value, FormGroup({}), null)
              .formElements()
              .rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  void reset({bool updateParent = true, bool emitEvent = true}) => form.reset(
      value: this.formElements().rawValue,
      updateParent: updateParent,
      emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  FormGroup formElements() => FormGroup({
        nameControlName: FormControl<String>(
            value: createHabit?.name,
            validators: [requiredValidator],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        emojiControlName: FormControl<Emoji>(
            value: createHabit?.emoji,
            validators: [emojiValidator, maxEmojiLengthValidator],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        backgroundColorControlName: FormControl<Color>(
            value: createHabit?.backgroundColor,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        repeatFrequencyControlName: FormControl<List<int>>(
            value: createHabit?.repeatFrequency,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        remindersControlName: FormArray<TimeOfDay>(
            createHabit?.reminders
                    .map((e) => FormControl<TimeOfDay>(
                          value: e,
                          validators: [],
                          asyncValidators: [],
                          asyncValidatorsDebounceTime: 250,
                          disabled: false,
                        ))
                    .toList() ??
                [],
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false),
        startDateControlName: FormControl<DateTime>(
            value: createHabit?.startDate,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        endDateControlName: FormControl<DateTime>(
            value: createHabit?.endDate,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}
