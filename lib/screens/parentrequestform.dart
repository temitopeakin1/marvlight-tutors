// ignore_for_file: deprecated_member_use, unrelated_type_equality_checks, unnecessary_statements

// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

void main() => runApp(new Marvlightparentform());

enum Subjects {
  Animations,
  BasicScience,
  BasicTech,
  Businessstudies,
  Biology,
  BiologyPractical,
  Programming,
  CivicEducation,
  Commerce,
  Computerstudies,
  Chemistry,
  ChemistryPractical,
  EnglishLanguage,
  Economics,
  French,
  FurtherMathematics,
  FinancialAccounting,
  CreativeArts,
  Fishery,
  Physics,
  PhysicsPractical,
  Literature,
  GraphicsDesign,
  Government,
  Geography,
  Mathematics,
  Music,
  Numeracy,
  PhonicsDiction,
  QuantitativeReasoning,
  VerbalAptitude,
  PreVocationalStudies,
  TechnicalDrawing,
  DailyAssistantAssignment,
  MakeUptraining
}

enum Day { Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday }

enum Musics {
  None,
  Violin,
  Keyboard,
  Guitar,
  Drum,
  Xylophone,
  Flute,
  Trumpet,
  Saxophone
}

class Parent {
  String key;
  String pname = '';
  String cname = '';
  String childc = '';
  String examc = '';
  String startDate;
  String phone = '';
  String state = '';
  String email = '';
  List<Subjects> subjects;
  List<Musics> musics;
  String selectedGrade = '';
  String gender = '';
  String duration = '';
  List<Day> days;
  String address = '';
  String numberdays = '';
  String code = '';
  String totalAmount = '';

  Parent(
      {this.pname,
      this.cname,
      this.childc,
      this.examc,
      this.startDate,
      this.phone,
      this.state,
      this.email,
      List<Subjects> subjects,
      List<Musics> musics,
      this.selectedGrade,
      this.gender,
      this.duration,
      List<Day> days,
      this.address,
      this.numberdays,
      this.totalAmount,
      this.code}) {
    this.subjects = subjects ?? [];
    this.days = days ?? [];
    this.musics = musics ?? [];
  }

  Parent.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        pname = snapshot.value["pname"],
        cname = snapshot.value["cname"],
        childc = snapshot.value["childc"],
        examc = snapshot.value["examc"],
        startDate = snapshot.value["startDate"],
        phone = snapshot.value["phone"],
        state = snapshot.value["state"],
        email = snapshot.value["email"],
        subjects = snapshot.value["List<Subjects>"],
        musics = snapshot.value["List<Musics>"],
        selectedGrade = snapshot.value["selectedGrade"],
        gender = snapshot.value["gender"],
        duration = snapshot.value["duration"],
        days = snapshot.value["List<Day>"],
        address = snapshot.value["address"],
        numberdays = snapshot.value["numberdays"],
        code = snapshot.value["code"],
        totalAmount = snapshot.value["totalAmount"];

  toJson() {
    return {
      "pname": pname,
      "cname": cname,
      "childClass": childc,
      "examClass": examc,
      "startDate": startDate,
      "phone": phone,
      "state": state,
      "email": email,
      "subjects": subjects.toString(),
      "musics": musics.toString(),
      "selectedGrade": selectedGrade,
      "gender": gender,
      "duration": duration,
      "days": days.toString(),
      "address": address,
      "numberdays": numberdays.toString(),
      "code": code,
      "totalAmount": totalAmount,
    };
  }
}

// formFields/myMultiselectionFormField.dart ********************

