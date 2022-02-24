import 'package:flutter/material.dart';
import 'package:habithouse_io/const.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

class ReactiveColorPicker<T> extends ReactiveFormField<T, Color> {
  ReactiveColorPicker({
    String? formControlName,
    FormControl<T>? formControl,
    InputDecoration? inputDecoration,
    Key? key,
  }) : super(
          formControl: formControl,
          formControlName: formControlName,
          builder: (field) {
            // ignore: prefer_function_declarations_over_variables
            final onTap = () {
              ColorPicker(
                color: field.value ?? Colors.transparent,
                onColorChanged: field.didChange,
                width: padding * 5,
                height: padding * 5,
                borderRadius: 4,
                spacing: 5,
                runSpacing: 5,
                wheelDiameter: 155,
                heading: Text(
                  'Select color',
                  style: Theme.of(field.context).textTheme.subtitle1,
                ),
                subheading: Text(
                  'Select color shade',
                  style: Theme.of(field.context).textTheme.subtitle1,
                ),
                wheelSubheading: Text(
                  'Selected color and its shades',
                  style: Theme.of(field.context).textTheme.subtitle1,
                ),
                showMaterialName: false,
                showColorName: false,
                showColorCode: false,
                copyPasteBehavior: const ColorPickerCopyPasteBehavior(
                  longPressMenu: true,
                ),
                materialNameTextStyle:
                    Theme.of(field.context).textTheme.caption,
                colorNameTextStyle: Theme.of(field.context).textTheme.caption,
                colorCodeTextStyle: Theme.of(field.context).textTheme.caption,
                pickersEnabled: const <ColorPickerType, bool>{
                  ColorPickerType.both: false,
                  ColorPickerType.primary: true,
                  ColorPickerType.accent: false,
                  ColorPickerType.bw: false,
                  ColorPickerType.custom: false,
                  ColorPickerType.wheel: false,
                },
              ).showPickerDialog(
                field.context,
                constraints: const BoxConstraints(
                  minHeight: 460,
                  minWidth: 300,
                  maxWidth: 320,
                ),
              );
            };

            return Listener(
              onPointerDown: (_) => field.control.markAsTouched(),
              child: ListTile(
                onTap: field.control.enabled ? onTap : null,
                contentPadding: EdgeInsets.zero,
                title: Text(inputDecoration?.labelText ?? 'Choose color'),
                trailing: Container(
                  width: padding * 5,
                  height: padding * 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(padding / 2),
                    color: field.value ?? Colors.transparent,
                  ),
                ),
                dense: true,
              ),
            );
          },
          key: key,
        );
}
