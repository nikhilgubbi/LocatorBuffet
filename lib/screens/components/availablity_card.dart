import 'package:buffetlocator/models/fridge_point.dart';
import 'package:buffetlocator/screens/components/bottom_tabs.dart';
import 'package:buffetlocator/screens/components/tag_chip.dart';
import 'package:buffetlocator/screens/components/tags.dart';
import 'package:flutter/material.dart';

class AvailabilityCard extends StatelessWidget {
  const AvailabilityCard({this.fridge});

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
                child: Icon(Icons.access_time, size: 48),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Availability',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Opening and closing times',
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
            child: ListView(
              children: [
                AvailabilityTile(
                  day: 'Thanks Giving',
                  startTime: '9 AM',
                  endTime: '9 PM',
                ),
                AvailabilityTile(
                  day: 'Monday - Thursday',
                  startTime: '9 AM',
                  endTime: '9 PM',
                ),
                AvailabilityTile(
                  day: 'Friday',
                  startTime: '9 AM',
                  endTime: '11:30 PM',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AvailabilityTile extends StatelessWidget {
  final String startTime;
  final String endTime;
  final String day;

  const AvailabilityTile({Key key, this.startTime, this.endTime, this.day})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.green, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                day,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '$startTime - $endTime',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
