import 'package:buffetlocator/models/fridge_point.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter/material.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({this.fridge});

  final FridgePoint fridge;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(8),
//        color: Colors.red,
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
                child: Icon(Icons.star_half, size: 48),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Ratings',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Overall ratings',
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
          RatingBar(
            initialRating: fridge.ratings,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.lightGreenAccent,
            ),
            onRatingUpdate: (rating) {},
            glow: false,
            ignoreGestures: true,
          )
        ],
      ),
    );
  }
}
