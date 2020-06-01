 
import 'package:firebase_database/firebase_database.dart';

class Parent {
  String key;
  String pname = '';
  String cname = '';
  String startDate;
  String phone = '';
  String state = '';
  String email = '';
  String selectedSubjectList = '';
  String selectedGrade = '';
  String gender = '';
  String month  = '';
  String selectedDayList = '';
  String address = '';


  Parent(this.pname, this.cname, this.startDate, this.phone, this.state, this.email, this.selectedSubjectList, this.selectedGrade, this.gender, this.month, this.selectedDayList, this.address);

  
Parent.fromSnapshot(DataSnapshot snapshot)
  : key = snapshot.key,
    pname = snapshot.value["pname"],
    cname = snapshot.value["cname"],
    startDate = snapshot.value["startDate"],
    phone = snapshot.value["phone"],
    state = snapshot.value["state"],
    email = snapshot.value["email"],
    selectedSubjectList = snapshot.value["selectedSubjectList"],
    selectedGrade = snapshot.value["selectedGrade"],
    gender = snapshot.value["gender"],
    month = snapshot.value["month"],
    selectedDayList = snapshot.value["selectedDayList"],
    address = snapshot.value["address"];
  
toJson() {
      return {
        "pname": pname,
        "cname": cname,
        "startDate": startDate,
        "phone": phone,
        "state": state,
        "email": email,
        "selectedSubjecList": selectedSubjectList,
        "selectedGrade": selectedGrade,
        "gender": gender,
        "month": month,
        "selectedDayList": selectedDayList,
        "address": address,
      };
    }
  }

 