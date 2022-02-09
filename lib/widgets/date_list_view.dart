import 'package:flutter/material.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time/src/extensions.dart';

class DateListView extends HookConsumerWidget {
  const DateListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewDate = ref.watch(viewDateProvider);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      reverse: true,
      itemBuilder: (context, index) {
        final date = DateTime.now() - index.days;
        final isMatch = viewDate.isAtSameDayAs(date);

        return InkWell(
          onTap: () => ref.read(viewDateProvider.state).state = date,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              date.day.toString(),
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: isMatch ? Colors.red : Colors.amber),
            ),
          ),
        );
      },
    );
  }
}
