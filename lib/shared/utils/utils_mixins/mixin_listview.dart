import 'package:flutter/material.dart';

mixin ListViewMixin {
  Widget buildListView(List<Widget> children) {
    return ListView(children: children);
  }
}
