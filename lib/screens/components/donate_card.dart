import 'package:buffetlocator/models/fridge_point.dart';
import 'package:buffetlocator/screens/components/bottom_tabs.dart';
import 'package:buffetlocator/screens/components/tag_chip.dart';
import 'package:buffetlocator/screens/components/tags.dart';
import 'package:flutter/material.dart';

class DonateCard extends StatelessWidget {
  const DonateCard({this.fridge});

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
                child: Icon(Icons.card_giftcard, size: 48),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Donate',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Donate items to this fridge',
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
              physics: const BouncingScrollPhysics(),
              children: [
                ["Fridge", Icons.kitchen],
                ["Space", Icons.local_convenience_store],
                ["Money", Icons.monetization_on],
                ["Food", Icons.fastfood],
              ]
                  .map(
                    (i) => Card(
                      clipBehavior: Clip.antiAlias,
                      shape: StadiumBorder(),
                      child: ListTile(
                        title: Text(i[0], style: TextStyle(fontSize: 16)),
                        leading: Icon(i[1]),
                        onTap: (){},
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
