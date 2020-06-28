import 'package:buffetlocator/misc/helpers.dart';
import 'package:buffetlocator/models/fridge_point.dart';
import 'package:buffetlocator/services/abstract_data.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:buffetlocator/api_key.dart' as api_key;
import 'package:buffetlocator/misc/map_style.dart';
import 'package:provider/provider.dart';
import 'package:buffetlocator/services/abstract_data.dart';

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

  Set<Marker> fridges = Set<Marker>();

  @override
  void initState() {
    super.initState();
    _getDataTest();
  }

  @override
  Widget build(BuildContext context) {
    final dataService =
        Provider.of<DataServiceAbstract>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<FridgePoint>>(
          future: dataService.getData(),
          builder: (context, snapshot) {
            return GoogleMap(
              mapType: MapType.normal,
              zoomControlsEnabled: false,
              initialCameraPosition: _initialCamerPosition,
              onMapCreated: _onMapCreated,
              markers: snapshot.hasData ? _getMarkers(snapshot.data) : Set<Marker>(),
            );
          },
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
        .map(
          (fridge) => Marker(
            markerId: MarkerId(fridge.hashCode.toString()),
            position: fridge.location,
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(title: fridge.name),
            onTap: () => _onFridgeTapped(fridge),
          ),
        )
        .toSet();
  }

  void _onFridgeTapped(FridgePoint fridgePoint) async {
    // TODO: show the fridge card here.
    print(fridgePoint);
    final distance = await getDistance(_initialCamerPosition.target, fridgePoint.location);
    print('Distance from current location: $distance');

  }

  void _getDataTest() async {
    final dataService =
        Provider.of<DataServiceAbstract>(context, listen: false);
    final fridgePoints = await dataService.getData();
    print(fridgePoints);

  }
}
