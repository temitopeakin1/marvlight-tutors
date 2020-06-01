import 'package:firebase_database/firebase_database.dart';

class Tutor {
  String key;
  String name = '';
  String phone = '';
  String state = '';
  String email = '';
  String selectedSubjectList = '';
  String selectedGrade = '';
  String gender = '';
  String address = '';


Tutor(this.name, this.phone, this.state, this.email, this.selectedSubjectList, this.selectedGrade, this.gender, this.address);


Tutor.fromSnapshot(DataSnapshot snapshot)
  : key = snapshot.key,
    name = snapshot.value["name"],
    phone = snapshot.value["phone"],
    state = snapshot.value["state"],
    email = snapshot.value["email"],
    selectedSubjectList = snapshot.value["selectedSubjectList"],
    selectedGrade = snapshot.value["selectedGrade"],
    gender = snapshot.value["gender"],
    address = snapshot.value["address"];

  List<String> get selectedList => null;

toJson() {
      return {
        "name": name,
        "phone": phone,
        "state": state,
        "email": email,
        "selectedSubjectList": selectedSubjectList,
        "selectedGrade": selectedGrade,
        "gender": gender,
        "address": address,
       };
    }
  }

 













