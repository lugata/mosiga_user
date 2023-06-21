import 'package:firebase_database/firebase_database.dart';

class UserModels {
  String? id;
  String? name;
  String? phone;
  String? email;
  String? address;

  UserModels({this.id, this.name, this.phone, this.email, this.address});

  UserModels.fromSnapshot(DataSnapshot snap) {
    id = snap.key;
    name = (snap.value as dynamic)["name"];
    phone = (snap.value as dynamic)["phone"];
    email = (snap.value as dynamic)["email"];
    address = (snap.value as dynamic)["address"];
  }
}
