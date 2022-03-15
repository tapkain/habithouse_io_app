import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:habithouse_io/const.dart';
import 'package:habithouse_io/state/habits_notifier.dart';
import 'package:habithouse_io/util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:time/src/extensions.dart';

class DateListView extends HookConsumerWidget implements PreferredSizeWidget {
  const DateListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewDate = ref.watch(viewDateProvider);
    return _DateCustomList(viewDate: viewDate);
  }

  @override
  Size get preferredSize => const Size.fromHeight(padding * 6);
}

class _DateCustomList extends StatefulWidget {
  const _DateCustomList({
    required this.viewDate,
    Key? key,
  }) : super(key: key);

  final DateTime viewDate;

  @override
  State<_DateCustomList> createState() => _DateCustomListState();
}

class _DateCustomListState extends State<_DateCustomList> {
  final scrollController = ScrollController(initialScrollOffset: -padding);

  var leftArrowOpacity = 0.0;
  var rightArrowOpacity = 0.0;

  void setLeftArrowOpacity(double opacity) {
    if (leftArrowOpacity == opacity) {
      return;
    }

    setState(() {
      leftArrowOpacity = opacity;
    });
  }

  void setRightArrowOpacity(double opacity) {
    if (rightArrowOpacity == opacity) {
      return;
    }

    setState(() {
      rightArrowOpacity = opacity;
    });
  }

  @override
  void initState() {
    scrollController.addListener(() {
      // TODO: hardcoded const, checked on iphone 7 plus
      const lowerBound = -400;
      const upperBound = 70;

      if (scrollController.offset < lowerBound) {
        setRightArrowOpacity(1.0);
      } else {
        setRightArrowOpacity(0.0);
      }

      if (scrollController.offset > upperBound) {
        setLeftArrowOpacity(1.0);
      } else {
        setLeftArrowOpacity(0.0);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildListSection(context);
  }

  Widget _buildListSection(BuildContext context) => Stack(
        children: [
          _buildList(),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: padding),
              child: _buildArrowButton(
                leftArrowOpacity,
                Icon(
                  Icons.chevron_left,
                  color: context.theme().colorScheme.onSecondary,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: padding),
              child: _buildArrowButton(
                rightArrowOpacity,
                Icon(
                  Icons.chevron_right,
                  color: context.theme().colorScheme.onSecondary,
                ),
              ),
            ),
          ),
        ],
      );

  Widget _buildArrowButton(double opacity, Icon icon) => AnimatedOpacity(
        opacity: opacity,
        duration: 300.milliseconds,
        child: IgnorePointer(
          ignoring: opacity == 0.0,
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () => scrollController.animateTo(
              scrollController.initialScrollOffset,
              duration: 300.milliseconds,
              curve: Curves.easeIn,
            ),
            child: Container(
              height: padding * 5,
              width: padding * 5,
              decoration: BoxDecoration(
                color: context.theme().colorScheme.secondary,
                borderRadius: BorderRadius.circular(padding * 2.5),
              ),
              child: icon,
            ),
          ),
        ),
      );

  Widget _buildList() => CustomScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        center: const ValueKey('center'),
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final date = DateTime.now() - index.days - 1.days;
              return _DateListItem(
                date: date,
                isToday: widget.viewDate.isAtSameDayAs(date),
              );
            }),
          ),
          SliverToBoxAdapter(
            key: const ValueKey('center'),
            child: _DateListItem(
              date: DateTime.now(),
              isNow: true,
              isToday: widget.viewDate.isAtSameDayAs(DateTime.now()),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final date = DateTime.now() + index.days + 1.days;
              return _DateListItem(
                date: date,
                isToday: widget.viewDate.isAtSameDayAs(date),
              );
            }),
          ),
        ],
      );
}

class _DateListItem extends HookConsumerWidget {
  const _DateListItem({
    required this.date,
    required this.isToday,
    this.isNow = false,
    Key? key,
  }) : super(key: key);

  final DateTime date;
  final bool isToday;
  final bool isNow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: padding * 6,
      padding: isToday ? const EdgeInsets.all(1) : EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(padding),
        color: isToday
            ? context.theme().colorScheme.secondary
            : isNow
                ? context.theme().splashColor
                : context.theme().colorScheme.background,
      ),
      child: InkWell(
        onTap: () => ref.read(viewDateProvider.state).state = date.date,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              DateFormat('EEE').format(date),
              style: context.textTheme().subtitle2!.copyWith(
                    color: isToday
                        ? context.theme().colorScheme.onSecondary
                        : null,
                  ),
            ),
            Text(
              date.day.toString(),
              style: context.textTheme().subtitle1!.copyWith(
                    color: isToday
                        ? context.theme().colorScheme.onSecondary
                        : context.theme().colorScheme.secondary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
