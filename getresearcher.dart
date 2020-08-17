import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:marvapp/models/researcher.dart';





 void main() => runApp(new Getresearcherform());

class Getresearcherform extends StatefulWidget {
Getresearcherform({Key key, this.researcher, String title,}) : super(key: key);
final Researcher researcher;
@override
  _GetresearcherformState createState() => new _GetresearcherformState();
}

final mainReference = FirebaseDatabase.instance.reference();

class _GetresearcherformState extends State<Getresearcherform>  {
List<Researcher> researchers = List();
Researcher researcher;
DatabaseReference researcherRef;
final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();    

@override
void initState() {
super.initState();
  
researcher = Researcher("","","","","","");
  final FirebaseDatabase database = FirebaseDatabase();
  researcherRef = database.reference().child('Researchers');
  researcherRef.onChildAdded.listen(_onEntryAdded);
  researcherRef.onChildAdded.listen(_onEntryChanged); 
  
}

_onEntryAdded(Event event) {
  setState(() {
    researchers.add(Researcher.fromSnapshot(event.snapshot));
  });
}

_onEntryChanged(Event event) {
  var old = researchers.singleWhere((entry) => entry.key == event.snapshot.key); {
 }
  setState(() {
    researchers[researchers.indexOf(old)] = Researcher.fromSnapshot(event.snapshot);
  });
}

Researcher newContact = new Researcher("topic", "programme", "institution","supervisorname", "phone", "email");
final TextEditingController _controller = new TextEditingController();

  

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if(value.length != 10){
      return "Mobile number must 11 digits";
    }else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }


   String validateEmail(String value) {
    Pattern pattern =
     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

void showMessage(String message, [MaterialColor color = Colors.blue]) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text('Form Submitted Succesfully', style: TextStyle(fontSize: 15.0))));
  }
 
void _submitForm() {
    final FormState form = _formKey.currentState;

    if (form.validate()) {
          form.save();
          form.reset();
          researcherRef.push().set(researcher.toJson());
      showMessage('OOPS! iNCOMPLETE DETAILS!  Please complete the Form.');
    } else {
      form.save(); 
     // invokes an OnSaved event
    }
}
@override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: AppBar( backgroundColor: Colors.blue,
          centerTitle: true, 
          title: Text('Marvlight Tutors', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Comic Sans', fontSize: 25.0),
          )),
      backgroundColor: Colors.white,
          key: _scaffoldKey,
            body: Container(
              child: new Form(
               key: _formKey,
                autovalidate: true,
                 child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(30, 25, 25, 25),
                   child: new Column(
          children: <Widget>[
             Text('Get a Researcher',
              textAlign: TextAlign.center,
               style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500,  fontFamily: 'Montserrat')),
               Text('(*Kindly fill the required)',
               textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, fontFamily: 'JosefinSans-Bold', color: Colors.red)),

           Padding(
                   padding: EdgeInsets.only(top: 30.0)),
                  new TextFormField(
                    maxLength: 500,
                    maxLines: 6,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.title, color: Colors.deepPurple, size: 25.0,),
                      hintText: 'Detailed Project topic*', hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                      labelText: 'Project Topic*', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,  fontFamily: 'Montserrat'),
                       fillColor: Colors.blue,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                           borderSide: new BorderSide(
                            style:  BorderStyle.solid,
                              color: Colors.blue,
                              width: 10,
                    ),
                  ),
                ),
                controller: _controller,
                        validator: (val) => val.isEmpty ? 'Project topic is required' : null,
                         onSaved: (val) => researcher.topic = val,
                  ),
                                                     
           Padding(
                   padding: EdgeInsets.only(top: 30.0)), 
               new TextFormField(
                    decoration: InputDecoration(
                      icon: const Icon(Icons.library_books, color: Colors.deepPurple, size: 25.0,),
                      hintText: 'Bsc,Computer Science',  hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,  fontFamily: 'Montserrat'),
                      labelText: 'Programme that you are running *', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                       fillColor: Colors.blue,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(
                              style:  BorderStyle.solid,
                                color: Colors.blue,
                                  width: 10,
                    ),
                  ),
                     ),
                     validator: (val) => val.isEmpty ? 'Programme name is required' : null,
                      onSaved: (val) => researcher.programme = val,
  
                  ),
                                                   
            Padding(
                   padding: EdgeInsets.only(top: 30.0)),
                 new TextFormField(
                    maxLength: 70,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.add_location, color: Colors.deepPurple, size: 25.0,),
                      hintText: 'e.g University of Lagos, Yaba College of Technology',  hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                      labelText: 'Institution*', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                       fillColor: Colors.blue,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(
                              style:  BorderStyle.solid,
                                color: Colors.blue,
                                  width: 10,
                        ),
                     ),
                    ),
                      validator: (val) => val.isEmpty ? 'Institution name is required' : null,
                      onSaved: (val) => researcher.institution = val,
                  ),

            Padding(
                   padding: EdgeInsets.only(top: 30.0)),     
                new TextFormField(
                     decoration: InputDecoration(
                      icon: const Icon(Icons.person, color: Colors.deepPurple, size: 25.0,),
                      hintText: 'Enter Supervisor\'s name',hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                      labelText: 'Project Supervisor\'s Name*', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                        fillColor: Colors.blue,
                         border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(
                              style:  BorderStyle.solid,
                                color: Colors.blue,
                                  width: 10,
                        ),
                     ),
                       ),
                      validator: (val) => val.isEmpty ? 'Supervisors name is required' : null,
                       onSaved: (val) => researcher.supervisorname = val,
                  ),
          Padding(
                   padding: EdgeInsets.only(top: 30.0)), 
                     new TextFormField(
                         decoration: InputDecoration(
                          icon: const Icon(Icons.phone_android, color: Colors.deepPurple, size: 25.0,),
                          hintText: 'Enter Valid Phone Number',hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                          labelText: 'Phone Number*', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                          fillColor: Colors.blue,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                                borderSide: new BorderSide(
                                  style:  BorderStyle.solid,
                                    color: Colors.blue,
                                      width: 10,
                        ),
                     ),
                  ),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                          new WhitelistingTextInputFormatter(new RegExp(r'^[()\d -]{1,11}$')),
                        ],
                      validator: (val) => val.isEmpty || val.length != 11? 'Phone Number is required' : null,
                        onSaved: (val) => researcher.phone = val,
                   ),

                                                      
          Padding(
                   padding: EdgeInsets.only(top: 30.0)), 
                  new TextFormField(
                     decoration:  InputDecoration(
                      icon: const Icon(Icons.email, color: Colors.deepPurple, size: 25.0,),
                      hintText: 'Enter your email address', hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                      labelText: 'Email', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                      fillColor: Colors.blue,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                                borderSide: new BorderSide(
                                  style:  BorderStyle.solid,
                                    color: Colors.blue,
                                      width: 10,
                        ),
                     ),
                   ),
                        validator: validateEmail,
                       onSaved: (String val) {
                       researcher.email = val;
                        }),
             Container(
               width : 700,
                padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                 child:  RaisedButton(
                 splashColor: Colors.red,
                  color: Colors.redAccent,
                   child: const Text('Submit',  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                       onPressed:  _submitForm,
                    )),
                  ],
               ))),
            ),
         );
      }
   }


