import 'package:flutter/material.dart';

class LettColors {
  static const Color primaryColor = Color(0xFF4285F4);
  static const Color secondaryColor = Color(0xFF34A853);
  static const Color accentColor = Color(0xFFEA4335);
  static const Color backgroundColor = Color(0xFFFFFFFF);

  // Add more color constants as needed...

  static Color get randomColor {
    final colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
    ];
    return colors[DateTime.now().microsecondsSinceEpoch % colors.length];
  }

  // Add more color-related methods as needed...
}
