import 'package:flutter/material.dart';

mixin ImageMixin {
  Widget buildImageLogo() {
    return Container(
      width: 100, // Adjust the width as desired
      height: 100, // Adjust the height as desired
      child: Image.asset('assets/images/image1.png'),
    );
  }
}