class MyMultiSelectionFormField<T> extends FormField<List<T>> {
  MyMultiSelectionFormField({
    Key key,
    @required List<T> initialValues,
    @required List<T> options,
    @required Widget Function(T) titleBuilder,
    Widget Function(T) subtitleBuilder,
    Widget Function(T) secondaryBuilder,
    @required Widget Function(T) chipLabelBuilder,
    Widget Function(T) chipAvatarBuilder,
    Widget hint,
    this.decoration = const InputDecoration(),
    this.onChanged,
    FormFieldSetter<List<T>> onSaved,
    FormFieldValidator<List<T>> validator,
    bool autovalidate = false,
    Widget disabledHint,
    int elevation = 8,
    TextStyle style,
    TextStyle chipLabelStyle,
    Widget underline,
    Widget icon,
    Color iconDisabledColor,
    Color iconEnabledColor,
    Color activeColor,
    Color checkColor,
    double iconSize = 24.0,
    bool isDense = false,
    bool isExpanded = false,
    double itemHeight,
    bool autofocus = false,
    FocusNode focusNode,
    Color focusColor,
    bool isItemdense,
    bool isItemThreeLine = false,
    String deleteButtonTooltipMessage,
    double chipListSpacing = 8.0,
    WrapAlignment chipListAlignment = WrapAlignment.start,
    EdgeInsetsGeometry chipLabelPadding,
    EdgeInsetsGeometry chipPadding,
    Widget chipDeleteIcon,
    Color chipDeleteIconColor,
    ShapeBorder chipShape,
    Clip chipClipBehavior = Clip.none,
    Color chipBackgroundColor,
    Color chipShadowColor,
    MaterialTapTargetSize chipMaterialTapTargetSize,
    double chipElevation,
    TextEditingController controller,
  })  : assert(
          options == null ||
              options.isEmpty ||
              initialValues == null ||
              initialValues.every((value) =>
                  options.where((T option) {
                    return option == value;
                  }).length <=
                  3),
          'There should be exactly one item with [DropdownButton]\'s value: '
          '$initialValues. \n'
          'Either zero or 2 or more [DropdownMenuItem]s were detected '
          'with the same value',
        ),
        assert(decoration != null),
        assert(elevation != null),
        assert(iconSize != null),
        assert(isDense != null),
        assert(isExpanded != null),
        assert(itemHeight == null || itemHeight > 0),
        assert(autofocus != null),
        assert(isItemThreeLine != null),
        assert(chipListSpacing != null),
        assert(chipListAlignment != null),
        assert(chipClipBehavior != null),
        super(
          key: key,
          onSaved: onSaved,
          initialValue: initialValues,
          validator: validator,
          autovalidateMode: AutovalidateMode.always,
          builder: (FormFieldState<List<T>> field) {
            final InputDecoration effectiveDecoration =
                decoration.applyDefaults(
              Theme.of(field.context).inputDecorationTheme,
            );
            return InputDecorator(
              decoration:
                  effectiveDecoration.copyWith(errorText: field.errorText),
              isEmpty: field.value.isEmpty,
              isFocused: focusNode?.hasFocus,
              child: MyMultiSelectionField<T>(
                values: field.value,
                options: options,
                titleBuilder: titleBuilder,
                subtitleBuilder: subtitleBuilder,
                secondaryBuilder: secondaryBuilder,
                chipLabelBuilder: chipLabelBuilder,
                chipAvatarBuilder: chipAvatarBuilder,
                hint: field.value.isNotEmpty ? hint : null,
                onChanged: field.didChange,
                disabledHint: disabledHint,
                elevation: elevation,
                style: style,
                chipLabelStyle: chipLabelStyle,
                underline: underline,
                icon: icon,
                iconDisabledColor: iconDisabledColor,
                iconEnabledColor: iconEnabledColor,
                activeColor: activeColor,
                checkColor: checkColor,
                iconSize: iconSize,
                isDense: isDense,
                isExpanded: isExpanded,
                itemHeight: itemHeight,
                focusNode: focusNode,
                focusColor: focusColor,
                autofocus: autofocus,
                isItemdense: isItemdense,
                isItemThreeLine: isItemThreeLine,
                deleteButtonTooltipMessage: deleteButtonTooltipMessage,
                chipListSpacing: chipListSpacing,
                chipListAlignment: chipListAlignment,
                chipLabelPadding: chipLabelPadding,
                chipPadding: chipPadding,
                chipDeleteIcon: chipDeleteIcon,
                chipDeleteIconColor: chipDeleteIconColor,
                chipShape: chipShape,
                chipClipBehavior: chipClipBehavior,
                chipBackgroundColor: chipBackgroundColor,
                chipShadowColor: chipShadowColor,
                chipMaterialTapTargetSize: chipMaterialTapTargetSize,
                chipElevation: chipElevation,
              ),
            );
          },
        );

  final ValueChanged<List<T>> onChanged;

  final InputDecoration decoration;
  @override
  FormFieldState<List<T>> createState() => _MyMultiSelectionFormFieldState<T>();
}

class _MyMultiSelectionFormFieldState<T> extends FormFieldState<List<T>> {
  @override
  MyMultiSelectionFormField<T> get widget => super.widget;

  @override
  void didChange(List<T> values) {
    super.didChange(values);
    if (this.hasError) {
      this.validate();
    }
    if (widget.onChanged != null) {
      widget.onChanged(values);
    }
  }
}

// fields/myMultiselectionField.dart ************************

