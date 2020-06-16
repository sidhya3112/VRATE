import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'timetable.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//OnboardUI
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoard(),
      routes: {
        '/login': (context) => Login(),
      },
    );
  }
}

class OnBoard extends StatefulWidget {
  OnBoard({Key key}) : super(key: key);
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  static const TextStyle Black40Style = TextStyle(
      fontSize: 50.0, color: Colors.black, fontWeight: FontWeight.bold);
  static const TextStyle White40Style = TextStyle(
      fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.bold);
  static const TextStyle White20Style = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );

  initState() {
    FirebaseAuth.instance
        .currentUser()
        .then((currentUser) => {
              if (currentUser == null)
                {Navigator.pushReplacementNamed(context, "/login")}
              else
                {
                  Firestore.instance
                      .collection("users")
                      .document(currentUser.uid)
                      .get()
                      .then((DocumentSnapshot result) =>
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TimeTable())))
                      .catchError((err) => print(err))
                }
            })
        .catchError((err) => print(err));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: LiquidSwipe(
        enableSlideIcon: true,
        positionSlideIcon: 0.5,
        enableLoop: false,
        waveType: WaveType.liquidReveal,
        pages: <Container>[
          Container(
            //INTRO PAGE 1
            color: Colors.blue[400],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'VRATE',
                        style: GoogleFonts.alice(textStyle: White20Style),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(60.0, 0.0, 60.0, 0.0),
                  child: Image.asset('images/teach.png'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Attend',
                        style: GoogleFonts.alike(textStyle: White40Style),
                      ),
                      Text(
                        'Lectures',
                        style: GoogleFonts.alike(textStyle: Black40Style),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Don't bunk lectures\n"
                        "and miss important concepts.",
                        style: GoogleFonts.average(textStyle: White20Style),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            //INTRO PAGE 2
            color: Colors.blue[700],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'VRATE',
                        style: GoogleFonts.alice(textStyle: White20Style),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(60.0, 0.0, 60.0, 0.0),
                  child: Image.asset('images/sleep.png'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Pay',
                        style: GoogleFonts.alike(textStyle: White40Style),
                      ),
                      Text(
                        'Attention',
                        style: GoogleFonts.alike(textStyle: Black40Style),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Don't sleep during lectures\n"
                        "and be attentive.",
                        style: GoogleFonts.average(textStyle: White20Style),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            //INTRO PAGE 3
            color: Colors.blue[900],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'VRATE',
                        style: GoogleFonts.alice(textStyle: White20Style),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(77.0, 0.0, 77.0, 0.0),
                  child: Image.asset('images/rate.png'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Rate',
                        style: GoogleFonts.alike(textStyle: White40Style),
                      ),
                      Text(
                        'Honestly',
                        style: GoogleFonts.alike(textStyle: Black40Style),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Help the teachers in improving \n"
                        "your learning experience by rating the lecture honestly.",
                        style: GoogleFonts.average(textStyle: White20Style),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        onPageChangeCallback: swipeFinished,
      ),
    );
  }

  void swipeFinished(int pageNum) {
    if (pageNum == 2) {
      Navigator.pushNamed(context, '/login');
    }
  }
}
