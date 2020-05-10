
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'SalesStream.dart';

class SalesService {
  final Firestore _db = Firestore.instance;

  /// Get a stream of a single document
  Stream<List<SalesStream>> streamImages() {
    return _db.collection('Sales').snapshots()
    .map((snap) => snap.documents.map((e) => SalesStream.fromMap(e.data)).toList());
    
  }
}