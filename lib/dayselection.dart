import 'package:flutter/material.dart';
import 'package:vrate/card/card_monday.dart';
import 'package:vrate/card/card_tuesday.dart';
import 'package:vrate/card/card_wednesday.dart';
import 'package:vrate/card/card_thursday.dart';
import 'package:vrate/card/card_friday.dart';
import 'package:vrate/card/card_saturday.dart';

class DaySelection extends StatefulWidget {
  final index;

  const DaySelection({Key key, this.index}) : super(key: key);


@override
_DaySelectionState createState() => _DaySelectionState();
}

class _DaySelectionState extends State<DaySelection> {
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
                        new cardSat()));
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
                        new cardMon()));
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
                        new cardTues()));
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
                        new cardWed()));
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
                        new cardThurs()));
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
                        new cardFri()));
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
                        new cardSat()));
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

