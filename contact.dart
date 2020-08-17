import 'package:flutter/material.dart';


class Marvlightcontact extends StatelessWidget {

   @override
  Widget build(BuildContext context) {
    return new Scaffold(
     appBar: AppBar( backgroundColor: Colors.blue,
              centerTitle: true, 
          title: Text('Marvlight Tutors', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Comic Sans', fontSize: 25.0),
          
          ),
           ),
backgroundColor: Colors.white,
    body: Container(
      child: Column(
        children: <Widget>[
           Padding(
                   padding: EdgeInsets.only(top: 50.0)),
                    Image.asset("assets/images/marv.png",
                     height: 150, 
                      width: 100,
                       alignment: Alignment.center
                       ),
                      Padding(
                   padding: EdgeInsets.only(top: 10.0)),
             Text('Marvlight Tutors App connects you with Relevant Professional tutors Nationwide.',
              textAlign: TextAlign.center,
             style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,fontFamily: 'JosefinSans')),
           Padding(
                   padding: EdgeInsets.only(top: 10.0)),
               Text('For Enquiries & Information \n Call +2349061361223 / +2348130958990',
               style: TextStyle( fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'JosefinSans'),
                textAlign: TextAlign.center,
               ),
               Padding(
                   padding: EdgeInsets.only(top: 10.0)),
               Text('E-mail : enquiries@marvlighttutors.com.ng',
               style: TextStyle( fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'JosefinSans'),
                textAlign: TextAlign.center,
               ),
               
               
       ]
    )
    )
    
    );
    
  }
  
}