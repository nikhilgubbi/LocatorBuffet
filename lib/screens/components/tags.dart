import 'package:buffetlocator/screens/components/tag_chip.dart';
import 'package:flutter/material.dart';

class TagsList extends StatelessWidget {
  final List<String> tags;

  const TagsList(this.tags);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: tags
            .map((tag) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: TagChip(
                    label: tag,
                    color: Colors.white,
                    backgroundColor: Colors.transparent,
                  ),
                ))
            .toList(),
      ),
    );
  }
}

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
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        tag,
        style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
      ),
    );
  }
}
