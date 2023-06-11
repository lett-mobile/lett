import 'package:flutter/material.dart';

mixin SwitchMixin {
  Widget buildSwitch(bool value, ValueChanged<bool> onChanged) {
    return Switch(
      value: value,
      onChanged: onChanged,
    );
  }
}
