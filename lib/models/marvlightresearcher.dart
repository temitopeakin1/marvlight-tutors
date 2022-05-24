import 'package:firebase_database/firebase_database.dart';

class Marvlightresearcher {
  String key;
  String id = '';
  String name = '';
  String phone = '';
  String state = '';
  String email = '';
  String qualification = '';
  String gender = '';
  String institution = '';

// constructor for the class
  Marvlightresearcher(this.name, this.phone, this.state, this.email,
      this.qualification, this.gender, this.institution);

  Marvlightresearcher.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        name = snapshot.value["name"],
        phone = snapshot.value["phone"],
        state = snapshot.value["state"],
        email = snapshot.value["email"],
        qualification = snapshot.value["qualification"],
        gender = snapshot.value["gender"],
        institution = snapshot.value["institution"];

  toJson() {
    return {
      "name": name,
      "phone": phone,
      "state": state,
      "email": email,
      "qualification": qualification,
      "gender": gender,
      "institution": institution,
    };
  }
}
