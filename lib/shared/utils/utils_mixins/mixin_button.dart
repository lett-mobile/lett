import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

mixin ButtonMixin {
  Widget buildTextButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }

  Widget buildElevatedButton(String text, VoidCallback onPressed) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Expanded(
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  16.0), // Adjust the border radius as needed
            ),
            minimumSize: Size(
                double.infinity, 48.0), // Adjust the button height as needed
            padding:
                EdgeInsets.all(16.0), // Adjust the button padding as needed
            side: BorderSide(width: 0.5), // Adjust the border width as needed
          ),
        ),
      ),
    );
  }

  Widget buildOutlinedButton(String text, VoidCallback onPressed) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Expanded(
        child: OutlinedButton(
          onPressed: onPressed,
          child: Text(text),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  16.0), // Adjust the border radius as needed
            ),
            minimumSize: Size(
                double.infinity, 48.0), // Adjust the button height as needed
            padding:
                EdgeInsets.all(16.0), // Adjust the button padding as needed
            side: BorderSide(width: 0.5), // Adjust the border width as needed
          ),
        ),
      ),
    );
  }
}
