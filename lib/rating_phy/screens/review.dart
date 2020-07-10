import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vrate/main_timetable.dart';
import '../models/reviewmodel.dart';
import '../models/reviews_phy.dart';
import '../widgets/review.dart';
import '../widgets/info_card.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewPhy extends StatefulWidget {
  @override
  ReviewPhyState createState() {
    return new ReviewPhyState();
  }
}

class ReviewPhyState extends State<ReviewPhy> {
  final Reviews _reviewsStore = Reviews();
  final TextEditingController _commentController = TextEditingController();
  final List<int> _stars = [1, 2, 3, 4, 5];
  int _selectedStar;
  @override
  void initState() {
    _selectedStar = null;
    _reviewsStore.initReviews();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback - Physics',
        style: GoogleFonts.alice(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),),
        backgroundColor: Colors.indigo[900],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 5.0, left: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: screenWidth * 0.6,
                    child: TextFormField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Write a Feedback",
                        labelText: "Write a Feedback",
                      ),
                    ),
                  ),
                  Container(
                    child: DropdownButton(
                      hint: Text("Stars"),
                      elevation: 0,
                      value: _selectedStar,
                      items: _stars.map((star) {
                        return DropdownMenuItem<int>(
                          child: Text(star.toString()),
                          value: star,
                        );
                      }).toList(),
                      onChanged: (item) {
                        setState(() {
                          _selectedStar = item;
                        });
                      },
                    ),
                  ),
                  Container(
                    child: Builder(
                      builder: (BuildContext context) {
                        return IconButton(
                          icon: Icon(Icons.done),
                          onPressed: () {
                            if (_selectedStar == null) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content:
                                    Text("You can't add a review without star"),
                                duration: Duration(milliseconds: 500),
                              ));
                            } else if (_commentController.text.isEmpty) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text("Review comment cannot be empty"),
                                duration: Duration(milliseconds: 500),
                              ));
                            } else {
                              _reviewsStore.addReview(ReviewModel(
                                  comment: _commentController.text,
                                  stars: _selectedStar));
                              showDialog(
                                  context: context,
                                  child: AlertDialog(
                                    title: Text(
                                      "Thank You!",
                                      style: GoogleFonts.alice(),
                                    ),
                                    content: Row(
                                      children: <Widget>[
                                        Text(" The average rating is ", style: GoogleFonts.average(),),
                                        Text(_reviewsStore.averageStars
                                            .toStringAsFixed(2)),
                                      ],
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text(
                                          'OK',
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      new Timetable()));
                                        },
                                      ),
                                    ],
                                  ));
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
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
                        infoValue: _reviewsStore.averageStars.toStringAsFixed(2),
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
                      style: GoogleFonts.alike(textStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
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
                style: GoogleFonts.average(textStyle:TextStyle(color: Colors.red,
                    fontWeight: FontWeight.bold), )
              ),
              SizedBox(height: 10.0,),
              Expanded(
                child: Container(
                  child: Observer(
                    builder: (_) => _reviewsStore.reviews.isNotEmpty
                        ? ListView(
                            children:
                                _reviewsStore.reviews.reversed.map((reviewItem) {
                              return ReviewWidget(
                                reviewItem: reviewItem,
                              );
                            }).toList(),
                          )
                        : Text("No feedbacks yet",
                      style: GoogleFonts.average(textStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600)),),
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
