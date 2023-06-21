import 'package:flutter/material.dart';
import 'package:lett/shared/utils/colors.dart';

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
    primaryColor: Color.fromARGB(255, 194, 78, 187),
    textTheme: buildTextTheme(),
    buttonTheme: buildButtonTheme(),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: LettColors.accentColor)
        .copyWith(background: LettColors.backgroundColor),
    // Other dark mode theme properties...
  );

  static TextTheme buildTextTheme() {
    return TextTheme(
      bodyLarge:
          TextStyle(fontSize: 24.0), // Example: Set font size to 16 pixels
      displayLarge:
          TextStyle(fontSize: 34.0), // Example: Set font size to 24 pixels
      // Define other text styles with desired font sizes...
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
