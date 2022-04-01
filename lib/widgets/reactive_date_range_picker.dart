import 'package:dartx/dartx.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habithouse_io/util.dart';
import 'package:reactive_forms/reactive_forms.dart';

DateTime _lastDate() => DateTime.now().add((365 * 3).days);

class ReactiveDateRangePicker
    extends ReactiveFormField<DateTimeRange, DateTimeRange> {
  ReactiveDateRangePicker({
    Key? key,
    String? formControlName,
    FormControl<DateTimeRange>? formControl,
    ValidationMessagesFunction<DateTimeRange>? validationMessages,
    ShowErrorsFunction? showErrors,
    InputDecoration? decoration,
    bool showClearIcon = true,
    Widget clearIcon = const Icon(Icons.clear),
    TextStyle? style,
    TransitionBuilder? builder,
    bool useRootNavigator = true,
    String? cancelText,
    String? confirmText,
    String? helpText,
    String? saveText,
    String? errorFormatText,
    String? errorInvalidText,
    String? errorInvalidRangeText,
    String? fieldStartHintText,
    String? fieldEndHintText,
    String? fieldStartLabelText,
    String? fieldEndLabelText,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? currentDate,
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
    Locale? locale,
    TextDirection? textDirection,
    RouteSettings? routeSettings,
  }) : super(
          key: key,
          formControl: formControl,
          formControlName: formControlName,
          validationMessages: validationMessages,
          showErrors: showErrors,
          builder: (field) {
            final endDate = field.value?.endDate;

            // ignore: prefer_function_declarations_over_variables
            final pickDateTimeRange = () async {
              final dateRange = await showDateRangePicker(
                context: field.context,
                currentDate: field.value!.start,
                firstDate: DateTime.now().date,
                lastDate: _lastDate(),
                initialDateRange: endDate != null ? field.value : null,
              );

              if (dateRange != null) {
                field.didChange(dateRange);
              }
            };

            if (endDate != null) {
              return ListTile(
                onTap: pickDateTimeRange,
                title: Row(
                  children: [
                    Text('Start'),
                    const Spacer(),
                    Text('End'),
                  ],
                ),
                subtitle: Row(
                  children: [
                    Text(DateFormatUtils.formatStartDate(field.value!.start)),
                    const Spacer(),
                    Text(DateFormatUtils.formatStartDate(field.value!.end)),
                  ],
                ),
              );
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () async {
                    final date = await showDatePicker(
                      context: field.context,
                      initialDate: field.value!.start,
                      firstDate: DateTime.now(),
                      lastDate: _lastDate(),
                    );

                    if (date != null) {
                      field.didChange(DateTimeRangeUtils.fromStart(date));
                    }
                  },
                  title: Text('Start date'),
                  trailing:
                      Text(DateFormatUtils.formatStartDate(field.value!.start)),
                ),
                const Divider(),
                ListTile(
                  onTap: pickDateTimeRange,
                  title: Text('End date'),
                  trailing: Text('No date'),
                ),
              ],
            );
          },
        );
}
