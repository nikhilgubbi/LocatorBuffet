import 'dart:async';

import 'package:buffetlocator/misc/helpers.dart';
import 'package:buffetlocator/models/fridge_point.dart';
import 'package:buffetlocator/screens/components/circle_button.dart';
import 'package:buffetlocator/screens/components/details_card.dart';
import 'package:buffetlocator/screens/components/donate_card.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:buffetlocator/misc/map_style.dart';

import '../../models/fridge_point.dart';

class BuffetMap extends StatefulWidget {
  const BuffetMap({
    Key key,
    @required this.fridges,
    @required this.initialPosition,
    @required this.mapController,
    @required this.onFridgeTapped,
  }) : super(key: key);

  final List<FridgePoint> fridges;
  final CameraPosition initialPosition;
  final Completer<GoogleMapController> mapController;
  final ValueChanged<FridgePoint> onFridgeTapped;

  @override
  _BuffetMapState createState() => _BuffetMapState();
}

class _BuffetMapState extends State<BuffetMap> {
  BitmapDescriptor _markerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
  }

  _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/marker.png');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          initialCameraPosition: widget.initialPosition,
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          markers: widget.fridges == null
              ? Set<Marker>()
              : widget.fridges
                  .map(
                    (fridge) => Marker(
                      markerId: MarkerId(fridge.placeId),
                      icon: _markerIcon,
                      position: LatLng(
                        fridge.location.latitude,
                        fridge.location.longitude,
                      ),
                      infoWindow: InfoWindow(
                        title: fridge.name,
                        snippet: fridge.locationName,
                      ),
                      onTap: () => widget.onFridgeTapped(fridge),
                    ),
                  )
                  .toSet(),
          onMapCreated: _onMapCreated,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 120.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                CircleButton(
                    child: Icon(Icons.gps_fixed), onPressed: _onGpsPressed),
                SizedBox(
                  height: 10,
                ),
                CircleButton(
                  child: Icon(Icons.menu),
                  onPressed: () {
                    print('menu pressed');
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(MAP_STYLE);
    widget.mapController.complete(controller);
  }

  _onGpsPressed() async {
    var controller = await widget.mapController.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        widget.initialPosition,
      ),
    );
  }
}
