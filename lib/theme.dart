import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:habithouse_io/util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FancyThemeProvider extends StatelessWidget {
  const FancyThemeProvider({
    required this.child,
    required this.primary,
    this.applyFormTheming = false,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Color primary;
  final bool applyFormTheming;

  @override
  Widget build(BuildContext context) {
    final theme = context.flexTheme(primary);
    return Theme(
      data: applyFormTheming
          ? theme.copyWith(
              listTileTheme: theme.listTileTheme.copyWith(
                tileColor: theme.inputDecorationTheme.fillColor,
              ),
              dividerTheme: theme.dividerTheme.copyWith(
                thickness:
                    theme.inputDecorationTheme.enabledBorder?.borderSide.width,
                space:
                    theme.inputDecorationTheme.enabledBorder?.borderSide.width,
                color:
                    theme.inputDecorationTheme.enabledBorder?.borderSide.color,
              ),
              inputDecorationTheme: theme.inputDecorationTheme.copyWith(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
            )
          : theme,
      child: child,
    );
  }
}

ThemeData themeFor(
  Brightness brightness, {
  FlexScheme? scheme,
  Color? primary,
}) =>
    brightness == Brightness.light
        ? _lightTheme(scheme: scheme, primary: primary)
        : _darkTheme(scheme: scheme, primary: primary);

ThemeData _darkTheme({FlexScheme? scheme, Color? primary}) =>
    FlexThemeData.dark(
      scheme: scheme,
      colorScheme: primary != null
          ? ColorScheme.fromSeed(
              seedColor: primary,
              brightness: Brightness.dark,
            )
          : null,
      useSubThemes: true,
      // blendLevel: 0,
      // darkIsTrueBlack: true,
      // swapColors: true,
      subThemesData: const FlexSubThemesData(
        cardElevation: 5,
        inputDecoratorBorderType: FlexInputBorderType.underline,
      ),
    );

ThemeData _lightTheme({FlexScheme? scheme, Color? primary}) =>
    FlexThemeData.light(
      scheme: scheme,
      colorScheme: primary != null
          ? ColorScheme.fromSeed(
              seedColor: primary,
              primary: primary,
              brightness: Brightness.light,
            )
          : null,
      useSubThemes: true,
      swapColors: true,
      // blendLevel: 0,
      subThemesData: const FlexSubThemesData(
        cardElevation: 0,
        inputDecoratorBorderType: FlexInputBorderType.underline,
      ),
    );
