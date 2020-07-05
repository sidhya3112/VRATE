import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dayselection.dart';
import 'package:vrate/card/card_monday.dart';
import 'package:google_fonts/google_fonts.dart';

class Timetable extends StatefulWidget {
  @override
  _TimetableState createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  CalendarController _controller;
  @override
  void initState(){
    super.initState();
    _controller = CalendarController();
  }

  static const TextStyle White20Style = TextStyle(
      fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container( height: 25.0, color: Colors.blue[900],),
            Container(

              color: Colors.blue[900],
              padding: EdgeInsets.only(left: 20.0, right:20.0, top:30.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("VRATE",
                    style: GoogleFonts.alice(textStyle: White20Style),),
                  SizedBox(height: 10,),
                  topRow(),

                  Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      new TableCalendar(

                        calendarController: _controller,
                        initialCalendarFormat: CalendarFormat.week,
                        calendarStyle: CalendarStyle(
                             weekdayStyle: TextStyle(
                               color: Colors.white,
                             ),
                             renderDaysOfWeek: false,

                            todayColor: Colors.orangeAccent,
                            selectedColor: Theme.of(context).primaryColor,
                            todayStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.white,
                            )
                        ),
                      ),
                      new Positioned(
                        top: 55.0,
                        child: DaySelection()
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(8,
                    (index) => Monday(
                  index: index,
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}

// ignore: camel_case_types
class topRow extends StatelessWidget {
  const topRow({
    Key key,
  }): super(key : key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text("Time",
              style: GoogleFonts.average(textStyle:  TextStyle(
                fontSize: 26.0,
                color:Colors.white ,
                fontWeight: FontWeight.bold,
              ),)
            ),

            SizedBox(width: 2.0),

            Text("Table",
              style: GoogleFonts.average(textStyle: TextStyle(
                fontSize: 26.0,
                color: Colors.blue[400],
                fontWeight: FontWeight.bold,
              ),)
            )
          ],
        ),
        Spacer(),
        Text("BATCH 3",
          style: GoogleFonts.average(textStyle: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),)
        )

      ],
    );
  }
}

// ignore: camel_case_types
class lineGen extends StatelessWidget {
  final List lines;
  const lineGen({
    Key key,
    this.lines,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(4, (index) => Container(
        height: 2.0,
        width: lines[index],
        color: Color(0xffd0d2d8),
        margin: EdgeInsets.symmetric(vertical: 14.0),
      )),
    );
  }
}



// ignore: camel_case_types
class dateWidget extends StatefulWidget {
  final index;

  const dateWidget({Key key, this.index}) : super(key: key);
  @override
  _dateWidgetState createState() => _dateWidgetState();
}

// ignore: camel_case_types
class _dateWidgetState extends State<dateWidget> {
  bool _selectDate = true;
  var list =["Mon","Tue","Wed","Thur","Fri","Sat","Sun"];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          _selectDate = !_selectDate;
        });
      },
      child: Container(
        decoration:_selectDate?null:
        BoxDecoration(
            color: _selectDate? Colors.white : Colors.redAccent,
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            )
        ),
        child: Column(
          children: <Widget>[
            Text(
              list[widget.index],
              style: TextStyle(
                fontWeight: _selectDate? FontWeight.normal : FontWeight.bold,
                color:_selectDate? Colors.blue[400] : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

