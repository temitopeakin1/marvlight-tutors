import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvapp/models/tutor.dart';




void main() => runApp(new Marvlighttutorform());

// creating a SecondMultiSelectChip class (subjects)

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(this.reportList, {this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

final mainReference = FirebaseDatabase.instance.reference();
class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
List<String> selectedChoices = List();
final mainReference = FirebaseDatabase.instance.reference();
  _buildChoiceList() {
    List<Widget> choices = List();

    widget.reportList.forEach((subject) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(subject),
          selected: selectedChoices.contains(subject),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(subject)
                  ? selectedChoices.remove(subject)
                  : selectedChoices.add(subject);
              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    });

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}


class Marvlighttutorform extends StatefulWidget {
  Marvlighttutorform({Key key, this.tutor, String title,}) : super(key: key);
final Tutor tutor;
@override
  _MarvlighttutorformState createState() => new _MarvlighttutorformState();
}

class _MarvlighttutorformState extends State<Marvlighttutorform>  {
List<Tutor> tutors = List();
Tutor tutor;
DatabaseReference tutorRef;

final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

List<String> subjectList = <String>['Biology','Coding', 'Commerce',
   'Chemisty','English Language','Economics','Further-Mathematics','Fin.Accounting', 
   'Physics','Lit-In-English','Graphic Design','Government','Geography', 
   'General Mathematics','Music','JAMB prep.class','ICAN','SAT','TOEFL','Daily Assist.Assignment',
  'Make-Up'];
List<String> _selectedGrades = <String>['','Grade A', 'Grade B', 'Grade C', 'Grade D'];  
List<String> _genders = <String>['', 'Male', 'Female'];
String _gender = '';
String _selectedGrade = '';
String subjectLists = '';


List<String> selectedSubjectList = List();


_showReportDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Choose your Subject(s)", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),),
            content: Container(
              constraints: BoxConstraints(
                maxHeight: 200,
              ),
              child: SingleChildScrollView(
                child: MultiSelectChip(
                  subjectList,
                    onSelectionChanged: (selectedlist) {
                setState(() {
                  selectedSubjectList = selectedlist;      
               });
              },
                ),
              ),
            ), 
            actions: <Widget>[
              FlatButton(
                child: Text("Confirm", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

get app => null;

@override
void initState() {
  super.initState();
  
tutor = Tutor("","","","","","","","");
  final FirebaseDatabase database = FirebaseDatabase(app: app);
  tutorRef = database.reference().child('Tutors');
  tutorRef.onChildAdded.listen(_onEntryAdded);
  tutorRef.onChildAdded.listen(_onEntryChanged); 
}

_onEntryAdded(Event event) {
  setState(() {
    tutors.add(Tutor.fromSnapshot(event.snapshot));
  });
}

_onEntryChanged(Event event) {
  var old = tutors.singleWhere((entry) => entry.key == event.snapshot.key); {
 }
  setState(() {
    tutors[tutors.indexOf(old)] = Tutor.fromSnapshot(event.snapshot);
  });
}




Tutor newContact = new Tutor("name", "phone", "state", "email", "subject", "selectedGrade", "gender", "address");

String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    }  if(value.length != 10){
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
 
void submitForm() {
    final FormState form = _formKey.currentState;
   


    if (form.validate()) {
          form.save();
          form.reset();
          tutorRef.push().set(tutor.toJson());
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
          title: Text('Marvlight Tutors', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Comic Sans', fontSize: 25.0,),
          ),
           ),
    backgroundColor: Colors.white,
      key: _scaffoldKey,
    body: Container(
       child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(30, 25, 25, 25), 
                child: Column(
                children: <Widget>[
                  Text('Tutor Application form', 
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, fontFamily: 'Montserrat')),
                   Text('(*Kindly fill the required)',
                   textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, fontFamily: 'JosefinSans-Bold', color: Colors.red)),
                  
                 
                  Padding(
                   padding: EdgeInsets.only(top: 30.0)),
                    new TextFormField(
                    decoration: new InputDecoration(
                    icon: const Icon(Icons.person, color: Colors.deepPurple, size: 25.0,),
                    labelText: 'Full Name*', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,  fontFamily: 'Montserrat'),
                   hintText: 'Surname first', hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,  fontFamily: 'Montserrat'),
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
                    inputFormatters: [new LengthLimitingTextInputFormatter(50)],
                    validator: (val) => val.isEmpty ? 'Name is required' : null,
                    onSaved: (val) => tutor.name = val,
            ),
                  
               Padding(
                padding: EdgeInsets.only(top: 30.0)),
                new FormField<String>(
                builder: (FormFieldState<String> state) {
                return InputDecorator(
                decoration: InputDecoration(
                icon: const Icon(Icons.person_outline, color: Colors.deepPurple, size: 25.0,),
                labelText: 'Gender*',
                labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,  fontFamily: 'Montserrat'),
                fillColor: Colors.blue,
                border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: new BorderSide(
                style:  BorderStyle.solid,
                color: Colors.blue,
                width: 10,
              ),
            ),
                errorText: state.hasError ? state.errorText : null,
         ),
                isEmpty: _gender == '',
                child: new DropdownButtonHideUnderline(
                child: new DropdownButton(
                style: TextStyle(color: Colors.black, fontSize: 15.0,  fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                value: _gender,
                isDense: true,
                isExpanded: false,
                onChanged: (String newValue) {
                setState(() {
                tutor.gender = newValue;
                _gender= newValue;
                state.didChange(newValue);
            });
          },
                items: _genders.map((String value) {
                return new DropdownMenuItem(
                value: value,
                child: new Text(value),
              );
          }).toList(),
        ),
      ),
    );
   },
                validator: (val) {
                return val != '' ? null : 'Please select a gender';
              }),

                Padding(
                  padding: EdgeInsets.only(top: 30.0)),
                  new TextFormField(
                  decoration: new InputDecoration(
                  icon: const Icon(Icons.add_location, color: Colors.deepPurple, size: 25.0,),
                  labelText: 'Address*', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,  fontFamily: 'Montserrat'),
                  hintText: 'Current address', hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
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
                  validator: (val) => val.isEmpty ? 'Address Number is required' : null,
                   onSaved: (val) => tutor.address = val,

          ),

                Padding(
                  padding: EdgeInsets.only(top: 30.0)),
                  new TextFormField(
                  decoration: new InputDecoration(
                  icon: const Icon(Icons.add_location, color: Colors.deepPurple, size: 25.0,),
                  labelText: 'State of Residence*', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,  fontFamily: 'Montserrat'),
                  hintText: 'e.g Lagos, Ogun, Oyo e.t.c', hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,  fontFamily: 'Montserrat'),
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
                  validator: (val) => val.isEmpty ? 'State is required' : null,
                  onSaved: (val) => tutor.state = val,
          ),
                                                      
       
              Padding(
                  padding: EdgeInsets.only(top: 30.0)),
                new TextFormField(
                  decoration: new InputDecoration(
                  icon: const Icon(Icons.phone, color: Colors.deepPurple, size: 25.0,),
                  labelText: 'Phone Number*', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,  fontFamily: 'Montserrat'),
                  hintText: 'Valid Phone number', hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,  fontFamily: 'Montserrat'),
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
                  validator: (val) => val.isEmpty || val.length != 11 ? 'Phone Number is required' : null,
                   onSaved: (val) => tutor.phone = val,
          ),   
               
              Padding(
                  padding: EdgeInsets.only(top: 30.0)),
                new TextFormField(
                  decoration: new InputDecoration(
                  icon: const Icon(Icons.email, color: Colors.deepPurple, size: 25.0,),
                  labelText: 'E-mail*', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,  fontFamily: 'Montserrat'),
                  hintText: 'Enter Valid E-mail', hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,  fontFamily: 'Montserrat'),
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
                  tutor.email = val;
          }),
                                                   
             
       
       Padding(
           padding: EdgeInsets.only(top: 10.0)),
           Container(
               width : 700,
               height: 75,
                padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                 child: new RaisedButton(
                    child: Text('Subject(s) to Tutor*',  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,  fontFamily: 'Montserrat' )),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                    
                       onPressed: () => _showReportDialog(),
                        )),
                    Text(selectedSubjectList.join(" , ")),
                  

                  
          Container(
                 padding: const EdgeInsets.only(left: 40.0, top: 10.0),
                      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                        alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              text: 'Grade A : ', style: TextStyle(fontWeight: FontWeight.bold,  fontFamily: 'Montserrat', color: Colors.deepPurple),
                              children: <TextSpan>[
                               TextSpan(text: ' Masters Holder with 6 years Teaching Experience or a Bachelors Degree with 12 Years experience in a particular teaching Subject',
                               style: TextStyle(fontWeight: FontWeight.bold,  fontFamily: 'Montserrat', color: Colors.black)),
                              ]
                            )
                         ), 
                      ),
               
               Container(
                 padding: const EdgeInsets.only(left: 40.0, top: 10.0),
                      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                        alignment: Alignment.center,
                           child: RichText(
                            text: TextSpan(
                              text: 'Grade B : ', style: TextStyle(fontWeight: FontWeight.bold,  fontFamily: 'Montserrat', color: Colors.deepPurple),
                              children: <TextSpan>[
                               TextSpan(text: ' Bachelors/HND with 5years Teaching experience and above',
                               style: TextStyle(fontWeight: FontWeight.bold,  fontFamily: 'Montserrat', color: Colors.black)),
                              ]
                            )
                         ), 
                      ),
               Container(
                 padding: const EdgeInsets.only(left: 40.0, top: 10.0),
                      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                        alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              text: 'Grade C : ', style: TextStyle(fontWeight: FontWeight.bold,  fontFamily: 'Montserrat', color: Colors.deepPurple),
                              children: <TextSpan>[
                               TextSpan(text: ' Fresh Graduate Bachelors Degree/HND Holders',
                               style: TextStyle(fontWeight: FontWeight.bold,  fontFamily: 'Montserrat', color: Colors.black)),
                              ]
                            )
                         ), 
                      ),
               Container(
                    padding: const EdgeInsets.only(left: 40.0, top: 10.0),
                      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
                        alignment: Alignment.center,
                           child: RichText(
                            text: TextSpan(
                              text: 'Grade D : ', style: TextStyle(fontWeight: FontWeight.bold,  fontFamily: 'Montserrat', color: Colors.deepPurple),
                              children: <TextSpan>[
                               TextSpan(text: ' NCE Holders with 5 years Experience',
                               style: TextStyle(fontWeight: FontWeight.bold,  fontFamily: 'Montserrat', color: Colors.black)),
                              ]
                            )
                         ), 
                      ),
                  
          Padding(
                padding: EdgeInsets.only(top: 30.0)),
                new FormField<String>(
                builder: (FormFieldState<String> state) {
                return InputDecorator(
                decoration: InputDecoration(
                icon: const Icon(Icons.star, color: Colors.deepPurple, size: 25.0,),
                labelText: 'Grade that applies to you*',
                labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,  fontFamily: 'Montserrat'),
                fillColor: Colors.blue,
                border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: new BorderSide(
                style:  BorderStyle.solid,
                color: Colors.blue,
                width: 10,
              ),
            ),
                errorText: state.hasError ? state.errorText : null,
         ),
                isEmpty: _selectedGrade == '',
                child: new DropdownButtonHideUnderline(
                child: new DropdownButton(
                style: TextStyle(color: Colors.black, fontSize: 15.0,  fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                value: _selectedGrade,
                isDense: true,
                isExpanded: false,
                onChanged: (String newValue) {
                setState(() {
                tutor.selectedGrade = newValue;
                _selectedGrade = newValue;
                state.didChange(newValue);
            });
          },
                items: _selectedGrades.map((String value) {
                return new DropdownMenuItem(
                value: value,
                child: new Text(value),
              );
          }).toList(),
        ),
      ),
    );
   },
                validator: (val) {
                return val != '' ? null : 'Please select a grade';
              }),
                    

            Padding(
                  padding: EdgeInsets.only(top: 30.0)),     
                  new TextFormField(
                    maxLength: 100,
                    maxLines: 5,
                    decoration: new InputDecoration(
                    icon: const Icon(Icons.class_, color: Colors.deepPurple, size: 25.0,),
                    labelText: 'Short Biography about yourself*', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,  fontFamily: 'Montserrat'),
                    hintText: 'e.g. I am a Christain and currently Teaching with Best Brains School, and my Major goal is to bring out the best in every weak student ', 
                    hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
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
            ),
                                    
        new Container(
                width : 700,
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                        color: Colors.redAccent,
                        child: const Text('Submit',  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),),
                         shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                        onPressed: submitForm,
                      )),
                   ],
              ))),
        )
    );
  }
 
}

