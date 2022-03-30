import 'package:flutter/widgets.dart';

class InfiniteListView extends StatelessWidget {
  const InfiniteListView({
    this.scrollDirection = Axis.vertical,
    this.controller,
    required this.itemBuilder,
    this.physics,
    this.padding = const EdgeInsets.all(0.0),
    Key? key,
  }) : super(key: key);

  final Axis scrollDirection;
  final ScrollController? controller;
  final ScrollPhysics? physics;

  final IndexedWidgetBuilder itemBuilder;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      center: const ValueKey('center'),
      scrollDirection: scrollDirection,
      controller: controller,
      physics: physics,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => itemBuilder(context, -index - 1),
          ),
        ),
        SliverToBoxAdapter(
          key: const ValueKey('center'),
          child: itemBuilder(context, 0),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => itemBuilder(context, index + 1),
          ),
        ),
      ],
    );
  }
}
