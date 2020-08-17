import 'package:flutter/material.dart';
import 'package:marvapp/screens/mainscreen.dart';
import 'package:marvapp/screens/parentrequestform.dart';
import 'package:marvapp/screens/tutor_form.dart';

void main() => runApp(Bottomnav());

class Bottomnav extends StatefulWidget {
  @override
  _BottomnavState createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {

   int _currentIndex = 0;

  final List<Widget> _children = [
    MainScreen(),
    Marvlightparentform(),
    Marvlighttutorform(),
  ];
  
 
  void onTappedBar(int index){
    setState(() {
      _currentIndex = index; 
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body:  _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
         items:[
              BottomNavigationBarItem(
                icon: new Icon(Icons.home, color: Colors.red),
                title: new Text("Home",  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, fontFamily: 'Comic Sans', color: Colors.black))
                ),
                  BottomNavigationBarItem(
                icon: new Icon(Icons.verified_user, color: Colors.red),
                title: new Text("Get a Tutor",  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, fontFamily: 'Comic Sans',color: Colors.black))
                ),
                  BottomNavigationBarItem(
                icon: new Icon(Icons.border_color, color: Colors.red),
                title: new Text("Become a Tutor",  style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, fontFamily: 'Comic Sans', color: Colors.black))
                ),
                  BottomNavigationBarItem(
                icon: new Icon(Icons.person,  color: Colors.red),
                title: new Text("Profile", style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, fontFamily: 'Comic Sans', color: Colors.black))
                ),
            ] 
      ),
      
    );
  }
}

