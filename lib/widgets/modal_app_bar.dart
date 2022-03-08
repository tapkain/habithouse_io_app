import 'package:flutter/material.dart';
import 'package:habithouse_io/util.dart';

class ModalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ModalAppBar({
    required this.leading,
    required this.title,
    required this.trailing,
    required this.appBarColor,
    Key? key,
  }) : super(key: key);

  final Widget leading;
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
          leading,
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

  @override
  Size get preferredSize =>
      const Size(kToolbarHeight * 1.2, kToolbarHeight * 1.2);
}
