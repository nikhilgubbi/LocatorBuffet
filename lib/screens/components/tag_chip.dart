import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final String label;
  final Color color;
  final Color backgroundColor;

  const TagChip({this.label, this.color, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: backgroundColor,
      shape: StadiumBorder(
        side: BorderSide(color: color, width: 1),
      ),
      labelStyle: TextStyle(
        color: color,
        fontSize: 14.0,
      ),
      label: Text(label),
    );
  }
}
