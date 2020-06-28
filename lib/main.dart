import 'package:buffetlocator/models/fridge_point.dart';
import 'package:buffetlocator/screens/home.dart';
import 'package:buffetlocator/services/firestore.dart';
import 'package:buffetlocator/services/mock.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(BuffetLocator());

class BuffetLocator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<List<FridgePoint>>.value(
          value: FirestoreDatabase().fridgeStream(),
        ),
      ],
      child: MaterialApp(
        title: 'Buffet Locator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: HomePage(),
      ),
    );
  }
}
