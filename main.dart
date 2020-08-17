import 'package:flutter/material.dart';
import 'package:marvapp/screens/mainscreen.dart';
import 'package:splashscreen/splashscreen.dart';


void main() => runApp(Marvlight());

class Marvlight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
    title: 'Marvlight Tutors App',
     theme: ThemeData(
          primarySwatch: Colors.red,
          ),
           home: MyApp(),
     
   
       );
  }
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
       child: Center(
       child: SplashScreen(
              seconds: 10,
              navigateAfterSeconds: new MainScreen(),
               title: new Text(
                '...Your Professional Private Tutors',
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.deepPurple, fontFamily: 'Comic Sans')),
              image: Image.asset('assets/images/marv.png'),
              backgroundColor: Colors.lightBlue[50],
              loadingText: Text('Welcome', style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0,  fontFamily: 'Comic Sans')),
              photoSize: 110.0,
              loaderColor: Colors.red,
         ),
       ),
     );
    }
      
}
