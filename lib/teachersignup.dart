import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';


class TeacherSignUp extends StatefulWidget {

  @override
  _TeacherSignUpState createState() => _TeacherSignUpState();
}

class _TeacherSignUpState extends State<TeacherSignUp> {
  static const TextStyle White16Style = TextStyle(
      fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold);

  static const TextStyle Black20Style = TextStyle(
      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);

  List<String> subject = [
    'English',
    'Maths',
    'Physics',
    'Chemistry',
    'EM',
    'EG',
    'EME',
    'BEE',
    'CPP'
  ];
  String selectedSubject;

  List batch;
  String batchSelected;
  @override
  void initState() {
    super.initState();
    batch = [];
    batchSelected = '';
  }

  saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        batchSelected = batch.toString();
      });
    }
  }


  final formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("Users");
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void registerToFb() {
    firebaseAuth
        .createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text)
        .then((result) {
      dbRef.child(result.user.uid).set({
        "email": emailController.text,
        "name": nameController.text
      }).then((res) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomePage()),
        );
      });
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }

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
                padding: EdgeInsets.only(top: 40.0, left: 80),
                child: Image.asset(
                  "images/signup.jpg",
                ),
              ),
            ],
          ),
          SingleChildScrollView(
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
                  SizedBox(height: 95),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Teacher SignUp",
                            style: GoogleFonts.alice(textStyle: Black20Style),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                size: 22.0,
                                color: Colors.black26,
                              ),
                              hintText: "Name",
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 16.0),
                            ),
                            controller: nameController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter name';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_pin,
                                size: 22.0,
                                color: Colors.black26,
                              ),
                              hintText: "Email ID",
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 16.0),
                            ),
                            controller: emailController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter email id';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                size: 22.0,
                                color: Colors.black26,
                              ),
                              hintText: "Phone No.",
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 16.0),
                            ),
                            keyboardType: TextInputType.number,
                            controller: phoneController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter phone no.';
                              }
                              return null;
                            },
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
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 16.0),
                            ),
                            controller: passwordController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                          ),
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.book,
                                  size: 22.0, color: Colors.black26),
                            ),
                            hint: Text(
                              'Subjects Teaching',
                              style: TextStyle(
                                  color: Colors.black26, fontSize: 16.0),
                            ),
                            value: selectedSubject,
                            onChanged: (newValue) {
                              setState(() {
                                selectedSubject = newValue;
                              });
                            },
                            validator: (value) => value == null ? 'Please select subject' : null,
                            items: subject.map((subject) {
                              return DropdownMenuItem(
                                child: new Text(subject),
                                value: subject,
                              );
                            }).toList(),
                          ),
                          MultiSelectFormField(
                            fillColor: Colors.white,
                            autovalidate: false,
                            titleText: 'Batches Teaching',
                            validator: (value) => value.length == 0
                                ? 'Please select one or more options'
                                : null,
                            dataSource: [
                              {
                                "display": "Batch 1",
                                "value": "Climbing",
                              },
                              {
                                "display": "Batch 2",
                                "value": "Walking",
                              },
                              {
                                "display": "Batch 3",
                                "value": "Swimming",
                              },
                              {
                                "display": "Batch 4",
                                "value": "Soccer Practice",
                              },
                              {
                                "display": "Batch 5",
                                "value": "Baseball Practice",
                              },
                              {
                                "display": "Batch 6",
                                "value": "Football Practice",
                              },
                            ],
                            textField: 'display',
                            valueField: 'value',
                            okButtonLabel: 'OK',
                            cancelButtonLabel: 'CANCEL',
                            // required: true,
                            initialValue: batch,
                            onSaved: (value) {
                              if (value == null) return;
                              setState(() {
                                batch = value;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 18.0),
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
                            if (formKey.currentState.validate()) {
                              registerToFb();
                            }
                          },
                          child: Center(
                            child: Text(
                              "SIGNUP",
                              style:
                                  GoogleFonts.average(textStyle: White16Style),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
