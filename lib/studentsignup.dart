import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';


class StudentSignUp extends StatefulWidget {

  @override
  _StudentSignUpState createState() => _StudentSignUpState();
}

class _StudentSignUpState extends State<StudentSignUp> {
  static const TextStyle White16Style = TextStyle(
      fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold);

  static const TextStyle Black20Style = TextStyle(
      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);

  List<String> branch = [
    'CS',
    'IT',
    'EXTC',
    'Electronics',
    'Electrical',
    'Mechanical',
    'Civil',
    'Production',
    'Textile'
  ];
  String selectedBranch;

  List<String> batch = [
    'Batch 1',
    'Batch 2',
    'Batch 3',
    'Batch 4',
    'Batch 5',
    'Batch 6'
  ];
  String selectedBatch;


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
                            "Student SignUp",
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
                              'Branch',
                              style: TextStyle(
                                  color: Colors.black26, fontSize: 16.0),
                            ),
                            value: selectedBranch,
                            onChanged: (newValue) {
                              setState(() {
                                selectedBranch = newValue;
                              });
                            },
                            validator: (value) => value == null ? 'Please select branch' : null,
                            items: branch.map((subject) {
                              return DropdownMenuItem(
                                child: new Text(subject),
                                value: subject,
                              );
                            }).toList(),
                          ),
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.people,
                                  size: 22.0, color: Colors.black26),
                            ),
                            hint: Text(
                              'Batch',
                              style: TextStyle(
                                  color: Colors.black26, fontSize: 16.0),
                            ),
                            value: selectedBatch,
                            onChanged: (newValue) {
                              setState(() {
                                selectedBatch = newValue;
                              });
                            },
                            validator: (value) => value == null ? 'Please select batch' : null,
                            items: batch.map((subject) {
                              return DropdownMenuItem(
                                child: new Text(subject),
                                value: subject,
                              );
                            }).toList(),
                          ),
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
