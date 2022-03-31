import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:habithouse_io/util.dart';

class FormThemeProvider extends StatelessWidget {
  const FormThemeProvider({
    required this.child,
    required this.primary,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    final theme = context.flexTheme(primary);
    return Theme(
      data: theme.copyWith(
        listTileTheme: ListTileThemeData(
          tileColor: theme.inputDecorationTheme.fillColor,
        ),
        dividerTheme: DividerThemeData(
          thickness: theme.inputDecorationTheme.enabledBorder?.borderSide.width,
          space: theme.inputDecorationTheme.enabledBorder?.borderSide.width,
          color: theme.inputDecorationTheme.enabledBorder?.borderSide.color,
        ),
        inputDecorationTheme: theme.inputDecorationTheme.copyWith(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
      child: child,
    );
  }
}

ThemeData darkTheme({FlexScheme? scheme, Color? primary}) => FlexThemeData.dark(
      scheme: scheme,
      colorScheme: primary != null
          ? ColorScheme.fromSeed(
              seedColor: primary,
              brightness: Brightness.dark,
            )
          : null,
      useSubThemes: true,
      blendLevel: 0,
      darkIsTrueBlack: true,
      swapColors: true,
      subThemesData: const FlexSubThemesData(
        cardElevation: 5,
        inputDecoratorBorderType: FlexInputBorderType.underline,
      ),
    );

ThemeData lightTheme({FlexScheme? scheme, Color? primary}) =>
    FlexThemeData.light(
      scheme: scheme,
      colorScheme: primary != null
          ? ColorScheme.fromSeed(
              seedColor: primary,
              brightness: Brightness.light,
            )
          : null,
      useSubThemes: true,
      blendLevel: 0,
      swapColors: true,
      subThemesData: const FlexSubThemesData(
        cardElevation: 5,
        inputDecoratorBorderType: FlexInputBorderType.underline,
      ),
    );
