import 'package:flutter/material.dart';
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
            // ignore: prefer_function_declarations_over_variables
            final onTap = () {
              showModalBottomSheet(
                  context: field.context,
                  builder: (context) => EmojiPicker(
                        config: const Config(
                          initCategory: Category.ACTIVITIES,
                          showRecentsTab: false,
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
                contentPadding: EdgeInsets.zero,
                dense: true,
                title: Text(inputDecoration?.labelText ?? 'Choose icon'),
                trailing: Text(
                  field.value?.emoji ?? '🎯',
                  style: Theme.of(field.context).textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
          key: key,
        );
}