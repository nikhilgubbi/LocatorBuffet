import 'dart:async';

import 'package:buffetlocator/models/fridge_point.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:buffetlocator/screens/components/buffet_map.dart';
import 'package:buffetlocator/screens/components/card_carousel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> mapController = Completer();

  CameraPosition _initialCamerPosition = CameraPosition(
    target: LatLng(40.7128, -74.0060),
    zoom: 13.0,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BuffetMap(
              initialPosition: _initialCamerPosition,
              mapController: mapController,
              fridges: context.watch<List<FridgePoint>>(),
            ),
            FridgeCarousel(
              mapController: mapController,
              fridges: context.watch<List<FridgePoint>>(),
            ),
          ],
        ),
      ),
    );
  }
}
