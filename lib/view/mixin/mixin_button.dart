import 'package:flutter/material.dart';

mixin ButtonMixin {
  Widget buildTextButton(String text, VoidCallback onPressed) {
    return TextButton(onPressed: onPressed, child: Text(text));
  }

  Widget buildElevatedButton(String text, VoidCallback onPressed) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }

  Widget buildOutlinedButton(String text, VoidCallback onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