class MyMultiSelectionField<T> extends StatelessWidget {
  MyMultiSelectionField({
    Key key,
    this.values,
    @required this.options,
    this.titleBuilder,
    this.subtitleBuilder,
    this.secondaryBuilder,
    @required this.chipLabelBuilder,
    this.chipAvatarBuilder,
    this.hint,
    @required this.onChanged,
    this.disabledHint,
    this.elevation = 8,
    this.style,
    this.chipLabelStyle,
    this.underline,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.activeColor,
    this.checkColor,
    this.iconSize = 24.0,
    this.isDense = false,
    this.isExpanded = false,
    this.itemHeight,
    this.autofocus = false,
    this.focusNode,
    this.focusColor,
    this.isItemdense,
    this.isItemThreeLine = false,
    this.deleteButtonTooltipMessage,
    this.chipListSpacing = 8.0,
    this.chipListAlignment = WrapAlignment.start,
    this.chipLabelPadding,
    this.chipPadding,
    this.chipDeleteIcon,
    this.chipDeleteIconColor,
    this.chipShape,
    this.chipClipBehavior = Clip.none,
    this.chipBackgroundColor,
    this.chipShadowColor,
    this.chipMaterialTapTargetSize,
    this.chipElevation,
  })  : assert(options == null ||
            options.isEmpty ||
            values == null ||
            values.every((value) =>
                options.where((T option) {
                  return option == value;
                }).length <=
                1)),
        assert(chipLabelBuilder != null),
        assert(onChanged != null),
        assert(iconSize != null),
        assert(isDense != null),
        assert(isExpanded != null),
        assert(autofocus != null),
        assert(isItemThreeLine != null),
        assert(chipListSpacing != null),
        assert(chipListAlignment != null),
        assert(chipClipBehavior != null),
        super(key: key);

