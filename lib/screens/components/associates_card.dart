import 'package:buffetlocator/models/fridge_point.dart';
import 'package:buffetlocator/screens/components/associate_tabs.dart';
import 'package:flutter/material.dart';

class AssociatesCard extends StatelessWidget {
  const AssociatesCard({this.fridge});

  final FridgePoint fridge;

  @override
  Widget build(BuildContext context) {

    List<String> associates = [
      "DETAILS",
      "INVENTORY",
      "RATINGS",
      "COMMENT",
      "AVAILABILITY",
      "RATING",
      "ASSOCIATES",
    ];

    bool _selected = false;
    int selectedIndex = -1;
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
                child: Icon(Icons.people, size: 48),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Associates',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Details of associates',
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
            child:
            ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: associates.length,
                itemBuilder: (context, index) {
                  return BottomTabCard(
                    label: associates[index],
                    color: selectedIndex == index
                        ? Colors.lightGreenAccent
                        : Colors.white,
                    backgroundColor: selectedIndex == index
                        ? Colors.white30
                        : Colors.transparent,
                    onPressed: () {
                      print(associates[index]);
                      if (selectedIndex == index) {
                        selectedIndex = -1;
                        _selected = false;
                      } else {
                        selectedIndex = index;
                        _selected = true;
                      }

                    },
                  );
                }),

          )
        ],
      ),
    );
  }
}
