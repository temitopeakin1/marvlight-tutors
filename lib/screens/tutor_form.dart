import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new Marvlighttutorform());

enum Subjects {
  Animations,
  BasicScience,
  BasicTech,
  Businessstudies,
  Biology,
  Programming,
  CivicEducation,
  Commerce,
  Computerstudies,
  Chemistry,
  EnglishLanguage,
  Economics,
  French,
  FurtherMathematics,
  FinanacialAccounting,
  CreativeArts,
  Fishery,
  Physics,
  Literature,
  GraphicsDesign,
  Government,
  Geography,
  Mathematics,
  Music,
  Numeracy,
  PhonicsDiction,
  QuantutativeReasoning,
  VerbalAptitude,
  PreVocationalStudies,
  TechnicalDrawing,
  DailyAssistantAssignment,
  MakeUptraining
}

enum Musics {
  Violin,
  Keyboard,
  Guitar,
  Drum,
  Xylophone,
  Flute,
  Trumpet,
  Saxophone
}

class Tutor {
  String key;
  String name = '';
  String phone = '';
  String state = '';
  String email = '';
  String institution = '';
  String graduation = '';
  String course = '';
  List<Subjects> subjects;
  List<Musics> musics;
  String selectedGrade = '';
  String gender = '';
  String address = '';
  String account = '';

  Tutor(
      {this.name,
      this.phone,
      this.state,
      this.email,
      this.institution,
      this.graduation,
      this.course,
      List<Subjects> subjects,
      List<Musics> musics,
      this.selectedGrade,
      this.gender,
      this.address,
      this.account}) {
    this.subjects = subjects ?? [];
    this.musics = musics ?? [];
  }

  Tutor.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        name = snapshot.value["name"],
        phone = snapshot.value["phone"],
        state = snapshot.value["state"],
        email = snapshot.value["email"],
        institution = snapshot.value["institution"],
        graduation = snapshot.value["graduation"],
        course = snapshot.value["course"],
        subjects = snapshot.value["List<Subjects>"],
        musics = snapshot.value["List<Musics>"],
        selectedGrade = snapshot.value["selectedGrade"],
        gender = snapshot.value["gender"],
        address = snapshot.value["address"],
        account = snapshot.value["account"];

  toJson() {
    return {
      "name": name,
      "phone": phone,
      "state": state,
      "email": email,
      "institution": institution,
      "graduation": graduation,
      "course": course,
      "subjects": subjects.toString(),
      "musics": musics.toString(),
      "selectedGrade": selectedGrade,
      "gender": gender,
      "address": address,
      "account": account,
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

class Marvlighttutorform extends StatefulWidget {
  Marvlighttutorform({
    Key key,
    this.tutor,
    String title,
  }) : super(key: key);
  final Tutor tutor;
  @override
  _MarvlighttutorformState createState() => new _MarvlighttutorformState();
}

final mainReference = FirebaseDatabase.instance.reference();

class _MarvlighttutorformState extends State<Marvlighttutorform> {
  List<Tutor> tutors = [];
  Tutor tutor;
  DatabaseReference tutorRef;

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formResult = Tutor();
  final subjectsFocusNode = FocusNode();
  final musicsFocusNode = FocusNode();

  List<String> _selectedGrades = <String>[
    '',
    'Grade A',
    'Grade B',
    'Grade C',
    'Grade D'
  ];
  List<String> _genders = <String>['', 'Male', 'Female'];
  String _gender = '';
  String _selectedGrade = '';

  @override
  void initState() {
    super.initState();

    tutor = Tutor();
    final FirebaseDatabase database = FirebaseDatabase();
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
    var old = tutors.singleWhere((entry) => entry.key == event.snapshot.key);
    {}
    setState(() {
      tutors[tutors.indexOf(old)] = Tutor.fromSnapshot(event.snapshot);
    });
  }

  Tutor newContact = new Tutor();
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
    }
    if (value.length != 10) {
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
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        backgroundColor: color,
        content: new Text(
            'Thank you, Your Application to become a Tutor has been recieved. We will get back to you via Email or Phone',
            style: TextStyle(fontSize: 18.0, fontFamily: 'Comic sans'))));
  }

