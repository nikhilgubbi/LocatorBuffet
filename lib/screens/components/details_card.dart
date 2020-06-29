import 'package:buffetlocator/models/fridge_point.dart';
import 'package:buffetlocator/screens/components/bottom_tabs.dart';
import 'package:buffetlocator/screens/components/tag_chip.dart';
import 'package:buffetlocator/screens/components/tags.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({this.fridge, this.distance});

  final FridgePoint fridge;
  final double distance;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(8),
      child: Column(
//        direction: Axis.horizontal,
//        alignment: WrapAlignment.spaceBetween,
//        crossAxisAlignment: WrapCrossAlignment.center,
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
                child: Icon(Icons.kitchen, size: 48),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fridge.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    distance > 1
                        ? '${distance.toStringAsFixed(2)} km'
                        : '${(distance * 1000).floor()} m',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'In : ',
                      style: TextStyle(fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(
                          text: fridge.locationName,
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 15,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TagChip(
                    label: fridge.open ? 'OPEN' : 'CLOSE',
                    color: fridge.open
                        ? Colors.lightGreenAccent
                        : Colors.redAccent,
                    backgroundColor: Colors.transparent,
                  ),
                  TagChip(
                    label: fridge.hasFood ? 'FULL' : 'EMPTY',
                    color: fridge.hasFood
                        ? Colors.lightGreenAccent
                        : Colors.redAccent,
                    backgroundColor: Colors.transparent,
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('SERVED: ${fridge.usedCount}'),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.directions),
                    onPressed: null,
                    iconSize: 50,
                  ),
                  Text('Directions'),
                ],
              )
            ],
          ),
          TagsList(fridge.tags.map((a) => a.toString()).toList()),
        ],
      ),
    );
  }
}
