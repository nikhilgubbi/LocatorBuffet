import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:buffetlocator/api_key.dart' as api_key;

void main() => runApp(BuffetLocator());

class BuffetLocator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buffet Locator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: LatLng(37.42796133580664, -122.085749655962),
          ),
        ),
      ),
    );
  }
}
