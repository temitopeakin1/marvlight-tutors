// ignore: unused_import
import 'package:firebase_database/firebase_database.dart';

class Researcher {
  String key;
  String name = '';
  String topic = '';
  String programme = '';
  String institution = '';
  String address = '';
  String phone = '';
  String email = '';

// constructor for the class
  Researcher(this.name, this.topic, this.programme, this.institution,
      this.address, this.phone, this.email);

  Researcher.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        name = snapshot.value["name"],
        topic = snapshot.value["topic"],
        programme = snapshot.value["programme"],
        institution = snapshot.value["institution"],
        address = snapshot.value["address"],
        phone = snapshot.value["phone"],
        email = snapshot.value["email"];

  toJson() {
    return {
      "name": name,
      "topic": topic,
      "programme": programme,
      "institution": institution,
      "address": address,
      "phone": phone,
      "email": email,
    };
  }
}

class DataSnapshot {
  var value;

  get key => null;
}
