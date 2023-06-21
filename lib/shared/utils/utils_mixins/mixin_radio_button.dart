import 'package:flutter/material.dart';

mixin RadioMixin<T> {
  Widget buildRadio(
      {required T value,
      required T groupvalue,
      required ValueChanged<T?> onChanged}) {
    return Radio<T>(value: value, groupValue: groupvalue, onChanged: onChanged);
  }
}
