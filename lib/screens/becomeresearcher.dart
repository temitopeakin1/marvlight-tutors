import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvapp/models/marvlightresearcher.dart';

void main() => runApp(new Marvlightresearcherform());

class Marvlightresearcherform extends StatefulWidget {
  Marvlightresearcherform({
    Key key,
    this.marvlightresearcher,
    String title,
  }) : super(key: key);
  final Marvlightresearcher marvlightresearcher;
  @override
  _MarvlightresearcherformState createState() =>
      new _MarvlightresearcherformState();
}

final mainReference = FirebaseDatabase.instance.reference();

class _MarvlightresearcherformState extends State<Marvlightresearcherform> {
  List<Marvlightresearcher> marvlightresearchers = [];
  Marvlightresearcher marvlightresearcher;
  DatabaseReference marvlightresearcherRef;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int radioValue = -1;

  List<String> _qualifications = <String>[
    '',
    'BACHELORS(BSc/B.A/B.Ed)',
    'POSTGRADUATE(PGD)',
    'MASTERS(M.Sc/M.A/M.Ed)',
    'DOCTOR OF PHILOSOPHY(PHD)'
  ];
  String _qualification = '';
  List<String> _genders = <String>['', 'Male', 'Female'];
  String _gender = '';
  String email;

  get app => null;

  @override
  void initState() {
    super.initState();

    marvlightresearcher = Marvlightresearcher("", "", "", "", "", "", "");
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    marvlightresearcherRef = database.reference().child('Marvlightresearcher');
    marvlightresearcherRef.onChildAdded.listen(_onEntryAdded);
    marvlightresearcherRef.onChildAdded.listen(_onEntryChanged);
  }

  _onEntryAdded(Event event) {
    setState(() {
      marvlightresearchers
          .add(Marvlightresearcher.fromSnapshot(event.snapshot));
    });
  }

  _onEntryChanged(Event event) {
    var old = marvlightresearchers
        .singleWhere((entry) => entry.key == event.snapshot.key);
    {}
    setState(() {
      marvlightresearchers[marvlightresearchers.indexOf(old)] =
          Marvlightresearcher.fromSnapshot(event.snapshot);
    });
  }

