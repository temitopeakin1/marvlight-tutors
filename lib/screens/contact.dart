import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Marvlightcontact extends StatelessWidget {
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
        body: Container(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 30.0)),
          Image.asset("assets/images/marv.png",
              height: 150, width: 100, alignment: Alignment.center),
          Padding(padding: EdgeInsets.fromLTRB(40, 10, 40, 10)),
          Text(
              'Marvlight Tutors App connects you with Relevant Professionals Nationwide.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JosefinSans')),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Text('For Enquiries & Further Information, Contact Us ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JosefinSans')),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          SizedBox(
            width: 200.0,
            child: Divider(color: Colors.blue, thickness: 5.0),
          ),
          Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 10.0)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset("assets/icons/mail.png"),
                    ),
                    Expanded(
                      flex: 2,
                      child: Image.asset('assets/icons/phone.png'),
                    ),
                    Expanded(
                      child: Image.asset('assets/icons/whatsapp.png'),
                    ),
                  ],
                )

                // child: Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     elevabutton(
                //         color: Colors.white,
                //         splashColor: Colors.blue[700],
                //         animationDuration: Duration(seconds: 2),
                //         onPressed: () {
                //           customLaunch(
                //               'mailto:enquiries@marvlighttutors.com.ng?subject=test%20subject&body=test%20body');
                //         })
                // Text('Email: ',
                //     style: TextStyle(
                //         fontSize: 20.0,
                //         fontWeight: FontWeight.bold,
                //         fontFamily: 'JosefinSans')),
                // Padding(padding: EdgeInsets.only(top: 10.0)),
                // Text('hello'),

                //   Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         elevabutton(
                //           color: Colors.white,
                //           splashColor: Colors.blue[700],
                //           animationDuration: Duration(seconds: 2),
                //           onPressed: () {
                //             customLaunch(
                //                 'mailto:enquiries@marvlighttutors.com.ng?subject=test%20subject&body=test%20body');
                //           },
                //           child: Image.asset("assets/icons/mail.png",
                //               height: 80, width: 80),
                //         ),
                //         Padding(padding: EdgeInsets.only(top: 10.0)),
                //         elevabutton(
                //           color: Colors.white,
                //           splashColor: Colors.blue[700],
                //           animationDuration: Duration(seconds: 2),
                //           onPressed: () {
                //             customLaunch(
                //                 'https://wa.me/07068868117/?text=${Uri.parse("Hello Marvlight Tutors")}');
                //           },
                //           child: Image.asset("assets/icons/whatsapp.png",
                //               height: 80, width: 80),
                //         ),
                //         Padding(padding: EdgeInsets.only(top: 10.0)),
                //         elevabutton(
                //           color: Colors.white,
                //           splashColor: Colors.blue[700],
                //           animationDuration: Duration(seconds: 2),
                //           onPressed: () {
                //             customLaunch('tel:09061361223');
                //           },
                //           child: Image.asset("assets/icons/phone.png",
                //               height: 80, width: 80),
                //         ),
                //       ]),
                //   Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         Button(
                //           color: Colors.white,
                //           splashColor: Colors.blue[700],
                //           animationDuration: Duration(seconds: 2),
                //           onPressed: () {
                //             customLaunch('https://www.twitter.com/marvlighttutor1');
                //           },
                //           child: Image.asset("assets/icons/twitter.png",
                //               height: 80, width: 80),
                //         ),
                //         Padding(padding: EdgeInsets.only(top: 10.0)),
                //         elevabutton(
                //           color: Colors.white,
                //           splashColor: Colors.blue[700],
                //           animationDuration: Duration(seconds: 2),
                //           onPressed: () {
                //             customLaunch(
                //                 'https://www.facebook.com/marvlighttutors');
                //           },
                //           child: Image.asset("assets/icons/facebook.png",
                //               height: 80, width: 70),
                //         ),
                //       ])
                // ])
              ]))
        ]))));
  }

  elevabutton(
      {Color color,
      Color splashColor,
      Duration animationDuration,
      Null Function() onPressed,
      Image child}) {}

  // ignore: non_constant_identifier_names
  Button(
      {Color color,
      Color splashColor,
      Duration animationDuration,
      Null Function() onPressed,
      Image child}) {}
}

// Begin: the custom launch function
void customLaunch(command) async {
  if (await canLaunch(command)) {
    await launch(command);
  } else {
    print(' could not launch $command');
  }
}
// End: the custom launch function
