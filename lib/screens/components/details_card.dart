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
    return SingleChildScrollView(
      child: new Container(
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
                child: ClipRRect(
                    borderRadius: new BorderRadius.circular(15.0),
                    child: Image.asset(
                      'assets/image_1.jpg',
                      scale: 15,
                      fit: BoxFit.fill,
                    ))),
            Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Wrap(direction: Axis.vertical, children: [
                    Text(
                      "Central Fridge",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                children: [
                  RawChip(
                    backgroundColor: Colors.white70,
                    labelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                    label: Text('OPEN'),
                    onPressed: () {
                      //set Alarm
                    },
                  ),
                  RawChip(
                    backgroundColor: Colors.white70,
                    labelStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                    label: Text('FULL'),
                  ),
                ],
              ),
            ),
            TagsList(fridge.tags.map((a) => a.toString()).toList()),
            SizedBox(height: 100),
            BottomTabsList(),
          ],
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(blurRadius: 1, color: Colors.black, spreadRadius: 1)
          ],
        ),
      ),
    );
  }
}
