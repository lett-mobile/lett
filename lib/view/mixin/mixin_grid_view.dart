import 'package:flutter/material.dart';

mixin GridViewMixin {
  Widget buildGridView(List<Widget> children, int crossAxisCount) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      children: children,
    );
  }
}
