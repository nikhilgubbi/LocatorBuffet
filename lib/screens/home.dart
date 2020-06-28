import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:buffetlocator/api_key.dart' as api_key;
import 'package:buffetlocator/misc/map_style.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController mapController;
  CameraPosition _initialCamerPosition = CameraPosition(
    target: LatLng(40.7128, -74.0060),
    zoom: 13.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _initialCamerPosition,
          onMapCreated: _onMapCreated,
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(MAP_STYLE);
  }
}
