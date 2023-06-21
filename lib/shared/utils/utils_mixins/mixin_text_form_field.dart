import 'package:flutter/material.dart';

mixin TextFormFieldMixin {
   Widget buildTextFormFieldMixin(
      String labelText, ValueChanged<String> onChanged) {
    return TextFormField(
        decoration: InputDecoration(labelText: labelText),
        onChanged: onChanged,
        style: TextStyle(
          color: Colors.black,
        ));
  }
}
