import 'package:flutter/material.dart';

mixin ImageMixin {
  Widget buildImage(String imageUrl) {
    return Image.network(imageUrl);
  }
}
