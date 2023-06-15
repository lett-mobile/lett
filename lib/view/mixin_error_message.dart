import 'package:flutter/material.dart';

mixin ErrorMessageMixin {
  Widget buildErrorMessage(String errorMessage) {
    if (errorMessage.isEmpty) {
      //return SizedBox.shrink(); // Return an empty SizedBox if there is no error message
      return Text(
        'Operation successful!',
        style: TextStyle(
          color: Colors.red,
        ),
      );
    }

    return Text(
      errorMessage,
      style: TextStyle(
        color: Colors.red,
      ),
    );
  }
}
