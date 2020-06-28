import 'package:flutter/material.dart';

import 'tag_card.dart';

class Tags extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> tags = [
      "Chips",
      "Pizza",
      "Chicken",
      "Melons",
      "Carrots",
      "Chips"
    ];
    return Container(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        itemBuilder: (context, index) => TagCard(tag: tags[index]),
      ),
    );
  }
}