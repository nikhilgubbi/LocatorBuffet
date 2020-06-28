import 'package:buffetlocator/misc/helpers.dart';
import 'package:buffetlocator/models/fridge_point.dart';
import 'package:buffetlocator/services/abstract_data.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:buffetlocator/api_key.dart' as api_key;
import 'package:buffetlocator/misc/map_style.dart';
import 'package:provider/provider.dart';
import 'package:buffetlocator/services/abstract_data.dart';

import 'components/tags.dart';

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
  BitmapDescriptor _markerIcon;

  _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/fridge.png');
  }

  void _getDataTest() async {
    final dataService =
        Provider.of<DataServiceAbstract>(context, listen: false);
    final fridgePoints = await dataService.getData();
    print(fridgePoints);
  }

  @override
  void initState() {
    super.initState();
    _getDataTest();
    _setMarkerIcon();
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
              markers:
                  snapshot.hasData ? _getMarkers(snapshot.data) : Set<Marker>(),
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
    print(fridgePoint);
    final distance =
        await getDistance(_initialCamerPosition.target, fridgePoint.location);
    print('Distance from current location: $distance');

    showModalBottomSheet(
        enableDrag: true,
        context: context,
        builder: (context) {
          return Container(
              height: MediaQuery.of(context).size.height - 330,
              width: MediaQuery.of(context).size.width,
              child: _buildCardNavigationMenu(distance));
        });
  }

  _buildCardNavigationMenu(double distance) {
    return SingleChildScrollView(
      child: new Container(
          child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
                    child: ClipRRect(
                        borderRadius: new BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/image_1.jpg',
                          scale: 15,
                          fit: BoxFit.fill,
                        ))),
                Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Wrap(direction: Axis.vertical, children: [
                        Text(
                          "Central Fridge",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${distance.round()} km | 15 min",
                          style: TextStyle(fontSize: 12),
                        ),
                        RichText(
                          text: TextSpan(
                            text: '\n In  ',
                            style: TextStyle(fontSize: 10),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Central Park',
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 18),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: [
                      RawChip(
                        backgroundColor: Colors.white70,
                        labelStyle: TextStyle(
                            color: Colors.green,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                        label: Text('OPEN'),
                        onPressed: () {
                          //set Alarm
                        },
                      ),
                      RawChip(
                        backgroundColor: Colors.white70,
                        labelStyle: TextStyle(
                            color: Colors.green,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                        label: Text('FULL'),
                      ),
                    ],
                  ),
                ),
                Tags(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
//                      SizedBox(height: 70),
                      RawChip(
                        backgroundColor: Colors.white70,
                        labelStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                        label: Text('Edit'),
                      ),
                      RawChip(
                        backgroundColor: Colors.white70,
                        labelStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                        label: Text('Directions'),
                      ),
                      SizedBox(width: 55),
                      RawChip(
                        backgroundColor: Colors.white70,
                        labelStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                        label: Text('Comments'),
                      ),
                      RawChip(
                        backgroundColor: Colors.white70,
                        labelStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                        label: Text('Prize'),
                      ),
                    ],
                  ),
                )
              ]),
          decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(blurRadius: 1, color: Colors.black, spreadRadius: 1)
              ])),
    );
  }
}
