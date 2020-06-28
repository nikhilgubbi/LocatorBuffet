import 'package:buffetlocator/models/fridge_point.dart';
import 'package:buffetlocator/services/abstract_data.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MockDataService implements DataServiceAbstract {

  @override
  Future<List<FridgePoint>> getData() {
    return Future.value([
      FridgePoint(
        name: 'Location 1',
        hasFood: true,
        open: true,
        notes: 'Food available',
        imageUrl: '',
        usedCount: 412,
        tags: ['Tag 1', 'Tag 2'],
        foodItems: ['Food 1', 'Food 2'],
        location: LatLng(40.7138, -74.00670),
      ),
      FridgePoint(
        name: 'Location 2',
        hasFood: true,
        open: true,
        notes: 'Food available',
        imageUrl: '',
        usedCount: 412,
        tags: ['Tag 1', 'Tag 2'],
        foodItems: ['Food 1', 'Food 2'],
        location: LatLng(40.7118, -74.00770),
      ),
      FridgePoint(
        name: 'Location 3',
        hasFood: true,
        open: true,
        notes: 'Food available',
        imageUrl: '',
        usedCount: 412,
        tags: ['Tag 1', 'Tag 2'],
        foodItems: ['Food 1', 'Food 2'],
        location: LatLng(40.7178, -74.00600),
      ),
      FridgePoint(
        name: 'Location 4',
        hasFood: true,
        open: true,
        notes: 'Food available',
        imageUrl: '',
        usedCount: 412,
        tags: ['Tag 1', 'Tag 2'],
        foodItems: ['Food 1', 'Food 2'],
        location: LatLng(40.7128, -74.00130),
      ),
      FridgePoint(
        name: 'Location 5',
        hasFood: true,
        open: true,
        notes: 'Food available',
        imageUrl: '',
        usedCount: 412,
        tags: ['Tag 1', 'Tag 2'],
        foodItems: ['Food 1', 'Food 2'],
        location: LatLng(40.7128, -74.00530),
      ),
      FridgePoint(
        name: 'Location 6',
        hasFood: true,
        open: true,
        notes: 'Food available',
        imageUrl: '',
        usedCount: 412,
        tags: ['Tag 1', 'Tag 2'],
        foodItems: ['Food 1', 'Food 2'],
        location: LatLng(40.7158, -74.00350),
      ),
    ]);
  }
}
