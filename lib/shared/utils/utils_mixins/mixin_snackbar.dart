import 'package:flutter/material.dart';
mixin SnackbarMixin {
  static void showSnackbar(BuildContext context, String message) {
    final snackbar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}

