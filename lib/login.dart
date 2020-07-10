import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vrate/forgot_password.dart';
import 'package:vrate/main_timetable.dart';
import 'package:vrate/studentsignup.dart';
import 'package:vrate/teachersignup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;

  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }
  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
    width: 16.0,
    height: 16.0,
    padding: EdgeInsets.all(2.0),
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 2.0, color: Colors.black54)),
    child: isSelected
        ? Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.black54),
    )
        : Container(),
  );

  static const TextStyle White16Style = TextStyle(
      fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold);

  static const TextStyle Black20Style = TextStyle(
      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);

  static const TextStyle Black5415Style = TextStyle(
      fontSize: 15.0, color: Colors.black54, fontWeight: FontWeight.bold);

  static const TextStyle Blue15Style = TextStyle(
      fontSize: 15.0, color: Colors.blue, fontWeight: FontWeight.bold);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Image.asset("images/login.jpg"),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Form(
              key: _loginFormKey,
              child: Padding(
                padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 240.0),
                      child: Text(
                        'VRATE',
                        style: GoogleFonts.alice(textStyle: Black20Style),
                      ),
                    ),
                    SizedBox(height: 180),
                    Container(
                      width: double.infinity,
                      height: 275,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, 15.0),
                              blurRadius: 15.0),
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, -10.0),
                              blurRadius: 10.0),
                        ],
                      ),
                      child: Padding(
                        padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Login',
                              style: GoogleFonts.alice(textStyle: Black20Style),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  size: 22.0,
                                  color: Colors.black26,
                                ),
                                hintText: "Email ID.",
                                labelText: "Email ID.",
                                hintStyle: TextStyle(
                                    color: Colors.black26, fontSize: 16.0),
                              ),
                              controller: emailInputController,
                              keyboardType: TextInputType.emailAddress,
                              validator: emailValidator,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 22.0,
                                  color: Colors.black26,
                                ),
                                hintText: "Password",
                                labelText: "Password",
                                hintStyle: TextStyle(
                                    color: Colors.black26, fontSize: 16.0),
                              ),
                              controller: pwdInputController,
                              validator: pwdValidator,
                            ),
                            SizedBox(height: 35.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                InkWell(
                                  child: Text(
                                    "Forgot Password?",
                                    style:
                                    GoogleFonts.average(textStyle: Blue15Style),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                            new ForgotPassword()));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(width: 12.0),
                            GestureDetector(
                              onTap: _radio,
                              child: radioButton(_isSelected),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              "Remember me",
                              style:
                              GoogleFonts.average(textStyle: Black5415Style),
                            )
                          ],
                        ),
                        InkWell(
                          child: Container(
                            width: 130.0,
                            height: 44.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF17ead9), Color(0xFF6078ea)],
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(.3),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  if (_loginFormKey.currentState.validate()) {
                                    FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                        email: emailInputController.text,
                                        password: pwdInputController.text)
                                        .then((currentUser) => Firestore.instance
                                        .collection("users")
                                        .document(currentUser.uid)
                                        .get()
                                        .then((DocumentSnapshot result) =>
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Timetable(
                                                    uid: currentUser.uid
                                                ))))
                                        .catchError((err) => print(err)))
                                        .catchError((err) => print(err));
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    "SIGNIN",
                                    style: GoogleFonts.average(
                                        textStyle: White16Style),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "New User?",
                          style: GoogleFonts.average(textStyle: Black5415Style),
                        ),
                        InkWell(
                          onTap: () {
                            showDialog<void>(
                              context: context,
                              barrierDismissible: false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Hello!',
                                    style: GoogleFonts.alice(
                                        textStyle: Black20Style),
                                  ),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text(
                                          'Want to create an account?',
                                          style: GoogleFonts.average(
                                              textStyle: Black5415Style),
                                        ),
                                        Text(
                                          "Select whether you are a 'Teacher' or a 'Student.",
                                          style: GoogleFonts.average(
                                              textStyle: Black5415Style),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text(
                                        'Teacher',
                                        style: GoogleFonts.average(
                                            textStyle: Blue15Style),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                new TeacherSignUp()));
                                      },
                                    ),
                                    FlatButton(
                                      child: Text(
                                        'Student',
                                        style: GoogleFonts.average(
                                            textStyle: Blue15Style),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: (context) =>
                                                new StudentSignUp()));
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Text(
                            "SignUp",
                            style: GoogleFonts.average(textStyle: Blue15Style),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}