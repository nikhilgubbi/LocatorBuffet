import 'package:buffetlocator/services/database.dart';
import 'package:buffetlocator/models/fridge_point.dart';

class MockDatabase implements Database {
  List<Map> _mockData = [
    {
      'name': 'Location 1',
      'hasFood': true,
      'open': true,
      'notes': 'Food available',
      'imageUrl': '',
      'usedCount': 412,
      'tags': ['Tag 1', 'Tag 2'],
      'foodItems': ['Food 1', 'Food 2'],
      'location': {40.7138, -74.0067},
    },
    {
      'name': 'Location 2',
      'hasFood': true,
      'open': true,
      'notes': 'Food available',
      'imageUrl': '',
      'usedCount': 412,
      'tags': ['Tag 1', 'Tag 2'],
      'foodItems': ['Food 1', 'Food 2'],
      'location': {40.7128, -74.0167},
    },
    {
      'name': 'Location 3',
      'hasFood': true,
      'open': true,
      'notes': 'Food available',
      'imageUrl': '',
      'usedCount': 412,
      'tags': ['Tag 1', 'Tag 2'],
      'foodItems': ['Food 1', 'Food 2'],
      'location': {40.7131, -74.0063},
    },
    {
      'name': 'Location 4',
      'hasFood': true,
      'open': true,
      'notes': 'Food available',
      'imageUrl': '',
      'usedCount': 412,
      'tags': ['Tag 1', 'Tag 2'],
      'foodItems': ['Food 1', 'Food 2'],
      'location': {40.7138, -74.0117},
    },
    {
      'name': 'Location 5',
      'hasFood': true,
      'open': true,
      'notes': 'Food available',
      'imageUrl': '',
      'usedCount': 412,
      'tags': ['Tag 1', 'Tag 2'],
      'foodItems': ['Food 1', 'Food 2'],
      'location': {40.7133, -74.0070},
    },
    {
      'name': 'Location 6',
      'hasFood': true,
      'open': true,
      'notes': 'Food available',
      'imageUrl': '',
      'usedCount': 412,
      'tags': ['Tag 1', 'Tag 2'],
      'foodItems': ['Food 1', 'Food 2'],
      'location': {40.7127, -74.0970},
    },
  ];

  Stream<List<Map>> dataStream() async* {
    List<Map> _data;
    yield _data;
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      if (_data != _mockData) {
        _data = _mockData;
        yield _data;
      }
    }
  }

  Stream<List<FridgePoint>> fridgeStream() {
    var snapshot;
    dataStream().listen((snap) => snapshot = snap);
    return snapshot?.map((point) => FridgePoint.fromMap(point));
  }
}
