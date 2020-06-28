import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  final Color color;

  const CircleButton({this.child, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 2,
      fillColor: color ?? Theme.of(context).backgroundColor,
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
      child: child,
      onPressed: onPressed,
    );
  }
}
