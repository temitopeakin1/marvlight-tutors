import 'package:flutter/material.dart';
import 'package:marvapp/image_banner.dart';
import 'package:marvapp/screens/becomeresearcher.dart';
import 'package:marvapp/screens/contact.dart';
import 'package:marvapp/screens/parentrequestform.dart';
import 'package:marvapp/screens/tutor_form.dart';
import 'package:marvapp/screens/getresearcher.dart';

void main() => runApp(MainScreen());

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

//Ticker Mixin for Animations
  Animation<double> _animation;
  AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
                2)); //specify the duration for the animation & include `this` for the vsyc
    _animation = Tween<double>(begin: 1.0, end: 2.0).animate(
        _animationController); //use Tween animation here, to animate between the values of 1.0 & 2.5.

    _animation.addListener(() {
      // a listener that rebuilds our widget tree when animation.value chnages
      setState(() {});
    });

    _animation.addStatusListener((status) {
      //AnimationStatus to give the current status of our animation, we want to go back to its previous state after completing its animation
      if (status == AnimationStatus.completed) {
        _animationController
            .reverse(); //reverse the animation back here if its completed
      }
    });
  }

  Widget build(BuildContext context) {
    var textStyle = TextStyle(
        fontSize: 18.0, fontFamily: 'JosefinSans', fontWeight: FontWeight.bold);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marvlight Tutors App',
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
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
          bottomNavigationBar: BottomNavigationBar(
              onTap: onTappedBar,
              iconSize: 30.0,
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: new Icon(Icons.home, color: Colors.red),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.verified_user, color: Colors.red),
                  label: 'Get a Tutor',
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.border_color, color: Colors.red),
                  label: 'Become a Tutor',
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.person, color: Colors.red),
                  label: 'Profile',
                ),
              ]),
          drawer: Drawer(
            child: Container(
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    child: Container(),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('assets/images/marv.png')),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.verified_user,
                        size: 16.0, color: Colors.deepPurple),
                    title: Text('Get a Tutor',
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto')),
                    onTap: () {
                      // Navigate to the second screen using a named route.
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Marvlightparentform();
                      }));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.border_color,
                        size: 16.0, color: Colors.deepPurple),
                    title: Text('Become a Tutor',
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto')),
                    onTap: () {
                      // Navigate to the second screen using a named route.
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Marvlighttutorform();
                      }));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.verified_user,
                        size: 16.0, color: Colors.deepPurple),
                    title: Text('Get a Project Assistant',
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto')),
                    onTap: () {
                      // Navigate to the second screen using a named route.
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Getresearcherform();
                      }));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.library_books,
                        size: 16.0, color: Colors.deepPurple),
                    title: Text('Become a Project Assistant',
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto')),
                    onTap: () {
                      // Navigate to the second screen using a named route.
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Marvlightresearcherform();
                      }));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.contact_mail,
                        size: 16.0, color: Colors.deepPurple),
                    title: Text('Contact Us',
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto')),
                    onTap: () {
                      // Navigate to the second screen using a named route.
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Marvlightcontact();
                      }));
                    },
                  ),
                ],
              ),
            ),
          ),
          body: Container(
              child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                  delegate: SliverChildListDelegate(
                [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: ImageBanner("assets/images/tutorhome1.jpg"),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 25.0)),
                  Image.asset("assets/icons/tutor.png",
                      height: 100, width: 100, alignment: Alignment.center),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Text(
                      'Your Best Link Up with Professional \n Private Tutors Nationwide',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'JosefinSans',
                          fontWeight: FontWeight.bold)),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  Image.asset("assets/icons/reading.png",
                      height: 150, width: 150, alignment: Alignment.center),
                  Text(
                      'Self-Paced Learning Strategies \n  with Assured Positive Results',
                      textAlign: TextAlign.center,
                      style: textStyle),
                  Padding(padding: EdgeInsets.only(bottom: 20.0)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/icons/practical.jpg",
                        height: 110, width: 110, alignment: Alignment.center),
                  ),
                  Text('We offer Exceptional \n Practical Classes at Home',
                      textAlign: TextAlign.center, style: textStyle),
                  Padding(padding: EdgeInsets.only(bottom: 20.0)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/icons/shield.png",
                        height: 100, width: 100, alignment: Alignment.center),
                  ),
                  /*  Padding(padding: EdgeInsets.only(bottom: 10.0)), */
                  Text(
                      'Credible & Advanced Secured \n Platform to keep you going',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'JosefinSans',
                          fontWeight: FontWeight.bold)),
                  Padding(padding: EdgeInsets.only(bottom: 20.0)),
                  Image.asset("assets/icons/excellence.png",
                      height: 150, width: 150, alignment: Alignment.center),
                  Padding(padding: EdgeInsets.only(bottom: 5.0)),
                  Text('Excellence \n Our Foremost Watchward',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'JosefinSans',
                          fontWeight: FontWeight.bold)),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  Container(
                    color: Colors.grey[300],
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    alignment: Alignment.center,
                    child: new Text(
                      "Click the Links below to get started",
                      style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Pacifico'),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 17.0)),
                  Center(
                    child: ButtonTheme(
                      minWidth: 88.0 *
                          _animation
                              .value, //multiply the static width value with current animation.value value
                      height: 36.0 * _animation.value,
                      //multiply the static height value with current animation.value value

                      child: ElevatedButton(
                        child: Text('Get a Tutor',
                            style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto')),
                        onPressed: () {
                          _animationController.forward();
                          new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0));
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Marvlightparentform();
                          }));
                        },
                      ),
                    ),
                  ),
                  // Card(
                  //   child: InkWell(
                  //     splashColor: Colors.blue.withAlpha(30),
                  //     onTap: () {
                  //       debugPrint('Card tapped.');
                  //     },
                  //     child: const SizedBox(
                  //       width: 100,
                  //       height: 100,
                  //       child: Text(
                  //         'Get a Tutor',
                  //         style: TextStyle(
                  //           fontSize: 20.0,
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.w600,
                  //           fontFamily: 'Roboto',
                  //           backgroundColor: Colors.blueAccent,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Center(
                    child: ButtonTheme(
                      minWidth: 88.0 *
                          _animation
                              .value, //multiply the static width value with current animation.value value
                      height: 36.0 *
                          _animation
                              .value, //multiply the static height value with current animation.value value
                      child: ElevatedButton(
                        child: Text('Get a Project Assistant',
                            style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontFamily: 'Roboto')),
                        onPressed: () {
                          new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0));
                          _animationController.forward();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Getresearcherform();
                          }));
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: ButtonTheme(
                      minWidth: 88.0 *
                          _animation
                              .value, //multiply the static width value with current animation.value value
                      height: 36.0 *
                          _animation
                              .value, //multiply the static height value with current animation.value value
                      child: ElevatedButton(
                        child: Text('Tutor\'s Application Form',
                            style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontFamily: 'Roboto')),
                        // shape: new RoundedRectangleBorder(
                        //     borderRadius: new BorderRadius.circular(40.0)),
                        onPressed: () {
                          _animationController.forward();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Marvlighttutorform();
                          }));
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: ButtonTheme(
                      minWidth: 88.0 *
                          _animation
                              .value, //multiply the static width value with current animation.value value
                      height: 36.0 *
                          _animation
                              .value, //multiply the static height value with current animation.value value
                      child: ElevatedButton(
                        child: Text('Project Assistant Application Form',
                            style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontFamily: 'Roboto')),
                        // shape: new RoundedRectangleBorder(
                        //     borderRadius: new BorderRadius.circular(40.0)),
                        onPressed: () {
                          _animationController.forward();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Marvlightresearcherform()),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 30.0)),
                ],
              ))
            ],
          ))),
    );
  }
}
