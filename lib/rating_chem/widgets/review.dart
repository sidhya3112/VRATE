import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/reviewmodel.dart';

var now = DateTime.now();
var month = now.month.toString().padLeft(2, '0');
var day = now.day.toString().padLeft(2, '0');
var text = '$day-$month-${now.year}';

class ReviewWidget extends StatelessWidget {
  final ReviewModel reviewItem;

  const ReviewWidget({Key key, @required this.reviewItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0, bottom: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  reviewItem.comment,
                  style: GoogleFonts.average(textStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600)),
                ),
              ),
              Row(
                children: List(reviewItem.stars).map((listItem) {
                  return Icon(Icons.star,
                  color: Colors.amber,);
                }).toList(),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 280.0),
          child: Text(text,
          style: TextStyle(color: Colors.grey,
          fontSize: 12),),
        ),
        Divider(
          color: Colors.grey,
        )
      ],
    );
  }
}