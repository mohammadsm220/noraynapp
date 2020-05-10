import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'NewsStream.dart';

class DatabaseService {
  final Firestore _db = Firestore.instance;

  /// Get a stream of a single document
  Stream<List<News>> streamNews() {
    return _db.collection('News').snapshots()
    .map((snap) => snap.documents.map((e) => News.fromMap(e.data)).toList());
    
  }
}