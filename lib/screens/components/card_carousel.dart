import 'dart:async';
import 'package:buffetlocator/misc/api_key.dart';
import 'package:buffetlocator/models/fridge_point.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

final _placesApiClient = GoogleMapsPlaces(apiKey: apiKey);

class FridgeCarousel extends StatelessWidget {
  const FridgeCarousel({
    Key key,
    @required this.fridges,
    @required this.mapController,
  }) : super(key: key);

  final List<FridgePoint> fridges;
  final Completer<GoogleMapController> mapController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 90,
          child: CarouselList(
            fridges: fridges,
            mapController: mapController,
          ),
        ),
      ),
    );
  }
}

class CarouselList extends StatelessWidget {
  const CarouselList({
    Key key,
    @required this.fridges,
    @required this.mapController,
  }) : super(key: key);

  final List<FridgePoint> fridges;
  final Completer<GoogleMapController> mapController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: fridges.length,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 340,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Card(
              child: Center(
                child: FridgeListTile(
                  fridge: fridges[index],
                  mapController: mapController,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class FridgeListTile extends StatefulWidget {
  const FridgeListTile({
    Key key,
    @required this.fridge,
    @required this.mapController,
  }) : super(key: key);

  final FridgePoint fridge;
  final Completer<GoogleMapController> mapController;

  @override
  State<StatefulWidget> createState() {
    return _FridgeListTileState();
  }
}

class _FridgeListTileState extends State<FridgeListTile> {
  String _placePhotoUrl = 'assets/fridge.png';
  bool _disposed = false;

  @override
  void initState() {
    super.initState();
//    _retrievePlacesDetails();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  Future<void> _retrievePlacesDetails() async {
    final details =
        await _placesApiClient.getDetailsByPlaceId(widget.fridge.placeId);
    if (!_disposed) {
      setState(() {
        _placePhotoUrl = _placesApiClient.buildPhotoUrl(
          photoReference: details.result.photos[0].photoReference,
          maxHeight: 300,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.fridge.name),
      subtitle: Text(widget.fridge.name),
      leading: Container(
        width: 64,
        height: 64,
        child: _placePhotoUrl.isNotEmpty
            ? CircleAvatar(
                backgroundColor: Colors.black38,
                child: Image.asset(_placePhotoUrl, fit: BoxFit.scaleDown),
              )
            : Container(),
      ),
      onTap: () async {
        final controller = await widget.mapController.future;
        await controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(
                widget.fridge.location.longitude,
                widget.fridge.location.longitude,
              ),
              zoom: 13.0,
            ),
          ),
        );
      },
    );
  }
}
