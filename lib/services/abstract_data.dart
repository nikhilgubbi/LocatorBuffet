import 'package:buffetlocator/models/fridge_point.dart';

abstract class DataServiceAbstract {
  Future<List<FridgePoint>> getData();
}
