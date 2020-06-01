
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvapp/models/parent.dart';
import 'dart:async';
import 'package:intl/intl.dart';



        
void main() => runApp(new Marvlightparentform());

// creating a MultiSelectChip class 
class MultiSelectChip extends StatefulWidget {
  final List<String> days;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(this.days, {this.onSelectionChanged}); // + added

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}


class _MultiSelectChipState extends State<MultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = List();
  final mainReference = FirebaseDatabase.instance.reference();
 List<String> selectedDay = List();
 _buildChoiceList() {
    List<Widget> choices = List();
    widget.days.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
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

// creating a Second MultiSelectChip class 
class SecondMultiSelectChip extends StatefulWidget {
  final List<String> subjects;
  final Function(List<String>) onSelectionChanged;

  SecondMultiSelectChip(this.subjects, {this.onSelectionChanged}); // + added

  @override
  _SecondMultiSelectChipState createState() => _SecondMultiSelectChipState();
}


class _SecondMultiSelectChipState extends State<SecondMultiSelectChip> {
  // String selectedChoice = "";
  List<String> selectedChoices = List();
 
  List<String> selectedSubject = List();
 _buildChoiceList() {
    List<Widget> choices = List();
    widget.subjects.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
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

class Marvlightparentform extends StatefulWidget {
Marvlightparentform({Key key, this.parent, String title,}) : super(key: key);
final Parent parent;
@override
  _MarvlightparentformState createState() => new _MarvlightparentformState();
}

final mainReference = FirebaseDatabase.instance.reference();

class _MarvlightparentformState extends State<Marvlightparentform>  {
List<Parent> parents = List();
Parent parent;
DatabaseReference parentRef;
final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


List<String> subjectList = ['Basic Classes','Biology','Coding','Chemisty','Commerce', 'English Language', 'Economics', 'F/Maths', 'Fin.Accounting',
  'Physics', 'Lit-In-English', 'Graphic Design', 'Govt', 'Geography','Mathematics', 'Music', 'JAMB prep.Class', 'ICAN', 'SAT', 'TOEFL',
  'Daily Assistant Assignment'];
  List<String> _months = <String>['','1','2', '3', '4', '5'];
  List<String> day = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  List<String> _selectedGrades = <String>['','Grade A', 'Grade B', 'Grade C', 'Grade D'];  
  List<String> _genders = <String>['', 'Male', 'Female'];
  String _month = '';
  String _gender = '';
  String _selectedGrade = '';
  String subjectLists= '';
  String days='';


List<String> selectedDayList = List();
get app => null;

 
_showReportDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // Building the content of the dialog
          return AlertDialog(
            title: Text("Choose your Preference(s)", style: TextStyle( fontFamily: 'Montserrat')),
            content: MultiSelectChip(
              day,
              onSelectionChanged: (selectedList) {
                setState(() {
                  selectedDayList = selectedList;
                });
              },
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Confirm", style: TextStyle( fontFamily: 'Montserrat')),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }
List<String> selectedSubjectList = List();
_secondShowReportDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          //Here we will build the content of the dialog
          return AlertDialog(
            title: Text("Choose your Subject(s)", style: TextStyle( fontFamily: 'Montserrat')),
            content: MultiSelectChip(
              subjectList,
              onSelectionChanged: (selectedList) {
                setState(() {
                  selectedSubjectList = selectedList;
                });
              },
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Confirm", style: TextStyle( fontFamily: 'Montserrat')),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }




@override
void initState() {
  super.initState();
  
parent = Parent("", "", "", "", "", "", "", "", "", "", "", "");
  final FirebaseDatabase database = FirebaseDatabase(app: app);
  parentRef = database.reference().child('Parents');
  parentRef.onChildAdded.listen(_onEntryAdded);
  parentRef.onChildAdded.listen(_onEntryChanged); 
  
 }

_onEntryAdded(Event event) {
  setState(() {
    parents.add(Parent.fromSnapshot(event.snapshot));
  });
}

_onEntryChanged(Event event) {
  var old = parents.singleWhere((entry) => entry.key == event.snapshot.key); {
 }
  setState(() {
    parents[parents.indexOf(old)] = Parent.fromSnapshot(event.snapshot);
  });
}

Parent newContact = new Parent("pname", "cname", "startDate", "phone", "state", "email", "subject", "selectedGrade", "gender", "month", "day", "address");
final TextEditingController _controller = new TextEditingController();

Future<void> _chooseDate
    (BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now)
     ? initialDate
     : now);

 var result = await showDatePicker(
       context: context,
        initialDate: initialDate,
        firstDate: new DateTime(2020, 4),
        lastDate: new DateTime(2025, 12));
       
       if (result == null) return;
      setState(() {
        _controller.text = new DateFormat.yMd().format(result);
       });

  }
      bool isValidStartDate(String startDate) {
       if (startDate.isEmpty) return true;
       var d = convertToDate(startDate);
       return d != null && d.isBefore(new DateTime(2022, 12));
  }

      DateTime convertToDate(String input) {
      try  {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }    
  }

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
    } else if(value.length != 11){
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
          parentRef.push().set(parent.toJson());
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
          ),
    ),
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
             Text('Parent\'s Request form',
              textAlign: TextAlign.center,
               style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500,  fontFamily: 'Montserrat')),
               Text('(*Kindly fill the required)',
               textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, fontFamily: 'JosefinSans-Bold', color: Colors.red)),

           Padding(
               padding: EdgeInsets.only(top: 30.0)),
             new TextFormField(
              decoration: new InputDecoration(
              icon: const Icon(Icons.person, color: Colors.deepPurple, size: 25.0,),
              labelText: 'Parent\'s Name', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
              hintText: 'Surname first', hintStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, ),
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
              onSaved: (val) => parent.pname = val,
            ),
         Padding(
              padding: EdgeInsets.only(top: 30.0)),
              new TextFormField(
                 decoration: new InputDecoration(
                 icon: const Icon(Icons.person, color: Colors.deepPurple, size: 25.0,),
                 labelText: 'Child/Ward\'s Name', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,fontFamily: 'Montserrat'),
                 hintText: 'Surname first', hintStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                 fillColor: Colors.blue,
                 border: new OutlineInputBorder(
                 borderRadius: new BorderRadius.circular(10.0),
                 borderSide: new BorderSide(
                 style:  BorderStyle.solid,
                 color: Colors.blue, width: 10,
              ),
            ),
          ),
                 inputFormatters: [new LengthLimitingTextInputFormatter(50)],
                 validator: (val) => val.isEmpty ? 'Name is required' : null,
                 onSaved: (val) => parent.cname = val,
                ),
                                                   
           Padding(
             padding: EdgeInsets.only(top: 30.0)),
              new FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                      decoration: InputDecoration(
                      icon: const Icon(Icons.person_outline, color: Colors.deepPurple, size: 25.0,),
                      labelText: 'Gender*',
                      labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                      fillColor: Colors.blue,
                      border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      borderSide: new BorderSide(
                      style:  BorderStyle.solid,
                      color: Colors.blue, width: 10,
                    ),
                  ),
                      errorText: state.hasError ? state.errorText : null,
              ),
                      isEmpty: _gender == '',
                      child: new DropdownButtonHideUnderline(
                      child: new DropdownButton(
                      style: TextStyle(color: Colors.black, fontSize: 15.0, fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                      value: _gender,
                      isDense: true,
                      isExpanded: false,
                      onChanged: (String newValue) {
                      setState(() {
                      parent.gender = newValue;
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
                },
              ),
                                                      
              Padding(
               padding: EdgeInsets.only(top: 30.0)),
            new TextFormField(
               decoration: new InputDecoration(
               icon: const Icon(Icons.add_location, color: Colors.deepPurple, size: 25.0,),
                labelText: 'Address*', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                hintText: 'Current address', hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,  fontFamily: 'Montserrat'),
                fillColor: Colors.blue,
                border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                borderSide: new BorderSide(
                 style:  BorderStyle.solid,
                  color: Colors.blue, width: 10,
            ),
          ),
       ),
                validator: (val) => val.isEmpty ? 'Address Number is required' : null,
                  onSaved: (val) => parent.address = val,
                

          ),
                                                     
           Padding(
            padding: EdgeInsets.only(top: 30.0)),
         new TextFormField(
             decoration: new InputDecoration(
              icon: const Icon(Icons.add_location, color: Colors.deepPurple, size: 25.0,),
              labelText: 'State of Residence*', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,fontFamily: 'Montserrat'),
              hintText: 'e.g Lagos, Ogun, Oyo e.t.c', hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,  fontFamily: 'Montserrat'),
              fillColor: Colors.blue,
               border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(10.0),
                 borderSide: new BorderSide(
                  style:  BorderStyle.solid,
                   color: Colors.blue, width: 10,
               ),
             ),
          ),
              validator: (val) => val.isEmpty ? 'State is required' : null,
              onSaved: (val) => parent.state = val,
      ),
                                                      
          Padding(
             padding: EdgeInsets.only(top: 30.0)),
          new TextFormField(
              decoration: new InputDecoration(
                icon: const Icon(Icons.phone, color: Colors.deepPurple, size: 25.0,),
                  labelText: 'Phone Number*', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
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
               new WhitelistingTextInputFormatter(new RegExp(r'^[()\d -]{1,11}$'))],
                  validator: (val) => val.isEmpty || val.length != 11 ? 'Phone Number is required' : null,
                   onSaved: (val) => parent.phone = val,
             ),
                Padding(
                 padding: EdgeInsets.only(top: 30.0)),
                   new TextFormField(
                  decoration: new InputDecoration(
                   icon: const Icon(Icons.email, color: Colors.deepPurple, size: 25.0,),
                   labelText: 'E-mail*', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,fontFamily: 'Montserrat'),
                    hintText: 'Enter correct E-mail', hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,  fontFamily: 'Montserrat'),
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
                   parent.email = val;
            }),
                                                   
        Padding(
           padding: EdgeInsets.only(top: 10.0)),
           Container(
               width : 700,
               height: 75,
                padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                child: new RaisedButton(
                    child: Text('Subject(s) to Learn',  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat' )),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                       onPressed: () => _secondShowReportDialog(),
     )),
                    Text(selectedSubjectList.join(" , ")),
  
        Padding(
         padding: EdgeInsets.only(top: 30.0)), 
          new FormField<String>(
          builder: (FormFieldState<String> state) {
          return InputDecorator(
           decoration: InputDecoration(
         icon: const Icon(Icons.calendar_today, color: Colors.deepPurple, size: 25.0,),
             labelText: 'How many months*', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
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
                 isEmpty: _month == '',
                 child: new DropdownButtonHideUnderline(
                  child: new DropdownButton(
                   style: TextStyle(color: Colors.black, fontSize: 15.0, fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                    value: _month,
                     isDense: true,
                     isExpanded: false,
                       onChanged: (String newValue) {
                       setState(() {
                         parent.month = newValue;
                          _month = newValue;
                         state.didChange(newValue);
                   });
                },
                   items: _months.map((String value) {
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
            return val != '' ? null : 'Please select duration';
            },
      ),
     
      Padding(
           padding: EdgeInsets.only(top: 10.0)),
           Container(
               width : 700,
               height: 75,
                padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                child: new RaisedButton(
                    child: Text('Preferred day(s) to be tutored', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                       onPressed: () => _showReportDialog(),
               )),
                    Text(selectedDayList.join(" , ")),

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
                labelText: 'Grade of Tutor you want*',
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
                parent.selectedGrade = newValue;
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
           padding: EdgeInsets.only(top: 20.0)),        
            new Row(
             children: <Widget>[
             new Expanded(
              flex: 4,
               child: new TextFormField(
               decoration: new InputDecoration(
                 icon: const Icon(Icons.calendar_today, color: Colors.deepPurple, size: 25.0,),
                  labelText: 'Proposed Start Date*', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                   hintText: 'What time do you want to start the Tutorial', hintStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,  fontFamily: 'Montserrat'),
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
                 keyboardType: TextInputType.datetime,
                  validator: (val) => isValidStartDate(val) ? null : 'Not a valid date',
                   onSaved: (val) => parent.startDate = val,
                )),
                new IconButton(
                 icon: new Icon(Icons.more_horiz),
                 tooltip: 'Choose date',
                  onPressed: ((){
                   _chooseDate(context, _controller.text);
              }),
            )
          ]),
       
             Padding(
              padding: EdgeInsets.only(top: 30.0)),     
              new TextFormField(
                maxLength: 100,
                 maxLines: 5,
             decoration: new InputDecoration(
             icon: const Icon(Icons.assessment, color: Colors.deepPurple, size: 25.0,),
             labelText: 'State Improvements you want to see in your child*', labelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
             hintText: 'e.g My Son has been performing below average in mathematics, but i want a tutor that will brace up his Skills in Mathematics to 90% and above', hintStyle: TextStyle(fontSize: 15.0,
              fontWeight: FontWeight.bold,  fontFamily: 'Montserrat'),
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
               validator: (val) => val.isEmpty ? 'improvements is required' : null,
           ),
                                    
             Container(
               width : 700,
                padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                 child:  RaisedButton(
                 splashColor: Colors.blue,
                  color: Colors.redAccent,
                   child: const Text('Submit',  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white,),),
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

