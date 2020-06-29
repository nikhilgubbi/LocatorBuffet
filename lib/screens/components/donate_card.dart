import 'package:flutter/material.dart';

class DonateCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
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
            DonateBottomTabsList(),
          ],
        ),
      ),
    );
  }
}

class DonateBottomTabsList extends StatelessWidget {

  final List<String> bottomTabs = [
    "FRIDGE",
    "SPACE",
    "MONEY",
    "FOOD",
  ];


  @override
  Widget build(BuildContext context) {

    return Container(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bottomTabs.length,
        itemBuilder: (context, index) {

          return BottomTabCard(bottomTab: bottomTabs[index]);
        }
      ),
    );
  }
}

class BottomTabCard extends StatelessWidget {
  final String bottomTab;

  const BottomTabCard({Key key, this.bottomTab}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return InkWell(
      child: Container(
        width: 100,
        margin: EdgeInsets.all(3),
        alignment: Alignment.center,
        child: Text(
          bottomTab,
          style: TextStyle(color: Colors.green.withOpacity(0.8), fontSize: 15),
        ),
      ),
      onTap: () => print("${bottomTab.toString()}")
    );
  }
}