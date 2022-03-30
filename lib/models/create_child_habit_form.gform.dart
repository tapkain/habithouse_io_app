// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_child_habit_form.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveCreateChildHabitFormConsumer extends StatelessWidget {
  const ReactiveCreateChildHabitFormConsumer(
      {Key? key, required this.builder, this.child})
      : super(key: key);

  final Widget? child;

  final Widget Function(
          BuildContext context, CreateChildHabitForm formModel, Widget? child)
      builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveCreateChildHabitForm.of(context);

    if (formModel is! CreateChildHabitForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class CreateChildHabitFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const CreateChildHabitFormInheritedStreamer(
      {Key? key,
      required this.form,
      required Stream<dynamic> stream,
      required Widget child})
      : super(stream, child, key: key);

  final CreateChildHabitForm form;
}

class ReactiveCreateChildHabitForm extends StatelessWidget {
  const ReactiveCreateChildHabitForm(
      {Key? key, required this.form, required this.child, this.onWillPop})
      : super(key: key);

  final Widget child;

  final CreateChildHabitForm form;

  final WillPopCallback? onWillPop;

  static CreateChildHabitForm? of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              CreateChildHabitFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        CreateChildHabitFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as CreateChildHabitFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return CreateChildHabitFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class CreateChildHabitFormBuilder extends StatefulWidget {
  const CreateChildHabitFormBuilder(
      {Key? key, this.model, this.child, this.onWillPop, required this.builder})
      : super(key: key);

  final CreateChildHabit? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
          BuildContext context, CreateChildHabitForm formModel, Widget? child)
      builder;

  @override
  _CreateChildHabitFormBuilderState createState() =>
      _CreateChildHabitFormBuilderState();
}

class _CreateChildHabitFormBuilderState
    extends State<CreateChildHabitFormBuilder> {
  late FormGroup _form;

  late CreateChildHabitForm _formModel;

  @override
  void initState() {
    _form = FormGroup({});
    _formModel = CreateChildHabitForm(widget.model, _form, null);

    _form.addAll(_formModel.formElements().controls);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveCreateChildHabitForm(
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

class CreateChildHabitForm implements FormModel<CreateChildHabit> {
  CreateChildHabitForm(this.createChildHabit, this.form, this.path) {}

  static String nameControlName = "name";

  static String emojiControlName = "emoji";

  static String descriptionControlName = "description";

  static String durationSecondsControlName = "durationSeconds";

  final CreateChildHabit? createChildHabit;

  final FormGroup form;

  final String? path;

  String nameControlPath() => pathBuilder(nameControlName);
  String emojiControlPath() => pathBuilder(emojiControlName);
  String descriptionControlPath() => pathBuilder(descriptionControlName);
  String durationSecondsControlPath() =>
      pathBuilder(durationSecondsControlName);
  String get nameValue => nameControl.value as String;
  Emoji get emojiValue => emojiControl.value as Emoji;
  String get descriptionValue => descriptionControl.value as String;
  int? get durationSecondsValue => durationSecondsControl?.value;
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

  bool get containsDescription {
    try {
      form.control(descriptionControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsDurationSeconds {
    try {
      form.control(durationSecondsControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get nameErrors => nameControl.errors;
  Object? get emojiErrors => emojiControl.errors;
  Object? get descriptionErrors => descriptionControl.errors;
  Object? get durationSecondsErrors => durationSecondsControl?.errors;
  void get nameFocus => form.focus(nameControlPath());
  void get emojiFocus => form.focus(emojiControlPath());
  void get descriptionFocus => form.focus(descriptionControlPath());
  void get durationSecondsFocus => form.focus(durationSecondsControlPath());
  void durationSecondsRemove(
      {bool updateParent = true, bool emitEvent = true}) {
    if (containsDurationSeconds) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          durationSecondsControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            durationSecondsControlName,
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

  void emojiValueUpdate(Emoji value,
      {bool updateParent = true, bool emitEvent = true}) {
    emojiControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void descriptionValueUpdate(String value,
      {bool updateParent = true, bool emitEvent = true}) {
    descriptionControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void durationSecondsValueUpdate(int? value,
      {bool updateParent = true, bool emitEvent = true}) {
    durationSecondsControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void nameValuePatch(String value,
      {bool updateParent = true, bool emitEvent = true}) {
    nameControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void emojiValuePatch(Emoji value,
      {bool updateParent = true, bool emitEvent = true}) {
    emojiControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void descriptionValuePatch(String value,
      {bool updateParent = true, bool emitEvent = true}) {
    descriptionControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void durationSecondsValuePatch(int? value,
      {bool updateParent = true, bool emitEvent = true}) {
    durationSecondsControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void nameValueReset(String value,
          {bool updateParent = true,
          bool emitEvent = true,
          bool removeFocus = false,
          bool? disabled}) =>
      nameControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void emojiValueReset(Emoji value,
          {bool updateParent = true,
          bool emitEvent = true,
          bool removeFocus = false,
          bool? disabled}) =>
      emojiControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void descriptionValueReset(String value,
          {bool updateParent = true,
          bool emitEvent = true,
          bool removeFocus = false,
          bool? disabled}) =>
      descriptionControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void durationSecondsValueReset(int? value,
          {bool updateParent = true,
          bool emitEvent = true,
          bool removeFocus = false,
          bool? disabled}) =>
      durationSecondsControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<String> get nameControl =>
      form.control(nameControlPath()) as FormControl<String>;
  FormControl<Emoji> get emojiControl =>
      form.control(emojiControlPath()) as FormControl<Emoji>;
  FormControl<String> get descriptionControl =>
      form.control(descriptionControlPath()) as FormControl<String>;
  FormControl<int>? get durationSecondsControl => containsDurationSeconds
      ? form.control(durationSecondsControlPath()) as FormControl<int>?
      : null;
  CreateChildHabit get model => CreateChildHabit(
      name: nameValue,
      emoji: emojiValue,
      description: descriptionValue,
      durationSeconds: durationSecondsValue);
  void updateValue(CreateChildHabit value,
          {bool updateParent = true, bool emitEvent = true}) =>
      form.updateValue(
          CreateChildHabitForm(value, FormGroup({}), null)
              .formElements()
              .rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  void resetValue(CreateChildHabit value,
          {bool updateParent = true, bool emitEvent = true}) =>
      form.reset(
          value: CreateChildHabitForm(value, FormGroup({}), null)
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
            value: createChildHabit?.name,
            validators: [habitNameValidator],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        emojiControlName: FormControl<Emoji>(
            value: createChildHabit?.emoji,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        descriptionControlName: FormControl<String>(
            value: createChildHabit?.description,
            validators: [habitDescriptionValidator],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        durationSecondsControlName: FormControl<int>(
            value: createChildHabit?.durationSeconds,
            validators: [habitDurationValidator],
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
