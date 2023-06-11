import 'package:flutter/material.dart';

mixin SliderMixin {
  Widget buildSlider({ required double value,required double min, required double max, required ValueChanged <double>? onChanged,}){
    return Slider(
      value: value,
      min: min,
      max: max,
      onChanged: onChanged,
    );
  }

}
