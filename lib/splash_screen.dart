import 'package:flutter/material.dart';
import 'package:vrate/swipe_screen.dart';
import 'main_timetable.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      FirebaseAuth.instance
          .currentUser()
          .then((currentUser) => {
        if (currentUser == null)
          {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) =>
                    new SwipeScreen())),
          }
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
                        builder: (context) => Timetable(
                          uid: currentUser.uid,
                        ))))
                .catchError((err) => print(err))
          }
      })
          .catchError((err) => print(err));
      super.initState();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          child: Image.asset(
            'images/logo.png',
          ),
        ),
      ),
    );
  }
}
