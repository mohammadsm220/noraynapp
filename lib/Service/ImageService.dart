
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'ImageStream.dart';

class ImageService {
  final Firestore _db = Firestore.instance;

  /// Get a stream of a single document
  Stream<List<ImagesStream>> streamImages() {
    return _db.collection('Image').snapshots()
    .map((snap) => snap.documents.map((e) => ImagesStream.fromMap(e.data)).toList());
    
  }
}