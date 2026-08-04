import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

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
