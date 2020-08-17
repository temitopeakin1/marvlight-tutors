import 'package:firebase_database/firebase_database.dart';

class Researcher{
  String key;
  String topic = '';
  String programme = '';
  String institution = '';
  String supervisorname = '';
  String phone = '';
  String email = '';
 
// constructor for the class
 Researcher(this.topic, this.programme, this.institution, this.supervisorname, this.phone, this.email);

Researcher.fromSnapshot(DataSnapshot snapshot)
  : key = snapshot.key,
    topic = snapshot.value["topic"],
    programme = snapshot.value["programme"],
    institution = snapshot.value["institution"],
    supervisorname = snapshot.value["supervisorname"],
    phone = snapshot.value["phone"],
    email = snapshot.value["email"];
    
  
 toJson() {
      return {
        "topic": topic,
        "programme": programme,
        "institution": institution,
        "supervisorname": supervisorname,
        "phone": phone,
        "email": email,
       };
    }
  }



