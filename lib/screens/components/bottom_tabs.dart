import 'package:flutter/material.dart';

class BottomTabsList extends StatelessWidget {

  List<String> bottom_tabs = [
    "DEAILS",
    "INVENTORY",
    "RATINGS",
    "DETAILS",
    "INVENTORY",
    "COMMENT",
    "AVAILABILITY",
    "RATING",
    "ASSOCIATES",
  ];


  @override
  Widget build(BuildContext context) {

    return Container(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bottom_tabs.length,
        itemBuilder: (context, index) {

          return BottomTabCard(bottom_tab: bottom_tabs[index]);
        }
      ),
    );
  }
}

class BottomTabCard extends StatelessWidget {
  final String bottom_tab;

  const BottomTabCard({Key key, this.bottom_tab}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return InkWell(
      child: Container(
        width: 100,
        margin: EdgeInsets.all(3),
        alignment: Alignment.center,
        child: Text(
          bottom_tab,
          style: TextStyle(color: Colors.green.withOpacity(0.8), fontSize: 15),
        ),
      ),
      onTap: () => print("${bottom_tab.toString()}")
    );
  }
}