  final ValueChanged<List<T>> onChanged;
  final List<T> values;
  final List<T> options;
  final Widget hint;
  final Widget disabledHint;
  final Widget Function(T) titleBuilder;
  final Widget Function(T) subtitleBuilder;
  final Widget Function(T) secondaryBuilder;
  final Widget Function(T) chipLabelBuilder;
  final Widget Function(T) chipAvatarBuilder;
  final int elevation;
  final TextStyle style;
  final TextStyle chipLabelStyle;
  final Widget underline;
  final Widget icon;
  final Color iconDisabledColor;
  final Color iconEnabledColor;
  final Color activeColor;
  final Color checkColor;
  final double iconSize;
  final bool isDense;
  final bool isExpanded;
  final double itemHeight;
  final Color focusColor;
  final FocusNode focusNode;
  final bool autofocus;
  final bool isItemThreeLine;
  final bool isItemdense;
  final String deleteButtonTooltipMessage;
  final double chipListSpacing;
  final WrapAlignment chipListAlignment;
  final EdgeInsetsGeometry chipLabelPadding;
  final EdgeInsetsGeometry chipPadding;
  final Widget chipDeleteIcon;
  final Color chipDeleteIconColor;
  final ShapeBorder chipShape;
  final Clip chipClipBehavior;
  final Color chipBackgroundColor;
  final Color chipShadowColor;
  final MaterialTapTargetSize chipMaterialTapTargetSize;
  final double chipElevation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            value: null,
            items: options
                .map<DropdownMenuItem<T>>(
                  (T option) => DropdownMenuItem<T>(
                    value: option,
                    child: MyCheckboxListTile<T>(
                      selected: values.contains(option),
                      title: titleBuilder(option),
                      subtitle: subtitleBuilder != null
                          ? subtitleBuilder(option)
                          : null,
                      secondary: secondaryBuilder != null
                          ? secondaryBuilder(option)
                          : null,
                      isThreeLine: isItemThreeLine,
                      dense: isItemdense,
                      activeColor: activeColor,
                      checkColor: checkColor,
                      onChanged: (_) {
                        if (!values.contains(option)) {
                          values.add(option);
                        } else {
                          values.remove(option);
                        }
                        onChanged(values);
                      },
                    ),
                  ),
                )
                .toList(),
            selectedItemBuilder: (BuildContext context) {
              return options.map<Widget>((T option) {
                return Text('');
              }).toList();
            },
            hint: hint,
            onChanged: onChanged == null ? null : (T value) {},
            disabledHint: disabledHint,
            elevation: elevation,
            style: style,
            underline: underline,
            icon: icon,
            iconDisabledColor: iconDisabledColor,
            iconEnabledColor: iconEnabledColor,
            iconSize: iconSize,
            isDense: isDense,
            isExpanded: isExpanded,
            itemHeight: itemHeight,
            focusNode: focusNode,
            focusColor: focusColor,
            autofocus: autofocus,
          ),
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: MyChipList<T>(
                values: values,
                spacing: chipListSpacing,
                alignment: chipListAlignment,
                chipBuilder: (T value) {
                  return Chip(
                    label: chipLabelBuilder(value),
                    labelStyle: chipLabelStyle,
                    labelPadding: chipLabelPadding,
                    avatar: chipAvatarBuilder != null
                        ? chipAvatarBuilder(value)
                        : null,
                    onDeleted: () {
                      values.remove(value);
                      onChanged(values);
                    },
                    deleteIcon: chipDeleteIcon,
                    deleteIconColor: chipDeleteIconColor,
                    deleteButtonTooltipMessage: deleteButtonTooltipMessage,
                    shape: chipShape,
                    clipBehavior: chipClipBehavior,
                    backgroundColor: chipBackgroundColor,
                    padding: chipPadding,
                    materialTapTargetSize: chipMaterialTapTargetSize,
                    elevation: chipElevation,
                    shadowColor: chipShadowColor,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class MyCheckboxListTile<T> extends StatefulWidget {
  MyCheckboxListTile(
      {Key key,
      @required this.title,
      this.subtitle,
      @required this.onChanged,
      @required this.selected,
      this.activeColor,
      this.checkColor,
      this.dense,
      this.isThreeLine = false,
      this.secondary})
      : assert(title != null),
        assert(onChanged != null),
        assert(selected != null),
        super(key: key);

  final Widget title;
  final Widget subtitle;
  final dynamic onChanged;
  final bool selected;
  final Color activeColor;
  final Color checkColor;
  final bool isThreeLine;
  final bool dense;
  final Widget secondary;

  @override
  _MyCheckboxListTileState<T> createState() => _MyCheckboxListTileState<T>();
}

class _MyCheckboxListTileState<T> extends State<MyCheckboxListTile<T>> {
  _MyCheckboxListTileState();

  bool _checked;

  @override
  void initState() {
    _checked = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: _checked,
      selected: _checked,
      title: widget.title,
      subtitle: widget.subtitle,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) {
        widget.onChanged(checked);
        setState(() {
          _checked = checked;
        });
      },
      activeColor: widget.activeColor,
      checkColor: widget.checkColor,
      isThreeLine: widget.isThreeLine,
      dense: widget.dense,
      secondary: widget.secondary,
    );
  }
}

class MyChipList<T> extends StatelessWidget {
  const MyChipList({
    @required this.values,
    @required this.chipBuilder,
    this.spacing = 8.0,
    this.alignment = WrapAlignment.start,
  });

  final List<T> values;
  final Chip Function(T) chipBuilder;
  final double spacing;
  final WrapAlignment alignment;

  List<Widget> _buildChipList() {
    final List<Widget> items = [];
    for (T value in values) {
      items.add(chipBuilder(value));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 2.0,
      children: _buildChipList(),
    );
  }
}

class Marvlightparentform extends StatefulWidget {
  Marvlightparentform({
    Key key,
    this.parent,
    String title,
  }) : super(key: key);
  final Parent parent;
  @override
  _MarvlightparentformState createState() => new _MarvlightparentformState();
}

final mainReference = FirebaseDatabase.instance.reference();

class _MarvlightparentformState extends State<Marvlightparentform> {
  List<Parent> parents = [];
  Parent parent;
  DatabaseReference parentRef;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _controller = new TextEditingController();
  final myController = TextEditingController();

  final _formResult = Parent();
  final subjectsFocusNode = FocusNode();
  final daysFocusNode = FocusNode();
  final musicsFocusNode = FocusNode();
  final amountsFocusNode = FocusNode();

  final TextEditingController _days = new TextEditingController();
  final TextEditingController _code = new TextEditingController();
  final TextEditingController _duration = new TextEditingController();

  var days = 0.0, code = 0.0, duration = 0.0, totalAmount = 0.0;

  List<String> _selectedGrades = [
    '',
    '2916.67',
    '2083.33',
    '1666.67',
    '1416.67'
  ];

  //Begin: Method to get 'totalamount' and push to Firebase
  void _doMul() {
    setState(() {
      days = double.parse(_days.text);
      code = double.parse(_code.text);
      duration = double.parse(_duration.text);
      totalAmount = (days * code * duration);
      totalAmount = double.parse((totalAmount).toStringAsFixed(2));
    });
  }

  //End: Method to get 'amount'

  // List<String> _states = ["Choose a state"];
  // List<String> _lgas = ["Choose .."];
  // String _selectedState = "Choose a state";
  // String _selectedLGA = "Choose ..";

  List<String> _genders = <String>['', 'Male', 'Female'];

  List<String> _childcs = [
    '',
    'Nursery 1',
    'Nursery 2',
    'Basic 1',
    'Basic 2',
    'Basic 3',
    'Basic 4',
    'Basic 5',
    'Basic 6',
    'Basic 7',
    'Basic 8',
    'Basic 9',
    'SSS1',
    'SSS2',
    'SSS3'
  ];

  List<String> _examcs = [
    '',
    'COMMON-ENTRANCE',
    'SAT',
    'TOEFL',
    'ICAN',
    'SSCE',
    'POST-UTME'
  ];

  String value;
  String _gender = '';
  String _selectedGrade = '';
  String _childc = '';
  String _examc = '';

  @override
  void initState() {
    super.initState();

    parent = Parent();
    final FirebaseDatabase database = FirebaseDatabase();
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
    var old = parents.singleWhere((entry) => entry.key == event.snapshot.key);
    {}
    setState(() {
      parents[parents.indexOf(old)] = Parent.fromSnapshot(event.snapshot);
    });
  }

  Parent newContact = new Parent();

  String validatepname(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    }
    if (value.length < 2) {
      return "Name must be at least 2 characters long";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  Future _selectDate(BuildContext context, [String text]) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime.now(),
        lastDate: new DateTime(2025, 12));
    if (picked != null) setState(() => _controller.text = picked.toString());
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 11) {
      return "Mobile number must 11 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  String validatenumberdays(String value) {
    String patttern = r'(^[1-6]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length >= 1) {
      return "Number days must be between 1 and 6";
    } else if (!regExp.hasMatch(value)) {
      return "Number days must be between 1 and 6";
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
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 10),
        backgroundColor: color,
        content: new Text(
            'Thanks for your Patronage, Our agents will get back to you via Calls or SMS shortly',
            style: TextStyle(fontSize: 18.0, fontFamily: 'Comic sans'))));
  }

  void _submitForm() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      form.save();
      parentRef.push().set(parent.toJson());
      showMessage('iNCOMPLETE DETAILS!  Please complete the Form.');
    } else {
      form.save();
      // invokes an OnSaved event
    }
  }

