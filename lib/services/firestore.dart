import 'package:buffetlocator/models/fridge_point.dart';
import 'package:buffetlocator/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase implements Database {
  final Firestore _db = Firestore.instance;

  Stream<List<FridgePoint>> fridgeStream() {
    return _db.collection('Fridges').snapshots().map((list) {
      return list.documents.map((docSnap) {
        return FridgePoint.fromFirestore(docSnap);
      }).toList();
    });
  }
}
