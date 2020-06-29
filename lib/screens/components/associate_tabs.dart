import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AssociateTabsList extends StatefulWidget {
  @override
  _AssociateTabsListState createState() => _AssociateTabsListState();
}

class _AssociateTabsListState extends State<AssociateTabsList> {
  List<String> associate_tabs = [
    "GOOGLE",
    "IZZY BBQ",
    "BP PETROL",
    "JOEY",
    "POLARD",
  ];

  bool _selected = false;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 30,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: associate_tabs.length,
              itemBuilder: (context, index) {
                return BottomTabCard(
                  label: associate_tabs[index],
                  color: selectedIndex == index
                      ? Colors.lightGreenAccent
                      : Colors.white,
                  backgroundColor: selectedIndex == index
                      ? Colors.white30
                      : Colors.transparent,
                  onPressed: () {
                    print(associate_tabs[index]);
                    if (selectedIndex == index) {
                      selectedIndex = -1;
                      _selected = false;
                    } else {
                      selectedIndex = index;
                      _selected = true;
                    }
//                    _selected = !_selected;
                    setState(() {});
                  },
                );
              }),
        ),
        SizedBox(height: 20),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: _selected ? 200 : 0,
          child: Center(
            child: Text(
              'COMING SOON...',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}

class BottomTabCard extends StatelessWidget {
  final String label;
  final Color color;
  final Color backgroundColor;
  final Function onPressed;

  const BottomTabCard(
      {Key key, this.label, this.color, this.backgroundColor, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ActionChip(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        avatar: Icon(Icons.local_florist, size: 50, color: Colors.green,),
        label: Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 50,
            fontWeight: FontWeight.w500
          ),
        ),
        shape: StadiumBorder(
          side: BorderSide(color: Colors.transparent, width: 0),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
