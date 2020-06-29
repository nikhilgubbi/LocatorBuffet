import 'package:buffetlocator/screens/components/bottom_tabs.dart';
import 'package:flutter/material.dart';

class CommentsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(blurRadius: 1, color: Colors.black, spreadRadius: 1)
          ],
        ),
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(
                'On the right in front of the gap',
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 242,),
            BottomTabsList(),
          ],
        ),
      ),
    );
  }
}
