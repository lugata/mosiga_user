import 'package:firebase_database/firebase_database.dart';
import 'package:mosiga_users/global/global.dart';
import 'package:mosiga_users/models/user_models.dart';

class AssistantMethods {
  static void readCurrentOnlineUserInfo() async {
    currentUser = firebaseAuth.currentUser;
    DatabaseReference userRef =
        FirebaseDatabase.instance.ref().child("users").child(currentUser!.uid);

    userRef.once().then((snap) {
      if (snap.snapshot.value != null) {
        userModelCurrentInfo = UserModels.fromSnapshot(snap.snapshot);
      }
    });
  }
}
