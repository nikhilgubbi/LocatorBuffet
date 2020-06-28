import 'package:buffetlocator/misc/helpers.dart';
import 'package:buffetlocator/models/fridge_point.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:buffetlocator/misc/api_key.dart' as api_key;
import 'package:buffetlocator/misc/map_style.dart';
import 'package:provider/provider.dart';

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
          zoomControlsEnabled: false,
          initialCameraPosition: _initialCamerPosition,
          onMapCreated: _onMapCreated,
          markers: _getMarkers(context.watch<List<FridgePoint>>()),
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(MAP_STYLE);
  }

  Set<Marker> _getMarkers(List<FridgePoint> points) {
    return points
        ?.map(
          (fridge) => Marker(
            markerId: MarkerId(fridge.hashCode.toString()),
            position:
                LatLng(fridge.location.latitude, fridge.location.longitude),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(title: fridge.name),
            onTap: () => _onFridgeTapped(fridge),
          ),
        )
        ?.toSet();
  }

  void _onFridgeTapped(FridgePoint fridgePoint) async {
    // TODO: show the fridge card here.
    print(fridgePoint);
    final distance = await getDistance(_initialCamerPosition.target,
        LatLng(fridgePoint.location.latitude, fridgePoint.location.longitude));
    print('Distance from current location: $distance');
  }
}
