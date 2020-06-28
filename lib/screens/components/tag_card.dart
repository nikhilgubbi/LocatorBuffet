import 'package:flutter/material.dart';

class TagCard extends StatelessWidget {
  final String tag;

  const TagCard({Key key, this.tag}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
       width: 80,
       margin: EdgeInsets.all(3),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.8)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        tag,
        style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
      ),
    );
  }
}