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

  final CreateHabit? createHabit;

  final FormGroup form;

  final String? path;

  String nameControlPath() => pathBuilder(nameControlName);
  String get nameValue => nameControl.value as String;
  bool get containsName {
    try {
      form.control(nameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get nameErrors => nameControl.errors;
  void get nameFocus => form.focus(nameControlPath());
  void nameValueUpdate(String value,
      {bool updateParent = true, bool emitEvent = true}) {
    nameControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void nameValuePatch(String value,
      {bool updateParent = true, bool emitEvent = true}) {
    nameControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void nameValueReset(String value,
          {bool updateParent = true,
          bool emitEvent = true,
          bool removeFocus = false,
          bool? disabled}) =>
      nameControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<String> get nameControl =>
      form.control(nameControlPath()) as FormControl<String>;
  CreateHabit get model => CreateHabit(name: nameValue);
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
