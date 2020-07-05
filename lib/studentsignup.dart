import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vrate/main_timetable.dart';


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
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Timetable()));
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
