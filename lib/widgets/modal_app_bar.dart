import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habithouse_io/util.dart';

Widget _applyTextStyle(
  Widget child,
  Color textColor,
  TextStyle style,
  ThemeData theme,
) =>
    DefaultTextStyle(
      style: style,
      child: Theme(
        data: theme.copyWith(
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(style),
              foregroundColor: MaterialStateProperty.all(textColor),
            ),
          ),
        ),
        child: child,
      ),
    );

class ModalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ModalAppBar({
    this.leading,
    required this.title,
    required this.trailing,
    required this.appBarColor,
    Key? key,
  }) : super(key: key);

  final Widget? leading;
  final Widget title;
  final Widget trailing;
  final Color appBarColor;

  @override
  Widget build(BuildContext context) {
    final textColor = getTextColorFor(appBarColor);
    final buttonTextStyle = context.textTheme().button!.copyWith(
          color: textColor,
          fontWeight: FontWeight.bold,
        );
    final titleTextStyle =
        context.textTheme().headline6!.copyWith(color: textColor);
    final theme = context.theme();

    return Container(
      color: appBarColor,
      child: NavigationToolbar(
        leading: _applyTextStyle(
          leading ??
              TextButton(
                onPressed: () => context.pop(),
                child: const Text('Back'),
              ),
          textColor,
          buttonTextStyle,
          theme,
        ),
        trailing: _applyTextStyle(
          trailing,
          textColor,
          buttonTextStyle,
          theme,
        ),
        middle: _applyTextStyle(
          title,
          textColor,
          titleTextStyle,
          theme,
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size(kToolbarHeight * 1.2, kToolbarHeight * 1.2);
}

class SliverModalAppBar extends StatelessWidget {
  const SliverModalAppBar({
    this.leading,
    required this.title,
    required this.trailing,
    this.appBarColor,
    Key? key,
  }) : super(key: key);

  final Widget? leading;
  final Widget title;
  final Widget trailing;
  final Color? appBarColor;

  @override
  Widget build(BuildContext context) {
    final bgColor = appBarColor ?? context.theme().colorScheme.primary;
    final textColor = getTextColorFor(bgColor);
    final buttonTextStyle = context.textTheme().button!.copyWith(
          color: textColor,
          fontWeight: FontWeight.bold,
        );
    final titleTextStyle =
        context.textTheme().headline6!.copyWith(color: textColor);
    final theme = context.theme();

    return SliverAppBar(
      backgroundColor: bgColor,
      automaticallyImplyLeading: false,
      leading: _applyTextStyle(
        leading ??
            TextButton(
              onPressed: () => context.pop(),
              child: const Text('Back'),
            ),
        textColor,
        buttonTextStyle,
        theme,
      ),
      title: _applyTextStyle(
        title,
        textColor,
        titleTextStyle,
        theme,
      ),
      actions: [
        _applyTextStyle(
          trailing,
          textColor,
          buttonTextStyle,
          theme,
        ),
      ],
    );
  }
}
