import 'package:flutter/material.dart';
import 'package:vrate/welcome.dart';
import 'swipe_screen.dart';
import 'dart:async';
import 'package:splashscreen/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => FirebaseAuth.instance.currentUser().then(
        (res) {
          print(res);
          if (res != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => WelcomePage()),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SwipeScreen()),
            );
          }
        },
      ),
    );
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
