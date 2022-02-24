import 'package:flutter/material.dart';

class ModalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ModalAppBar({
    required this.leading,
    required this.title,
    required this.trailing,
    this.appBarColor,
    Key? key,
  }) : super(key: key);

  final Widget leading;
  final Widget title;
  final Widget trailing;
  final Color? appBarColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBarColor,
      child: Row(
        children: [
          ...[leading, const Spacer()],
          Center(child: title),
          ...[const Spacer(), trailing],
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size(kToolbarHeight * 1.2, kToolbarHeight * 1.2);
}
