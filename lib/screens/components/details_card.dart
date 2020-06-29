import 'package:buffetlocator/models/fridge_point.dart';
import 'package:buffetlocator/screens/components/bottom_tabs.dart';
import 'package:buffetlocator/screens/components/tags.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({this.fridge, this.distance});

  final FridgePoint fridge;
  final double distance;

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                padding: const EdgeInsets.all(20),
                child: Icon(Icons.kitchen, size: 48)),
          ),
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Wrap(direction: Axis.vertical, children: [
                  Text(
                    "Central Fridge",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${distance.round()} km",
                    style: TextStyle(fontSize: 12),
                  ),
                  RichText(
                    text: TextSpan(
                      text: '\n In  ',
                      style: TextStyle(fontSize: 10),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Central Park',
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 15,
                                fontWeight: FontWeight.normal)),
                      ],
                    ),
                  )
                ]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 18),
            child: Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                Chip(
                  backgroundColor: Colors.transparent,
                  shape: StadiumBorder(
                    side: BorderSide(color: Colors.lightGreenAccent, width: 1),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.lightGreenAccent,
                    fontSize: 14.0,
                  ),
                  label: Text('OPEN'),
                ),
                Chip(
                  backgroundColor: Colors.transparent,
                  shape: StadiumBorder(
                    side: BorderSide(color: Colors.lightGreenAccent, width: 1),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.lightGreenAccent,
                    fontSize: 14.0,
                  ),
                  label: Text('FULL'),
                ),
              ],
            ),
          ),
          TagsList(fridge.tags.map((a) => a.toString()).toList()),
        ],
      ),
    );
  }
}
