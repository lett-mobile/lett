import 'package:flutter/material.dart';

mixin TextFieldMixin {
  Widget buildTextFieldMixin(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
