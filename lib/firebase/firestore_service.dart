import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreService {
  FirebaseFirestore get _db {
    if (Firebase.apps.isEmpty) {
      throw FirebaseException(
        plugin: 'firestore',
        message: 'Firebase has not been initialized. Please check your configuration.',
      );
    }
    return FirebaseFirestore.instance;
  }

  Future<void> saveContactMessage({
    required String name,
    required String email,
    required String phone,
    required String message,
  }) async {
    try {
      await _db.collection('contact_messages').add({
        'name': name,
        'email': email,
        'phone': phone,
        'message': message,
        'submittedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      rethrow;
    }
  }
}
