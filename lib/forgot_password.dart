import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email = "";

  static const TextStyle White20Style = TextStyle(
      fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold);

  static const TextStyle White16Style = TextStyle(
      fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold);

  static const TextStyle Black17Style = TextStyle(
      fontSize: 17.0, color: Colors.black, fontWeight: FontWeight.bold);

  static const TextStyle Black5415Style = TextStyle(
      fontSize: 15.0, color: Colors.black54, fontWeight: FontWeight.bold);

  static const TextStyle Blue15Style = TextStyle(
      fontSize: 15.0, color: Colors.blue, fontWeight: FontWeight.bold);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Password?",
          style: GoogleFonts.alice(textStyle: White20Style),
        ),
        backgroundColor: Colors.indigo[900],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.error_outline,
                          size: 18.0,
                          color: Colors.red,
                        ),
                      ),
                      TextSpan(
                        text:
                            ' We will mail you a link. Please click on that link to reset your password.',
                        style: GoogleFonts.average(textStyle: Black17Style),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  height: 190,
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
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  size: 22.0,
                                  color: Colors.black26,
                                ),
                                labelText: "Email",
                                labelStyle: TextStyle(
                                    color: Colors.black26, fontSize: 15.0),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please enter your email id";
                                } else {
                                  email = value;
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 130.0,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF17ead9),
                                      Color(0xFF6078ea)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(6.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color(0xFF6078ea).withOpacity(.3),
                                        offset: Offset(0.0, 8.0),
                                        blurRadius: 8.0),
                                  ],
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      if (formKey.currentState.validate()) {
                                        FirebaseAuth.instance
                                            .sendPasswordResetEmail(
                                                email: email)
                                            .then((value) =>
                                                print("Check your mail."));
                                        showDialog(
                                          context: context,
                                          child: AlertDialog(
                                            title: Text(
                                              "Password Reset",
                                              style: GoogleFonts.alice(
                                                  textStyle: Black17Style),
                                            ),
                                            content: Text(
                                              "Check your mail. We have sent a link.",
                                              style: GoogleFonts.average(
                                                  textStyle: Black5415Style),
                                            ),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text(
                                                  'OK',
                                                  style: GoogleFonts.average(
                                                      textStyle: Blue15Style),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        "SEND EMAIL",
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
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
