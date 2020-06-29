import 'dart:async';

import 'package:buffetlocator/models/fridge_point.dart';
import 'package:buffetlocator/screens/components/associates_card.dart';
import 'package:buffetlocator/screens/components/availablity_card.dart';
import 'package:buffetlocator/screens/components/comments_card.dart';
import 'package:buffetlocator/screens/components/details_card.dart';
import 'package:buffetlocator/screens/components/donate_card.dart';
import 'package:buffetlocator/screens/components/inventory_card.dart';
import 'package:buffetlocator/screens/components/page_view_card.dart';
import 'package:buffetlocator/screens/components/rating_card.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:buffetlocator/screens/components/buffet_map.dart';
import 'package:buffetlocator/screens/components/card_carousel.dart';
import 'package:provider/provider.dart';

import '../misc/helpers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> mapController = Completer();

  CameraPosition _initialCamerPosition = CameraPosition(
    target: LatLng(40.7128, -74.0060),
    zoom: 11.0,
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
                onFridgeTapped: _onFridgeTapped),
            FridgeCarousel(
                mapController: mapController,
                fridges: context.watch<List<FridgePoint>>(),
                onFridgeTapped: _onFridgeTapped),
          ],
        ),
      ),
    );
  }

  void _onFridgeTapped(FridgePoint fridge) async {
    print(fridge);
    final distance = await getDistance(_initialCamerPosition.target,
        LatLng(fridge.location.latitude, fridge.location.longitude));
    print('Distance from current location: $distance');

    showModalBottomSheet(
        enableDrag: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => PageViewCard(
              autoScrollTabs: true,
              scrollable: true,
              items: [
                PageViewItem(
                  title: 'DETAILS',
                  content: DetailsCard(
                    fridge: fridge,
                    distance: distance,
                  ),
                ),
                PageViewItem(
                  title: 'INVENTORY',
                  content: Center(
                    child: InventoryCard(fridge: fridge),
                  ),
                ),
                PageViewItem(
                  title: 'RATINGS',
                  content: Center(
                    child: RatingCard(fridge: fridge),
                  ),
                ),
                PageViewItem(
                  title: 'COMMENTS',
                  content: Center(
                    child: CommentsCard(
                      fridge: fridge,
                    ),
                  ),
                ),
                PageViewItem(
                  title: 'DONATE',
                  content: Center(
                    child: DonateCard(fridge: fridge),
                  ),
                ),
                PageViewItem(
                  title: 'AVAILABILITY',
                  content: AvailabilityCard(fridge: fridge),
                ),
                PageViewItem(
                  title: 'ASSOCIATES',
                  content: AssociatesCard(fridge: fridge),
                ),
              ],
            ));
  }
}
