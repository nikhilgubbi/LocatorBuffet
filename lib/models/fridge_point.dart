import 'package:google_maps_flutter/google_maps_flutter.dart';

class FridgePoint {
  String name;
  bool open;
  bool hasFood;
  int usedCount; // how many times used
  String notes; // misc notes
  String imageUrl;
  LatLng location;
  List<String> tags;
  List<String> foodItems;

  FridgePoint(
  {
    this.name,
    this.open,
    this.hasFood,
    this.usedCount,
    this.notes,
    this.imageUrl,
    this.location,
    this.tags,
    this.foodItems
  });

  @override
  String toString() {
    return '$name (${location.latitude}, ${location.longitude})';
  }

}