// begin: build method
  @override
  Widget build(BuildContext context) {
    const icon2 = const Icon(
      Icons.calendar_view_day,
      color: Colors.deepPurple,
      size: 25.0,
    );
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
              autovalidateMode: AutovalidateMode.always,
              child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(30, 50, 25, 25),
                  child: new Column(
                    children: <Widget>[
                      Text('Get a Tutor',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat')),
                      Text('(Kindly fill the required *)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0,
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
                          labelText: 'Parent\'s Name*',
                          labelStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                          hintText: 'Surname first',
                          hintStyle: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
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
                        onSaved: (val) => parent.pname = val,
                      ),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      new TextFormField(
                        decoration: new InputDecoration(
                          icon: const Icon(
                            Icons.person,
                            color: Colors.deepPurple,
                            size: 25.0,
                          ),
                          labelText: 'Child/Ward\'s Name*',
                          labelStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                          hintText: 'Surname first',
                          hintStyle: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
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
                        onSaved: (val) => parent.cname = val,
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
                              errorText:
                                  state.hasError ? state.errorText : null,
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
                                    parent.gender = newValue;
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
                        },
                        validator: (val) {
                          return val != '' ? null : 'Please select a gender';
                        },
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
                        validator: (val) => val.isEmpty
                            ? 'Nearest Busstop or Street name required'
                            : null,
                        onSaved: (val) => parent.address = val,
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
                          // only accept letters from a to z
                          FilteringTextInputFormatter(
                              RegExp(r'^[()\d -]{1,11}$'),
                              allow: true)
                        ],
                        validator: (val) => val.isEmpty || val.length != 11
                            ? 'Phone Number is required'
                            : null,
                        onSaved: (val) => parent.phone = val,
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
                          onSaved: (String val) {
                            parent.email = val;
                          }),
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
                              labelText: 'Child/Ward\'s Class*',
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
                              errorText:
                                  state.hasError ? state.errorText : null,
                            ),
                            isEmpty: _childc == '',
                            child: new DropdownButtonHideUnderline(
                              child: new DropdownButton(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold),
                                value: _childc,
                                isDense: true,
                                isExpanded: false,
                                onChanged: (String newValue) {
                                  setState(() {
                                    parent.childc = newValue;
                                    _childc = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _childcs.map((String value) {
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
                          return val != '' ? null : 'Please select class';
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      new FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              icon: const Icon(
                                Icons.book,
                                color: Colors.deepPurple,
                                size: 25.0,
                              ),
                              labelText: 'Exam Class*',
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
                              errorText:
                                  state.hasError ? state.errorText : null,
                            ),
                            isEmpty: _examc == '',
                            child: new DropdownButtonHideUnderline(
                              child: new DropdownButton(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold),
                                value: _examc,
                                isDense: true,
                                isExpanded: false,
                                onChanged: (String newValue) {
                                  setState(() {
                                    parent.examc = newValue;
                                    _examc = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _examcs.map((String value) {
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
                          return val != '' ? null : 'Please select class';
                        },
                      ),
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
                        onSaved: (val) => parent.state = val,
                      ),
                      //   Padding(padding: EdgeInsets.only(top: 30.0)),
                      //  new FormField<String>(
                      //    builder: (FormFieldState<String> state) {
                      //      return InputDecorator(
                      //        decoration: InputDecoration(
                      //          icon: const Icon(
                      //            Icons.place,
                      //            color: Colors.deepPurple,
                      //            size: 25.0,
                      //          ),
                      //          labelText: 'State of Residence',
                      //          labelStyle: TextStyle(
                      //            fontSize: 15.0,
                      //            fontWeight: FontWeight.bold,
                      //            fontFamily: 'Montserrat',
                      //          ),
                      //           fillColor: Colors.blue,
                      //           border: new OutlineInputBorder(
                      //             borderRadius: new BorderRadius.circular(10.0),
                      //             borderSide: new BorderSide(
                      //               color: Colors.blue,
                      //               width: 10,
                      //             ),
                      //           ),
                      //           errorText: state.hasError ? state.errorText : null,
                      //           ),
                      //       // ignore: unrelated_type_equality_checks
                      //       isEmpty: _states == '',
                      //       child: new DropdownButtonHideUnderline(
                      //         child: new DropdownButton<String>(
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 15.0,
                      //             fontFamily: 'Montserrat',
                      //             fontWeight: FontWeight.bold,
                      //                value: dropDownStringItem,
                      //               isExpanded: false,
                      //               isDense: true,
                      //                items: _states.map((String dropDownStringItem) {
                      //                  return new DropdownMenuItem<String>(

                      //                     child: new Text(dropDownStringItem),
                      //                   );

                      //                }).toList() _onSelectedState(value),
                      //                   value: _selectedState,

                      //           )
                      //         )
                      //       )

                      //        )

                      //    }
                      //  ),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      SizedBox(height: 8.0),
                      MyMultiSelectionFormField<Subjects>(
                        decoration: InputDecoration(
                          icon: const Icon(
                            Icons.subject,
                            color: Colors.deepPurple,
                            size: 25.0,
                          ),
                          labelText: 'Subjects to be tutored*',
                          labelStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.blue,
                              width: 10,
                            ),
                          ),
                        ),
                        hint: Text('Select Subjects'),
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                        isDense: true,
                        focusNode: subjectsFocusNode,
                        options: Subjects.values,
                        titleBuilder: (subject) => Text(describeEnum(subject)),
                        chipLabelBuilder: (subject) =>
                            Text(describeEnum(subject)),
                        initialValues: _formResult.subjects,
                        validator: (subjects) {
                          if (subjects.isEmpty)
                            return 'Maximum of 3 subjects can only be selected';
                          if (subjects.length == 4)
                            return 'Maximum of 3 subjects can only be selected';
                          if (subjects.length == 5)
                            return 'Maximum of 3 subjects can only be selected';
                          if (subjects.length == 6)
                            return 'Maximum of 3 subjects can only be selected';
                          if (subjects.length == 7)
                            return 'Maximum of 3 subjects can only be selected';
                          if (subjects.length == 8)
                            return 'Maximum of 3 subjects can only be selected';
                          if (subjects.length == 9)
                            return 'Maximum of 3 subjects can only be selected';
                          if (subjects.length == 10)
                            return 'Maximum of 3 subjects can only be selected';
                          if (subjects.length == 11)
                            return 'Maximum of 3 subjects can only be selected';
                          if (subjects.length == 12)
                            return 'Maximum of 3 subjects can only be selected';
                          if (subjects.length == 13)
                            return 'Maximum of 3 subjects can only be selected';
                          return null;
                        },
                        onSaved: (subjects) {
                          parent.subjects = subjects;
                        },
                        onChanged: (_) {
                          FocusScope.of(context).unfocus();
                          FocusScope.of(context)
                              .requestFocus(subjectsFocusNode);
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      SizedBox(height: 8.0),
                      MyMultiSelectionFormField<Musics>(
                        decoration: InputDecoration(
                          icon: const Icon(
                            Icons.subject,
                            color: Colors.deepPurple,
                            size: 25.0,
                          ),
                          labelText: 'If Music, Select Musical Instrument*',
                          labelStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.blue,
                              width: 10,
                            ),
                          ),
                        ),
                        hint: Text('Select Musical Instruments'),
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                        isDense: true,
                        focusNode: musicsFocusNode,
                        options: Musics.values,
                        titleBuilder: (music) => Text(describeEnum(music)),
                        chipLabelBuilder: (music) => Text(describeEnum(music)),
                        initialValues: _formResult.musics,
                        // ignore: missing_return
                        validator: (musics) {
                          if (musics.length == 3)
                            return 'Maximum of 2 musical Instruments can only be selected';
                          if (musics.length == 4)
                            return 'Maximum of 2 musical Instruments can only be selected';
                          if (musics.length == 5)
                            return 'Maximum of 2 musical Instruments can only be selected';
                          if (musics.length == 6)
                            return 'Maximum of 2 musical Instruments can only be selected';
                          if (musics.length == 7)
                            return 'Maximum of 2 musical Instruments can only be selected';
                          if (musics.length == 8)
                            return 'Maximum of 2 musical Instruments can only be selected';
                          if (musics.length == 9)
                            return 'Maximum of 2 musical Instruments can only be selected';
                          if (musics.length == 10)
                            return 'Maximum of 2 musical Instruments can only be selected';
                          if (musics.length == 11)
                            return 'Maximum of 2 musical Instruments can only be selected';
                          return null;
                        },
                        onSaved: (musics) {
                          parent.musics = musics;
                        },
                        onChanged: (_) {
                          FocusScope.of(context).unfocus();
                          FocusScope.of(context).requestFocus(musicsFocusNode);
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      new TextFormField(
                        controller: _duration,
                        decoration: new InputDecoration(
                          icon: const Icon(
                            Icons.calendar_view_day,
                            color: Colors.deepPurple,
                            size: 25.0,
                          ),
                          labelText: 'Duration(Weeks)*',
                          labelStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                          hintText: 'e.g 1, 2, 3, 4 e.t.c',
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
                            val.isEmpty ? 'Duration is required' : null,
                        onSaved: (val) => parent.duration = val,
                      ),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      MyMultiSelectionFormField<Day>(
                        decoration: InputDecoration(
                          icon: const Icon(
                            Icons.view_day,
                            color: Colors.deepPurple,
                            size: 25.0,
                          ),
                          labelText: 'Preferred day(s) to be tutored*',
                          labelStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.blue,
                              width: 10,
                            ),
                          ),
                        ),
                        hint: Text('Select days'),
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                        isDense: true,
                        focusNode: subjectsFocusNode,
                        options: Day.values,
                        titleBuilder: (day) => Text(describeEnum(day)),
                        chipLabelBuilder: (day) => Text(describeEnum(day)),
                        initialValues: _formResult.days,
                        validator: (days) =>
                            days.length == 0 ? 'Select Days' : null,
                        onSaved: (days) {
                          parent.days = days;
                        },
                        onChanged: (_) {
                          FocusScope.of(context).unfocus();
                          FocusScope.of(context)
                              .requestFocus(subjectsFocusNode);
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      new TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          // only accept letters from a to z
                          FilteringTextInputFormatter(
                              RegExp(r'^[()\d -]{1,11}$'),
                              allow: true)
                        ],
                        decoration: new InputDecoration(
                          icon: icon2,
                          labelText: 'How many Days per Week*',
                          labelStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                          hintText: 'Enter number of days above',
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
                        validator: (val) => val.isEmpty || val.length != 1
                            ? 'Number must be between 1 and 6'
                            : null,
                        onSaved: (val) => parent.numberdays = val,
                        controller: _days,
                      ),
                      Text(
                          'Kindly Note that the duration of classes is between 1 and 2 hours',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              color: Colors.red)),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      SizedBox(height: 8.0),
                      Container(
                        padding: const EdgeInsets.only(left: 40.0, top: 10.0),
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 25.0),
                        alignment: Alignment.center,
                        child: RichText(
                            text: TextSpan(
                                text: 'Grade A [CODE: 2916.67]:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    color: Colors.deepPurple),
                                children: <TextSpan>[
                              TextSpan(
                                  text:
                                      ' Masters Holder with 6 years Teaching Experience or a Bachelor\'s Degree with 12 Years experience in a particular teaching Subject',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      color: Colors.black)),
                            ])),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 40.0, top: 10.0),
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 25.0),
                        alignment: Alignment.center,
                        child: RichText(
                            text: TextSpan(
                                text: 'Grade B [CODE: 2083.33]: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    color: Colors.deepPurple),
                                children: <TextSpan>[
                              TextSpan(
                                  text:
                                      ' B.Sc./HND with 5years Teaching experience and above',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      color: Colors.black)),
                            ])),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 40.0, top: 10.0),
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 25.0),
                        alignment: Alignment.center,
                        child: RichText(
                            text: TextSpan(
                                text: 'Grade C [CODE: 1666.67]: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    color: Colors.deepPurple),
                                children: <TextSpan>[
                              TextSpan(
                                  text:
                                      'Fresh Graduate Bachelor\'s Degree/HND Holders',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      color: Colors.black)),
                            ])),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 40.0, top: 10.0),
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 25.0),
                        alignment: Alignment.center,
                        child: RichText(
                            text: TextSpan(
                                text: 'Grade D [CODE: 1416.67]: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    color: Colors.deepPurple),
                                children: <TextSpan>[
                              TextSpan(
                                  text: ' NCE Holders with 5 years Experience',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      color: Colors.black)),
                            ])),
                      ),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      new FormField<String>(
                          builder: (FormFieldState<String> state) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            icon: const Icon(
                              Icons.star,
                              color: Colors.deepPurple,
                              size: 25.0,
                            ),
                            labelText: 'Your Grade Code*',
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
                          isEmpty: _selectedGrades == '',
                          child: new DropdownButtonHideUnderline(
                            child: new DropdownButton(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold),
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
                      }, validator: (val) {
                        return val != '' ? null : 'Please select a grade';
                      }),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      new TextFormField(
                        controller: _code,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          icon: const Icon(
                            Icons.star,
                            color: Colors.deepPurple,
                            size: 25.0,
                          ),
                          labelText: 'Grade code of Tutor*',
                          labelStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                          hintText: '2916.67, 2083.33, 1666.67, 1416.67',
                          hintStyle: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.blue,
                              width: 10,
                            ),
                          ),
                        ),
                        validator: (code) {
                          if (code == null || code.isEmpty) {
                            return 'Grade code is required';
                          }
                          if (code.length <= 7 ||
                              code == 2916.67 ||
                              code == 2083.33)
                            (code == 1666.67) || (code == 1416.67);
                          return null;
                        },
                        onSaved: (val) => parent.code = val,
                      ),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      ElevatedButton(
                        onPressed: _doMul,
                        child: Text(
                          'Get Amount',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // <-- Radius
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      new TextFormField(
                        enabled: false, //Not clickable and not editable
                        readOnly: true, //Clickable and not editable
                        controller: myController,
                        decoration: new InputDecoration(
                          icon: const Icon(
                            Icons.account_balance_wallet,
                            color: Colors.deepPurple,
                            size: 25.0,
                          ),
                          labelText: '$totalAmount',
                          labelStyle: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: 'Montserrat'),
                          fillColor: Colors.red,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.black,
                              width: 10,
                            ),
                          ),
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'amount is required' : null,
                        onSaved: (val) => parent.totalAmount = val,
                      ),

                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      new Row(children: <Widget>[
                        new Expanded(
                            flex: 4,
                            child: new TextFormField(
                              decoration: new InputDecoration(
                                icon: const Icon(Icons.calendar_today,
                                    color: Colors.deepPurple, size: 25.0),
                                labelText: 'Proposed Start Date*',
                                labelStyle: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                                hintText: 'When do you intend to start',
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
                              controller: _controller,
                              keyboardType: TextInputType.datetime,
                              onSaved: (val) => parent.startDate = val,
                            )),
                        new IconButton(
                          icon: new Icon(Icons.more_horiz),
                          tooltip: 'Choose date',
                          onPressed: (() {
                            _selectDate(context, _controller.text);
                          }),
                        )
                      ]),

                      // totalAmountWidget(totalAmount),

                      Padding(padding: EdgeInsets.only(top: 40.0)),
                      new TextFormField(
                        maxLength: 100,
                        maxLines: 5,
                        decoration: new InputDecoration(
                          icon: const Icon(
                            Icons.assessment,
                            color: Colors.deepPurple,
                            size: 25.0,
                          ),
                          labelText:
                              'State Improvements you want to see in your child*',
                          labelStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                          hintText:
                              'e.g My Son has been performing below average in mathematics, but i want a tutor that will brace up his Skills in Mathematics to 90% and above',
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
                            val.isEmpty ? 'improvements is required' : null,
                      ),
                      new Container(
                          width: 700,
                          padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
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
                              onPressed: _submitForm)),
                      Padding(padding: EdgeInsets.only(bottom: 30.0)),
                      Container(
                          child: Text('Copyright © 2022 Marvlight Tutors',
                              textAlign: TextAlign.center)),
                    ],
                  ))),
        ));
  }

//   _onSelectedState(String value) {
// //     setState(() {
// //       _selectedLGA = "Select LGA ..";
// //       _lgas = ["Select LGA"];
// //       _selectedState = value;
// //       _lgas = List.from(_lgas)..addAll(repo.getLocalByState(value));
// //     });
// //   }

// //   _onSelectedLGA(String value) {
// //     setState(() => _selectedLGA = value);
// //   }
// // }

  // Widget totalAmountWidget(totalAmount) {
  //   bool canShow = false;
  //   String _totalAmount = totalAmount;
  //   if (_totalAmount.length > 0) {
  //     canShow = true;
  //   }
  //   return Container(
  //       margin: EdgeInsets.only(top: 10.0),
  //       child: canShow
  //           ? Column(
  //               children: <Widget>[
  //                 Text(
  //                   "Total Amount is",
  //                   style: TextStyle(
  //                       fontSize: 25.0,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.blue,
  //                       fontFamily: 'Montserrat'),
  //                 ),
  //                 Container(
  //                     child: Text(
  //                   _totalAmount,
  //                   style: TextStyle(
  //                       fontSize: 20.0,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.black,
  //                       fontFamily: 'Montserrat'),
  //                 ))
  //               ],
  //             )
  //           : Container());
  // }
}
