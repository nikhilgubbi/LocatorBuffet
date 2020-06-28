import 'dart:async';

import 'package:buffetlocator/misc/helpers.dart';
import 'package:buffetlocator/models/fridge_point.dart';
import 'package:buffetlocator/screens/components/details_card.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:buffetlocator/misc/map_style.dart';

class BuffetMap extends StatefulWidget {
  const BuffetMap(
      {Key key,
      @required this.fridges,
      @required this.initialPosition,
      @required this.mapController})
      : super(key: key);

  final List<FridgePoint> fridges;
  final CameraPosition initialPosition;
  final Completer<GoogleMapController> mapController;

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
        ImageConfiguration(), 'assets/fridge.png');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: widget.initialPosition,
      mapType: MapType.normal,
      zoomControlsEnabled: false,
      markers: widget.fridges
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
                  snippet: fridge.notes,
                ),
                onTap: () => _onFridgeTapped(fridge)),
          )
          .toSet(),
      onMapCreated: _onMapCreated,
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(MAP_STYLE);
    widget.mapController.complete(controller);
  }

  Set<Marker> _getMarkers(List<FridgePoint> points) {
    return points
        .map(
          (fridge) => Marker(
            markerId: MarkerId(fridge.hashCode.toString()),
            position:
                LatLng(fridge.location.latitude, fridge.location.longitude),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(title: fridge.name),
            onTap: () => _onFridgeTapped(fridge),
          ),
        )
        .toSet();
  }

  void _onFridgeTapped(FridgePoint fridge) async {
    print(fridge);
    final distance = await getDistance(widget.initialPosition.target,
        LatLng(fridge.location.latitude, fridge.location.longitude));
    print('Distance from current location: $distance');

    showModalBottomSheet(
      enableDrag: true,
      context: context,
      builder: (context) => DetailsCard(
        fridge: fridge,
        distance: distance,
      ),
    );
  }
}
