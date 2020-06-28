import 'package:cloud_firestore/cloud_firestore.dart';

class FridgePoint {
  String placeId;
  String name;
  bool open;
  bool hasFood;
  int usedCount; // how many times used
  String notes; // misc notes
  String imageUrl;
  GeoPoint location;
  List tags;
  List foodItems;

  FridgePoint(
      {this.name,
      this.placeId,
      this.open,
      this.hasFood,
      this.usedCount,
      this.notes,
      this.imageUrl,
      this.location,
      this.tags,
      this.foodItems});

  factory FridgePoint.fromMap(Map point) {
    point = point ?? {};
    return FridgePoint(
      name: point['name'] ?? 'Fridge Point',
      placeId: point['placeId'] ?? 'ujhfujhfohndejfnh',
      open: point['open'] ?? false,
      hasFood: point['hasFood'] ?? false,
      usedCount: point['usedCount'] ?? 0,
      notes: point['notes'] ?? '',
      imageUrl: point['imageUrl'] ?? '',
      location: point['location'] ?? null,
      tags: point['tags'] ?? [],
      foodItems: point['foodItems'] ?? [],
    );
  }

  factory FridgePoint.fromFirestore(DocumentSnapshot docSnap) {
    Map point = docSnap.data;
    return FridgePoint(
      name: point['name'] ?? 'Fridge Point',
      placeId: point['placeId'] ?? 'ujhfujhfohndejfnh',
      open: point['open'] ?? false,
      hasFood: point['hasFood'] ?? false,
      usedCount: point['usedCount'] ?? 0,
      notes: point['notes'] ?? '',
      imageUrl: point['imageUrl'] ?? '',
      location: point['location'] ?? GeoPoint(0, 0),
      tags: point['tags'] ?? [],
      foodItems: point['foodItems'] ?? [],
    );
  }
}
