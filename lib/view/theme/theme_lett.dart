import 'package:flutter/material.dart';
import 'package:lett/view/colors.dart';

class LettTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: LettColors.primaryColor,
    textTheme: buildTextTheme(),
    buttonTheme: buildButtonTheme(),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: LettColors.accentColor)
        .copyWith(background: LettColors.backgroundColor),
    // Other light mode theme properties...
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: LettColors.primaryColor,
    textTheme: buildTextTheme(),
    buttonTheme: buildButtonTheme(),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: LettColors.accentColor)
        .copyWith(background: LettColors.backgroundColor),
    // Other dark mode theme properties...
  );

  static TextTheme buildTextTheme() {
    return TextTheme(
      
    );
  }

  static ButtonThemeData buildButtonTheme() {
    return ButtonThemeData(
      buttonColor: LettColors.accentColor,
      // Other button theme properties...
    );
  }

  // Define other methods for building themes for the mentioned widgets...
}
