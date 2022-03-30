import 'package:flutter/widgets.dart';
import 'dart:math';
import 'infinite_list_view.dart';

class SnappingListView extends StatefulWidget {
  final Axis scrollDirection;
  final ScrollController? controller;

  final IndexedWidgetBuilder itemBuilder;

  final double itemExtent;
  final void Function(int, int)? onItemChanged;

  final EdgeInsets padding;

  const SnappingListView({
    this.scrollDirection = Axis.vertical,
    this.controller,
    required this.itemExtent,
    required this.itemBuilder,
    this.onItemChanged,
    this.padding = const EdgeInsets.all(0.0),
    Key? key,
  })  : assert(itemExtent > 0),
        super(key: key);

  @override
  _SnappingListViewState createState() => _SnappingListViewState();
}

class _SnappingListViewState extends State<SnappingListView> {
  var lastItem = 0;

  @override
  void didUpdateWidget(covariant SnappingListView oldWidget) {
    if (lastItem != 0) {
      lastItem = 0;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final startPadding = widget.scrollDirection == Axis.horizontal
        ? widget.padding.left
        : widget.padding.top;
    final scrollPhysics = SnappingListScrollPhysics(
      mainAxisStartPadding: startPadding,
      itemExtent: widget.itemExtent,
    );

    // ignore: prefer_function_declarations_over_variables
    final sizedItemBuilder = (BuildContext context, int index) {
      return SizedBox(
        width: widget.scrollDirection == Axis.horizontal
            ? widget.itemExtent
            : null,
        height:
            widget.scrollDirection == Axis.vertical ? widget.itemExtent : null,
        child: widget.itemBuilder(context, index),
      );
    };

    return NotificationListener<ScrollNotification>(
      onNotification: ((notification) {
        if (notification.depth == 0 &&
            widget.onItemChanged != null &&
            notification is ScrollUpdateNotification) {
          final currItem =
              (notification.metrics.pixels - startPadding) ~/ widget.itemExtent;
          if (currItem != lastItem) {
            widget.onItemChanged?.call(lastItem, currItem);
            lastItem = currItem;
          }
        }
        return false;
      }),
      child: InfiniteListView(
        itemBuilder: sizedItemBuilder,
        physics: scrollPhysics,
        controller: widget.controller,
        scrollDirection: widget.scrollDirection,
      ),
    );
  }
}

class SnappingListScrollPhysics extends ScrollPhysics {
  final double mainAxisStartPadding;
  final double itemExtent;

  const SnappingListScrollPhysics({
    ScrollPhysics? parent,
    this.mainAxisStartPadding = 0.0,
    required this.itemExtent,
  }) : super(parent: parent);

  @override
  SnappingListScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return SnappingListScrollPhysics(
      parent: buildParent(ancestor),
      mainAxisStartPadding: mainAxisStartPadding,
      itemExtent: itemExtent,
    );
  }

  double _getItem(ScrollMetrics position) {
    return (position.pixels - mainAxisStartPadding) / itemExtent;
  }

  double _getPixels(ScrollMetrics position, double item) {
    return min(item * itemExtent, position.maxScrollExtent);
  }

  double _getTargetPixels(
    ScrollMetrics position,
    Tolerance tolerance,
    double velocity,
  ) {
    double item = _getItem(position);
    if (velocity < -tolerance.velocity) {
      item -= 0.5;
    } else if (velocity > tolerance.velocity) {
      item += 0.5;
    }
    return _getPixels(position, item.roundToDouble());
  }

  @override
  Simulation? createBallisticSimulation(
    ScrollMetrics position,
    double velocity,
  ) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }
    final Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels) {
      return ScrollSpringSimulation(
        spring,
        position.pixels,
        target,
        velocity,
        tolerance: tolerance,
      );
    }
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}
