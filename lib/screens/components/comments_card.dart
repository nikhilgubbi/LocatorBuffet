import 'package:buffetlocator/models/fridge_point.dart';
import 'package:buffetlocator/screens/components/bottom_tabs.dart';
import 'package:buffetlocator/screens/components/tag_chip.dart';
import 'package:buffetlocator/screens/components/tags.dart';
import 'package:flutter/material.dart';

class CommentsCard extends StatelessWidget {
  const CommentsCard({this.fridge});

  final FridgePoint fridge;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                padding: const EdgeInsets.all(20),
                child: Icon(Icons.comment, size: 48),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Comments',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Public comments on this fridge',
                    style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[500]),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Flexible(
            child: ListView.builder(
              itemCount: fridge.comments.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (ctx, i) {
                return ListTile(
                  title: Container(
                    color: Colors.grey[800],
                    padding: const EdgeInsets.all(8.0),
                    child: Text(fridge.comments[i].toString()),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
