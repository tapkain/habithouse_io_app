import 'package:flutter/material.dart';
import 'package:habithouse_io/util.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class ReactiveEmojiPicker<T> extends ReactiveFormField<T, Emoji> {
  ReactiveEmojiPicker({
    String? formControlName,
    FormControl<T>? formControl,
    InputDecoration? inputDecoration,
    Key? key,
  }) : super(
          formControlName: formControlName,
          formControl: formControl,
          builder: (field) {
            final primaryColor = field.context.theme.colorScheme.primary;

            // ignore: prefer_function_declarations_over_variables
            final onTap = () {
              showModalBottomSheet(
                  context: field.context,
                  builder: (context) => EmojiPicker(
                        config: Config(
                          bgColor: context.theme.colorScheme.background,
                          indicatorColor: primaryColor,
                          iconColorSelected: primaryColor,
                          progressIndicatorColor: primaryColor,
                          backspaceColor: primaryColor,
                          initCategory: Category.ACTIVITIES,
                          showRecentsTab: false,
                          enableSkinTones: true,
                        ),
                        onEmojiSelected: (_, emoji) {
                          field.didChange(emoji);
                          Navigator.of(field.context).pop();
                        },
                      ));
            };
            return Listener(
              onPointerDown: (_) => field.control.markAsTouched(),
              child: ListTile(
                onTap: field.control.enabled ? onTap : null,
                title: Text(inputDecoration?.labelText ?? 'Choose icon'),
                trailing: RepaintBoundary(
                  child: Text(
                    field.value?.emoji ?? '🎯',
                    style: Theme.of(field.context).textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
          key: key,
        );
}
