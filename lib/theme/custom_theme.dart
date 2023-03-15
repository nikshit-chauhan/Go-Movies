import 'package:flutter/material.dart';
import 'palette.dart';

class CustomTheme {
  static ThemeData darkTheme(BuildContext context) {
    final theme = Theme.of(context);
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: MaterialColor(
        Palette.blue500.value,
        const {
          100: Palette.blue100,
          200: Palette.blue200,
          300: Palette.blue300,
          400: Palette.blue400,
          500: Palette.blue500,
          600: Palette.blue600,
          700: Palette.blue700,
          800: Palette.blue800,
          900: Palette.blue900,
        },
      ),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: Palette.blue500,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: Palette.almostBlack,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Palette.almostBlack,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: Colors.white,
        inactiveTrackColor: Colors.grey.shade800,
        thumbColor: Colors.white,
        valueIndicatorColor: Palette.blue500,
        inactiveTickMarkColor: Colors.transparent,
        activeTickMarkColor: Colors.transparent,
      ),
      textTheme: theme.primaryTextTheme
          .copyWith(
            button: theme.primaryTextTheme.button?.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
          .apply(
            displayColor: Colors.white,
          ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Palette.blue500,
        ),
      ),
    );
  }
}
