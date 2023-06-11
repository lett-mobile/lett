import 'package:flutter/material.dart';

mixin ProgressIndicatorMixin {
  Widget buildCircularProgressIndicator() {
    return CircularProgressIndicator();
  }

  Widget buildLinearProgressIndicator() {
    return LinearProgressIndicator();
  }
}
