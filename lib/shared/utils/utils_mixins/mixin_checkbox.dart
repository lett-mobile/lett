import 'package:flutter/material.dart';

mixin CheckBoxMixin {
  Widget buildCheckBox(bool value, ValueChanged<bool?> onChanged) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
    );
  }
}
