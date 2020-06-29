import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

Future<double> getDistance(LatLng p1, LatLng p2) async {
  var distance = await Geolocator().distanceBetween(
    p1.latitude,
    p1.longitude,
    p2.latitude,
    p2.longitude,
  );

  distance /= 1000;
  return distance;

}
