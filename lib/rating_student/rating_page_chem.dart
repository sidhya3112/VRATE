import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'feedback_page_chem.dart';

class RatingPageChem extends StatefulWidget {
  @override
  _RatingPageChemState createState() => _RatingPageChemState();
}

class _RatingPageChemState extends State<RatingPageChem> {
  static const TextStyle White40Style = TextStyle(
      fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.bold);

  static const TextStyle White20Style = TextStyle(
      fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold);

  static const TextStyle Black20Style = TextStyle(
      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);

  static const TextStyle Black25Style = TextStyle(
      fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.bold);

  static const TextStyle Red25Style =
  TextStyle(fontSize: 25.0, color: Colors.red, fontWeight: FontWeight.bold);

  static const TextStyle Black18Style = TextStyle(
      fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold);

  static const TextStyle Black3815_5Style = TextStyle(
      fontSize: 15.5, color: Colors.black38, fontWeight: FontWeight.w600);

  var rating = 0.0;

  @override
  Widget build(BuildContext context) {
    _feedbackButtonPressed() {
      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FeedbackPageChem()));
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.lightBlue[300], Colors.indigo[900]])),
              child: Container(
                width: double.infinity,
                height: 395,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 240.0, top: 50.0),
                      child: Text(
                        'VRATE',
                        style: GoogleFonts.alice(textStyle: Black20Style),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("images/chem.png"),
                      radius: 30,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'CHEMISTRY',
                      style: GoogleFonts.alice(textStyle: White40Style),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Card(
                      margin:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 8.0,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text('How useful was this lecture?',
                                    style: GoogleFonts.alike(
                                        textStyle: Black18Style)),
                                SizedBox(
                                  height: 10.0,
                                ),
                                SmoothStarRating(
                                  rating: rating,
                                  isReadOnly: false,
                                  size: 50,
                                  borderColor: Colors.amberAccent[400],
                                  color: Colors.amberAccent[400],
                                  filledIconData: Icons.star,
                                  halfFilledIconData: Icons.star_half,
                                  defaultIconData: Icons.star_border,
                                  starCount: 5,
                                  allowHalfRating: false,
                                  spacing: 2.0,
                                  onRated: (rating) {
                                    print("rating value -> $rating");
                                    var values = [
                                      {'userId': 1, 'rating': 4.5},
                                      {'userId': 2, 'rating': 4.0},
                                      {'userId': 3, 'rating': 3.5},
                                      {'userId': 4, 'rating': 3.0}
                                    ];

                                    var result = values.map((m) => m['rating']).reduce((a, b) => a + b) / values.length;
                                    print(result);
                                    // print("rating value dd -> ${value.truncate()}");
                                  },
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.error_outline,
                            size: 16.0,
                            color: Colors.red,
                          ),
                        ),
                        TextSpan(
                          text:
                          " If the rating is below 3, support it with a valid reason or else the rating will be considered invalid.",
                          style: GoogleFonts.averageSans(
                              textStyle: Black3815_5Style),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Give Your Feedback",
                          style: GoogleFonts.alike(textStyle: Black25Style),
                        ),
                        TextSpan(
                          text: " *",
                          style: GoogleFonts.alike(textStyle: Red25Style),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    child: RawMaterialButton(
                      onPressed: _feedbackButtonPressed,
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.black, width: 1.0),
                          color: Colors.transparent,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 13.5, bottom: 14.5, left: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Write a feedback here.",
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 17.0),
                              ),
                              SizedBox(
                                width: 105,
                              ),
                              Icon(
                                Icons.send,
                                color: Colors.black45,
                                size: 27.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            FlatButton(
              child: Container(
                width: 130,
                height: 44,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF17ead9), Color(0xFF6078ea)],
                  ),
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFF6078ea).withOpacity(0.2),
                        offset: Offset(0.0, 8.0),
                        blurRadius: 8.0),
                  ],
                ),
                child: Center(
                  child: Text(
                    'SUBMIT',
                    style: GoogleFonts.alike(textStyle: White20Style),
                  ),
                ),
              ),
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}
