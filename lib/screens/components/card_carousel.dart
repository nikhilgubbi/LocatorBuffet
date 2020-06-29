import 'dart:async';
import 'package:buffetlocator/misc/api_key.dart';
import 'package:buffetlocator/models/fridge_point.dart';
import 'package:buffetlocator/screens/components/tag_chip.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

import '../../models/fridge_point.dart';

final _placesApiClient = GoogleMapsPlaces(apiKey: apiKey);

class FridgeCarousel extends StatelessWidget {
  const FridgeCarousel(
      {Key key,
      @required this.fridges,
      @required this.mapController,
      @required this.onFridgeTapped})
      : super(key: key);

  final List<FridgePoint> fridges;
  final Completer<GoogleMapController> mapController;
  final ValueChanged<FridgePoint> onFridgeTapped;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          height: 90,
          child: CarouselList(
            fridges: fridges,
            mapController: mapController,
            onFridgeTapped: onFridgeTapped,
          ),
        ),
      ),
    );
  }
}

class CarouselList extends StatelessWidget {
  const CarouselList(
      {Key key,
      @required this.fridges,
      @required this.mapController,
      @required this.onFridgeTapped})
      : super(key: key);

  final List<FridgePoint> fridges;
  final Completer<GoogleMapController> mapController;
  final ValueChanged<FridgePoint> onFridgeTapped;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: fridges == null ? 0 : fridges.length,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 340,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              clipBehavior: Clip.hardEdge,
              child: FridgeListTile(
                fridge: fridges[index],
                mapController: mapController,
                onTapped: () => onTileTapped(index),
              ),
            ),
          ),
        );
      },
    );
  }

  onTileTapped(int index) async {
    final fridge = fridges[index];
    onFridgeTapped(fridge);
    // TODO: following is not working for some reason
//    await animateCamera(fridge);
  }

  animateCamera(FridgePoint fridge) async {
    final controller = await mapController.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            fridge.location.longitude,
            fridge.location.longitude,
          ),
          zoom: 13.0,
        ),
      ),
    );
  }
}

class FridgeListTile extends StatefulWidget {
  const FridgeListTile({
    Key key,
    @required this.fridge,
    @required this.mapController,
    @required this.onTapped,
  }) : super(key: key);

  final FridgePoint fridge;
  final Completer<GoogleMapController> mapController;
  final Function onTapped;

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
        subtitle: Text(widget.fridge.notes),
        leading: Container(
          width: 64,
          height: 64,
          child: CircleAvatar(
            backgroundColor: Colors.black38,
            child: Icon(
              Icons.kitchen,
              size: 32,
              color: Colors.white,
            ),
          ),
        ),
        trailing: TagChip(
          label: 'SERVED: ${widget.fridge.usedCount}',
          backgroundColor: Colors.transparent,
          color: Colors.lightGreenAccent,
        ),
        onTap: widget.onTapped);
  }
}
