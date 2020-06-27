import 'package:buffetlocator/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(BuffetLocator());

class BuffetLocator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buffet Locator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}