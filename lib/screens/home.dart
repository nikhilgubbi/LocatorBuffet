import 'dart:collection';

import 'package:buffetlocator/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:buffetlocator/api_key.dart' as api_key;
import 'package:buffetlocator/misc/map_style.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController _controller;
  List<Marker> _myMarkers = [];

  @override
  void initState() {
    super.initState();

    _myMarkers.add(Marker(
        markerId: MarkerId("1"),
        infoWindow: InfoWindow(title: Constants.LANDMARK_ONE),
        draggable: false,
        position: Constants.MARKER_ONE));

    _myMarkers.add(Marker(
        markerId: MarkerId("2"),
        infoWindow: InfoWindow(title: Constants.LANDMARK_TWO),
        draggable: false,
        position: Constants.MARKER_TWO));

    _myMarkers.add(Marker(
        markerId: MarkerId("3"),
        infoWindow: InfoWindow(title: Constants.LANDMARK_THREE),
        draggable: false,
        position: Constants.MARKER_THREE));

    _myMarkers.add(Marker(
        markerId: MarkerId("4"),
        infoWindow: InfoWindow(title: Constants.LANDMARK_FOUR),
        draggable: false,
        position: Constants.MARKER_FOUR));

    _myMarkers.add(Marker(
        markerId: MarkerId("5"),
        infoWindow: InfoWindow(title: Constants.LANDMARK_FIVE),
        draggable: false,
        position: Constants.MARKER_FIVE));
  }

  void _onMapCreated(contoller) {
    setState(() {
      _controller = contoller;
      _controller.setMapStyle(MAP_STYLE);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GoogleMap(
                myLocationEnabled: true,
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                    target: Constants.CURRENT_LOCATION, zoom: 10.0),
                markers: Set.from(_myMarkers),
              )),
          Positioned(
              top: MediaQuery.of(context).size.height - 230.0,
              child: Wrap(
                children: <Widget>[
                  Card(
                      margin: EdgeInsets.only(
                          top: 10, left: 10, right: 10, bottom: 10),
                      elevation: 8,
                      child: new Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                            height: MediaQuery.of(context).size.height - 450.0,
                            width: MediaQuery.of(context).size.width - 40.0,
                            child: Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: <Widget>[])),
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
