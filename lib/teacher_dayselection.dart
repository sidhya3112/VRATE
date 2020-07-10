import 'package:flutter/material.dart';
import 'package:vrate/teacher_card_phy/teachercard_friday.dart';
import 'package:vrate/teacher_card_phy/teachercard_monday.dart';
import 'package:vrate/teacher_card_phy/teachercard_saturday.dart';
import 'package:vrate/teacher_card_phy/teachercard_thursday.dart';
import 'package:vrate/teacher_card_phy/teachercard_tuesday.dart';
import 'package:vrate/teacher_card_phy/teachercard_wednesday.dart';

class TeacherDaySelection extends StatefulWidget {
  final index;

  const TeacherDaySelection({Key key, this.index}) : super(key: key);


  @override
  _TeacherDaySelectionState createState() => _TeacherDaySelectionState();
}

class _TeacherDaySelectionState extends State<TeacherDaySelection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 15.0),
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                        new TeachercardSat()));
              },
              child: Text("Sun",
                style: TextStyle(
                  fontSize: 15.0,
                  color:Colors.white ,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 16.0),


            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                        new TeachercardMon()));
              },
              child: Text("Mon",
                style: TextStyle(
                  fontSize: 15.0,
                  color:Colors.white ,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 16.0),


            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                        new TeachercardTues()));
              },
              child: Text("Tue",
                style: TextStyle(
                  fontSize: 15.0,
                  color:Colors.white ,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(width: 16.0),


            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                        new TeachercardWed()));
              },
              child: Text("Wed",
                style: TextStyle(
                  fontSize: 15.0,
                  color:Colors.white ,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 16.0),


            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                        new TeachercardThurs()));
              },
              child: Text("Thu",
                style: TextStyle(
                  fontSize: 15.0,
                  color:Colors.white ,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 18.0),

            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                        new TeachercardFri()));
              },
              child: Text("Fri",
                style: TextStyle(
                  fontSize: 15.0,
                  color:Colors.white ,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width:23.0),


            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) =>
                        new TeachercardSat()));
              },
              child: Text("Sat",
                style: TextStyle(
                  fontSize: 15.0,
                  color:Colors.white ,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(width: 8.0),

          ],
        ),
      ],
    );
  }
}

