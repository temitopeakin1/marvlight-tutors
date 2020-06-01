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
    return new MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  //Ticker Mixin for Animations
  Animation<double> _animation;
  AnimationController _animationController;

 
 @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(
            seconds: 2
            )); //specify the duration for the animation & include `this` for the vsyc
    _animation = Tween<double>(begin: 1.0, end: 2.0).animate
    ( 
        _animationController
        ); //use Tween animation here, to animate between the values of 1.0 & 2.5.

    _animation.addListener(() {
      //here, a listener that rebuilds our widget tree when animation.value chnages
      setState(() {});
    });

    _animation.addStatusListener((status) {
      //AnimationStatus gives the current status of our animation, we want to go back to its previous state after completing its animation
      if (status == AnimationStatus.completed) {
        _animationController
            .reverse(); //reverse the animation back here if its completed
      }
    });
  }

  
  Widget build(BuildContext context) {
  return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Marvlight Tutors App',
        theme: ThemeData(primaryColor: Colors.blue),  
        home: Scaffold(
          appBar: AppBar(
              centerTitle: true, 
          title: Text('Marvlight Tutors', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Comic Sans', fontSize: 25.0),
          ),
      ),
   
      backgroundColor: Colors.white,
        drawer: Drawer(
             child: Container(
              child: ListView(
             padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
               children: <Widget>[
               DrawerHeader(
                 child: Container(),
                  decoration: BoxDecoration(
                   image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/images/marv.png')
                    ),  
                   ),
                 ),
                  ListTile(
                   leading: Icon(Icons.verified_user, size: 16.0, color: Colors.deepPurple),
                   title: Text('Get a Tutor', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto')),
                    onTap: () {
                     // Navigate to the second screen using a named route.
                         Navigator.push(context, 
                         MaterialPageRoute(builder: (context) {
                           return Marvlightparentform( );
                         })); 
                     },
                 ),
                  ListTile(
                 leading: Icon(Icons.verified_user, size: 16.0, color: Colors.deepPurple),
                 title: Text('Get a Researcher', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto')),
               onTap: () {
                     // Navigate to the second screen using a named route.
                         Navigator.push(context, 
                         MaterialPageRoute(builder: (context) {
                           return Getresearcherform();
                                                    })); 
                                                },
                                           ),
                                             ListTile(
                                            leading: Icon(Icons.border_color, size: 16.0, color: Colors.deepPurple),
                                            title: Text('Become a Tutor', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto')),
                                           onTap: () {
                                                // Navigate to the second screen using a named route.
                                                    Navigator.push(context, 
                                                    MaterialPageRoute(builder: (context) {
                                                      return Marvlighttutorform();
                                                    })); 
                                                },
                                         ),
                                          ListTile(
                                           leading: Icon(Icons.library_books, size: 16.0, color: Colors.deepPurple),
                                           title: Text('Become a Researcher', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto')),
                                           onTap: () {
                                                // Navigate to the second screen using a named route.
                                                    Navigator.push(context, 
                                                    MaterialPageRoute(builder: (context) {
                                                      return Marvlightresearcherform();
                                                    })); 
                                                },
                                         ),
                                          ListTile(
                                           leading: Icon(Icons.contact_mail, size: 16.0, color: Colors.deepPurple),
                                           title: Text('Contact Us', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto')),
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

                                             ImageBanner("assets/images/tutorhome1.jpg"),
                                                Padding(padding: EdgeInsets.only(bottom:30.0)),
                                               
                                               Image.asset("assets/icons/tutor.png", height: 100, width: 100, alignment: Alignment.center),
                                                Padding(padding: EdgeInsets.only(bottom:10.0)),
                                                 Text('Your Best Link Up with Professional \n Private Tutors Nationwide',
                                                 textAlign: TextAlign.center,
                                                 style: TextStyle(fontSize: 18.0, fontFamily: 'JosefinSans',fontWeight: FontWeight.bold)),
                                                 Padding(padding: EdgeInsets.only(bottom:10.0)),
                                                  
                                              Image.asset("assets/icons/reading.png", height: 150, width: 150, alignment: Alignment.center),
                                              Text('Self-Paced Learning Strategies \n  with Assured Positive Results',
                                              textAlign: TextAlign.center,
                                               style: TextStyle( fontSize: 18.0, fontFamily: 'JosefinSans',fontWeight: FontWeight.bold)),
                                            Padding(padding: EdgeInsets.only(bottom:20.0)),
                           
                                             
                                             Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Image.asset("assets/icons/shield.png", height: 100, width: 100, alignment: Alignment.center),
                                             ),
                                              Padding(padding: EdgeInsets.only(bottom:10.0)),
                                            Text('Credible & Advanced Secured Platform \n to keep you going',
                                             textAlign: TextAlign.center,
                                              style: TextStyle( fontSize: 18.0, fontFamily: 'JosefinSans',fontWeight: FontWeight.bold)), 
                                              Padding(padding: EdgeInsets.only(bottom:20.0)),
                           
                                           Image.asset("assets/icons/excellence.png", height: 150, width: 150, alignment: Alignment.center),
                                           Padding(padding: EdgeInsets.only(bottom:5.0)),
                                            Text('Excellence,\n Our Foremost Watchward',
                                             textAlign: TextAlign.center,
                                              style: TextStyle( fontSize: 18.0, fontFamily: 'JosefinSans',fontWeight: FontWeight.bold)), 
                                              Padding(padding: EdgeInsets.only(bottom:30.0)),
                                             
                                     Container(
                                       color: Colors.grey[300],
                                         margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                                            alignment: Alignment.center,
                                             child: new Text("Click the Links below to get started",
                                          style: TextStyle(
                                            fontSize: 23.0,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: 'Pacifico'
                                          ),
                                        ),
                                       ),
                                       Padding(padding: EdgeInsets.only(bottom:20.0)),
                                Center(
                                   child: ButtonTheme(
                                       minWidth: 88.0 *
                                         _animation
                                             .value, //multiply the static width value with current animation.value value
                                     height: 36.0 *
                                         _animation
                                             .value, //multiply the static height value with current animation.value value
                                   child: RaisedButton(
                                       child: Text('Get a Researcher',  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'Roboto')),
                                       shape: new RoundedRectangleBorder(
                                                 borderRadius: new BorderRadius.circular(40.0)),
                                        onPressed: () {
                                                        _animationController
                                                            .forward();
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
                                                  child: RaisedButton(
                                                      child: Text('Parent\'s Request Form',  style: TextStyle(fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.w600, fontFamily: 'Roboto')),
                                                      shape: new RoundedRectangleBorder(
                                                                borderRadius: new BorderRadius.circular(40.0)),
                                                       onPressed: () {
                                                          _animationController
                                                            .forward();
                                                               Navigator.push(context, 
                                                                   MaterialPageRoute(builder: (context) {
                                                                     return Marvlightparentform();
                                                                   
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
                                                  child: RaisedButton(
                                                      child: Text('Tutor\'s Application Form',  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'Roboto')),
                                                      shape: new RoundedRectangleBorder(
                                                                borderRadius: new BorderRadius.circular(40.0)),
                                                       onPressed: () {
                                                          _animationController
                                                            .forward();
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
                                                  child: RaisedButton(
                                                      child: Text('Researcher\'s Application Form',  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'Roboto')),
                                                      shape: new RoundedRectangleBorder(
                                                                borderRadius: new BorderRadius.circular(40.0)),
                                                       onPressed: () {
                                                          _animationController
                                                            .forward();
                                                               Navigator.push(
                                                                 context, 
                                                                   MaterialPageRoute(builder: (context) =>  Marvlightresearcherform()),
                                                                   ); 
                                                                  },
                                                                ),
                                                              ),
                                                           ),
                                                              Padding(padding: EdgeInsets.only(bottom:30.0))
                                        
                                                           
                                                            ],
                                                          )
                                                        )
                                                      ],
                                                    )
                                                  )
                                                ),
                                                  
                                              );
                                            }
                                          }
