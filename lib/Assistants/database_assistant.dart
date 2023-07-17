import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseAssistant {
  static CollectionReference comingsoonCollection =
      FirebaseFirestore.instance.collection('Comingsoon Email');

  static Future<void> EmailComingsoon(String id, String email) async {
    await comingsoonCollection.doc(id).set({'email': email});
  }
}