  void submitForm() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
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
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text(
            'Marvlight Tutors',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Comic Sans',
              fontSize: 25.0,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        body: Container(
          child: new Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: new SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(30, 50, 25, 25),
                  child: Column(
                    children: <Widget>[
                      Text('Apply as a Tutor',
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
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 25.0),
                        alignment: Alignment.center,
                        child: RichText(
                            text: TextSpan(
                                text: 'P.S ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    color: Colors.red),
                                children: <TextSpan>[
                              TextSpan(
                                  text:
                                      ': Applications are Subject to Proper Written and Oral Interview to be qualified as a Marvlight Tutor',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      color: Colors.black)),
                            ])),
                      ),
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
                        onSaved: (val) => tutor.name = val,
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
                                  tutor.gender = newValue;
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
                        onSaved: (val) => tutor.address = val,
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
                        onSaved: (val) => tutor.phone = val,
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
                            hintText: 'Enter Valid E-mail',
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
                            tutor.email = val;
                          }),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      new TextFormField(
                          decoration: new InputDecoration(
                            icon: const Icon(
                              Icons.school,
                              color: Colors.deepPurple,
                              size: 25.0,
                            ),
                            labelText: 'Institution Attended*',
                            labelStyle: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                            hintText: 'e.g University of Abuja, FUTO, e.t.c',
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
                              val.isEmpty ? 'Institution is required' : null,
                          onSaved: (String val) {
                            tutor.institution = val;
                          }),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      new TextFormField(
                          decoration: new InputDecoration(
                            icon: const Icon(
                              Icons.calendar_view_day,
                              color: Colors.deepPurple,
                              size: 25.0,
                            ),
                            labelText: 'Graduation Year*',
                            labelStyle: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                            hintText: 'e.g 1998, 2005',
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
                          keyboardType: TextInputType.number,
                          validator: (graduations) {
                            if (graduations.isEmpty)
                              return 'Graduation Year is required*';
                            if (graduations.length == 1)
                              return 'Incorrect graduation year';
                            if (graduations.length == 2)
                              return 'Incorrect graduation year';
                            if (graduations.length == 3)
                              return 'Incorrect graduation year';
                            if (graduations.length == 5)
                              return 'Incorrect graduation year';
                            return null;
                          },
                          onSaved: (String val) {
                            tutor.graduation = val;
                          }),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      new TextFormField(
                          decoration: new InputDecoration(
                            icon: const Icon(
                              Icons.book,
                              color: Colors.deepPurple,
                              size: 25.0,
                            ),
                            labelText: 'Course of Study*',
                            labelStyle: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                            hintText:
                                'e.g Computer Science, Business Administration, e.t.c',
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
                              ? 'Course of Study is required'
                              : null,
                          onSaved: (String val) {
                            tutor.course = val;
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
                        onSaved: (val) => tutor.state = val,
                      ),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      SizedBox(height: 8.0),
                      MyMultiSelectionFormField<Subjects>(
                        decoration: InputDecoration(
                          icon: const Icon(
                            Icons.subject,
                            color: Colors.deepPurple,
                            size: 25.0,
                          ),
                          labelText: 'Subject(s) to tutor*',
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
                        //validator: (subjects) => subjects.length == 4
                        //  ? 'Maximum of 3 subjects can only be selected'
                        //: null,
                        // ignore: missing_return
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
                          tutor.subjects = subjects;
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
                          tutor.musics = musics;
                        },
                        onChanged: (_) {
                          FocusScope.of(context).unfocus();
                          FocusScope.of(context).requestFocus(musicsFocusNode);
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 40.0, top: 10.0),
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 25.0),
                        alignment: Alignment.center,
                        child: RichText(
                            text: TextSpan(
                                text: 'Grade A : ',
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
                                text: 'Grade B : ',
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
                                text: 'Grade C : ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    color: Colors.deepPurple),
                                children: <TextSpan>[
                              TextSpan(
                                  text:
                                      ' Fresh Graduate Bachelor\'s Degree/HND Holders',
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
                                text: 'Grade D : ',
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
                            labelText: 'Grade that applies to you*',
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
                          isEmpty: _selectedGrade == '',
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
                      }, validator: (val) {
                        return val != '' ? null : 'Please select a grade';
                      }),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      new TextFormField(
                        decoration: new InputDecoration(
                          icon: const Icon(
                            Icons.account_balance_wallet_sharp,
                            color: Colors.deepPurple,
                            size: 25.0,
                          ),
                          labelText: 'Account Number*',
                          labelStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                          hintText: 'XXXXXXXX',
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
                            val.isEmpty ? 'Account number is required' : null,
                        onSaved: (val) => tutor.account = val,
                      ),
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
                          hintText:
                              'e.g. I am a Christain and currently Teaching with Best Brains School, and my Major goal is to bring out the best in every weak student ',
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
        ));
  }
}
