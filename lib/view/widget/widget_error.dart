import 'package:flutter/material.dart';
import 'package:lett/view/mixin_error_message.dart';

class ErrorTextWidget extends StatelessWidget with ErrorMessageMixin {
  final String errorMessage;

  const ErrorTextWidget({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return buildErrorMessage(errorMessage);
  }
}
