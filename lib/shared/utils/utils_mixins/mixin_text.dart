import 'package:flutter/material.dart';
import 'package:lett/shared/utils/colors.dart';

mixin TextMixin {
  Widget buildText(String text) {
    return Text(text);
  }

  Widget buildErrorText(String text) {
    return Text(
      text,
      style: TextStyle(color: LettColors.errorColor),
    );
  }

  Widget buildSuccessText(String text) {
    return Text(
      text,
      style: TextStyle(color: LettColors.successColor),
    );
  }
}
