import 'package:flutter/material.dart';

mixin DropDownButtonMixin<T> {
  Widget buildDropdownButton(
      {required List<DropdownMenuItem<T>> items,
      required T value,
      required ValueChanged<T?> onChanged}) {
    return DropdownButton<T>(
      items: items,
      value: value,
      onChanged: onChanged,
    );
  }
}