  Marvlightresearcher newContact = new Marvlightresearcher("name", "phone",
      "state", "email", "qualification", "gender", "institution");
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
    } else if (value.length != 10) {
      return "Mobile number must 11 digits";
    } else if (!regExp.hasMatch(value)) {
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
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.blue,
        content: Text(
            'Thank You, Your Application to become a Researcher has been received, we will get back to you via Email or Phone',
            style: TextStyle(fontSize: 18.0, fontFamily: 'Comic sans')),
      ),
    );
  }

  void submitForm() {
    final FormState form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      form.reset();
      marvlightresearcherRef.push().set(marvlightresearcher.toJson());
      showMessage('OOPS! iNCOMPLETE DETAILS!  Please complete the Form.');
    } else {
      form.save();
      // invokes an OnSaved event
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Marvlight Tutors',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Comic Sans',
              fontSize: 25.0),
        ),
      ),
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: Container(
        child: new Form(
            key: _formKey,
            // ignore: deprecated_member_use
            autovalidateMode: AutovalidateMode.always,
            child: new SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(50, 50, 25, 25),
                child: Column(
                  children: <Widget>[
                    Text('Project Assistant Application form',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat')),
                    Text('(*Kindly fill the required)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'JosefinSans-Bold',
                            color: Colors.red)),
                    Padding(padding: EdgeInsets.only(top: 30.0)),
                    new TextFormField(
                      decoration: new InputDecoration(
                        icon: const Icon(
                          Icons.person,
                          color: Colors.deepPurple,
                          size: 25.0,
                        ),
                        labelText: 'Full Name*',
                        labelStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                        hintText: 'Surname first',
                        hintStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                        fillColor: Colors.blue,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.blue,
                            width: 10,
                          ),
                        ),
                      ),
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(50)
                      ],
                      validator: (val) =>
                          val.isEmpty ? 'Name is required' : null,
                      onSaved: (val) => marvlightresearcher.name = val,
                    ),
                    Padding(padding: EdgeInsets.only(top: 30.0)),
                    new TextFormField(
                      decoration: new InputDecoration(
                        icon: const Icon(
                          Icons.add_location,
                          color: Colors.deepPurple,
                          size: 25.0,
                        ),
                        labelText: 'Address*',
                        labelStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                        hintText: 'Current address',
                        hintStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                        fillColor: Colors.blue,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.blue,
                            width: 10,
                          ),
                        ),
                      ),
                      validator: (val) =>
                          val.isEmpty ? 'Address Number is required' : null,
                    ),
                    Padding(padding: EdgeInsets.only(top: 30.0)),
                    new TextFormField(
                      decoration: new InputDecoration(
                        icon: const Icon(
                          Icons.phone,
                          color: Colors.deepPurple,
                          size: 25.0,
                        ),
                        labelText: 'Phone Number*',
                        labelStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                        hintText: 'Valid Phone number',
                        hintStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                        fillColor: Colors.blue,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.blue,
                            width: 10,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        // only accept letters from a to z and numbers from 0 to 9
                        FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,11}$'),
                            allow: true)
                      ],
                      validator: (val) => val.isEmpty || val.length != 11
                          ? 'Phone Number is required'
                          : null,
                      onSaved: (val) => marvlightresearcher.phone = val,
                    ),
                    Padding(padding: EdgeInsets.only(top: 30.0)),
                    new FormField<String>(
                        builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          icon: const Icon(
                            Icons.person_outline,
                            color: Colors.deepPurple,
                            size: 25.0,
                          ),
                          labelText: 'Gender*',
                          labelStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                          fillColor: Colors.blue,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.blue,
                              width: 10,
                            ),
                          ),
                          errorText: state.hasError ? state.errorText : null,
                        ),
                        isEmpty: _gender == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                            value: _gender,
                            isDense: true,
                            isExpanded: false,
                            onChanged: (String newValue) {
                              setState(() {
                                marvlightresearcher.gender = newValue;
                                _gender = newValue;
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
                    }, validator: (val) {
                      return val != '' ? null : 'Please select a gender';
                    }),
                    Padding(padding: EdgeInsets.only(top: 30.0)),
                    new TextFormField(
                      decoration: new InputDecoration(
                        icon: const Icon(
                          Icons.add_location,
                          color: Colors.deepPurple,
                          size: 25.0,
                        ),
                        labelText: 'State of Residence*',
                        labelStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                        hintText: 'e.g Lagos, Ogun, Oyo e.t.c',
                        hintStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                        fillColor: Colors.blue,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.blue,
                            width: 10,
                          ),
                        ),
                      ),
                      validator: (val) =>
                          val.isEmpty ? 'State is required' : null,
                      onSaved: (val) => marvlightresearcher.state = val,
                    ),
                    Padding(padding: EdgeInsets.only(top: 30.0)),
                    new TextFormField(
                        decoration: new InputDecoration(
                          icon: const Icon(
                            Icons.email,
                            color: Colors.deepPurple,
                            size: 25.0,
                          ),
                          labelText: 'E-mail*',
                          labelStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                          hintText: 'Enter correct E-mail',
                          hintStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                          fillColor: Colors.blue,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.blue,
                              width: 10,
                            ),
                          ),
                        ),
                        validator: validateEmail,
                        onSaved: (String val) {
                          marvlightresearcher.email = val;
                        }),
                    Padding(padding: EdgeInsets.only(top: 30.0)),
                    new FormField<String>(
                      builder: (FormFieldState<String> state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            icon: const Icon(
                              Icons.pages,
                              color: Colors.deepPurple,
                              size: 25.0,
                            ),
                            labelText: 'Highest Qualification Obtained*',
                            labelStyle: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                            fillColor: Colors.blue,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: new BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.blue,
                                width: 10,
                              ),
                            ),
                            errorText: state.hasError ? state.errorText : null,
                          ),
                          isEmpty: _qualification == '',
                          child: new DropdownButtonHideUnderline(
                            child: new DropdownButton(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                              value: _qualification,
                              isDense: true,
                              isExpanded: false,
                              onChanged: (String newValue) {
                                setState(() {
                                  marvlightresearcher.qualification = newValue;
                                  _qualification = newValue;
                                  state.didChange(newValue);
                                });
                              },
                              items: _qualifications.map((String value) {
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
                        return val != '' ? null : 'Choose your qualification';
                      },
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(2, 10, 2, 10)),
                    new ListTile(
                      leading: new Icon(Icons.library_add,
                          color: Colors.deepPurple, size: 25.0),
                      title: new Text('Are you lecturing in any Institution?',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat')),
                      dense: true,
                    ),
                    new Column(
                      children: <Widget>[
                        new RadioListTile<int>(
                            title: new Text(
                              'Yes',
                              style: TextStyle(fontFamily: 'Montserrat'),
                            ),
                            value: 0,
                            groupValue: radioValue,
                            activeColor: Colors.red,
                            onChanged: handleRadioValueChange),
                        new RadioListTile<int>(
                            title: new Text('No',
                                style: TextStyle(fontFamily: 'Montserrat')),
                            value: 1,
                            groupValue: radioValue,
                            activeColor: Colors.red,
                            onChanged: handleRadioValueChange),
                      ],
                    ),
                    new TextFormField(
                        decoration: InputDecoration(
                          labelText: 'If Yes which Institution',
                          labelStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                          fillColor: Colors.blue,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.blue,
                              width: 10,
                            ),
                          ),
                        ),
                        onSaved: (String val) {
                          marvlightresearcher.institution = val;
                        }),
                    Padding(padding: EdgeInsets.only(top: 30.0)),
                    new TextFormField(
                      maxLength: 100,
                      maxLines: 5,
                      decoration: new InputDecoration(
                        icon: const Icon(
                          Icons.class_,
                          color: Colors.deepPurple,
                          size: 25.0,
                        ),
                        labelText: 'Short Biography about yourself*',
                        labelStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                        hintText: 'Biography',
                        hintStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                        fillColor: Colors.blue,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.blue,
                            width: 10,
                          ),
                        ),
                      ),
                    ),
                    new Container(
                        width: 700,
                        padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: submitForm,
                        )),
                    Padding(padding: EdgeInsets.only(bottom: 30.0)),
                    Container(
                        child: Text('Copyright © 2021 Marvlight Tutors',
                            textAlign: TextAlign.center)),
                  ],
                ))),
      ),
    );
  }

  void handleRadioValueChange(int value) {
    print(value);
    setState(() => radioValue = value);
  }
}
