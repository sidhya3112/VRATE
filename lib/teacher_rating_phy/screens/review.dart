import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../models/reviews_phy.dart';
import '../widgets/review.dart';
import '../widgets/info_card.dart';
import 'package:google_fonts/google_fonts.dart';

class TeacherReviewPhy extends StatefulWidget {
  @override
  TeacherReviewPhyState createState() {
    return new TeacherReviewPhyState();
  }
}

class TeacherReviewPhyState extends State<TeacherReviewPhy> {
  final Reviews _reviewsStore = Reviews();
  @override
  void initState() {
    _reviewsStore.initReviews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedback - Physics',
          style: GoogleFonts.alice(
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        backgroundColor: Colors.indigo[900],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 12.0),
              //contains average stars and total reviews card
              Observer(
                builder: (_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InfoCard(
                          infoValue: _reviewsStore.numberOfReviews.toString(),
                          infoLabel: "Feedbacks",
                          cardColor: Colors.green,
                          iconData: Icons.comment),
                      InfoCard(
                        infoValue:
                            _reviewsStore.averageStars.toStringAsFixed(2),
                        infoLabel: "Average stars",
                        cardColor: Colors.lightBlue,
                        iconData: Icons.star,
                        key: Key('avgStar'),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 24.0),
              //the review menu label
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.comment),
                    SizedBox(width: 10.0),
                    Text(
                      "Feedbacks",
                      style: GoogleFonts.alike(
                          textStyle: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
              //contains list of reviews
              SizedBox(
                height: 10,
              ),
              Text(
                  "If you are giving a low rating, please give a valid reason to\n support it.",
                  style: GoogleFonts.average(
                    textStyle: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Container(
                  child: Observer(
                    builder: (_) => _reviewsStore.reviews.isNotEmpty
                        ? ListView(
                            children: _reviewsStore.reviews.reversed
                                .map((reviewItem) {
                              return ReviewWidget(
                                reviewItem: reviewItem,
                              );
                            }).toList(),
                          )
                        : Text(
                            "No feedbacks yet",
                            style: GoogleFonts.average(
                                textStyle: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600)),
                          ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
