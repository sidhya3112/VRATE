import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCard extends StatelessWidget {
  final String infoValue;
  final String infoLabel;
  final Color cardColor;
  final IconData iconData;
  const InfoCard(
      {Key key,
        @required this.infoValue,
        @required this.infoLabel,
        @required this.cardColor,
        @required this.iconData,
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    return Container(
      height: 100,
      width: 175,
      child: Card(
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              iconData,
              size: 28.0,
              color: Colors.white,
            ),
            Text(
              "$infoValue $infoLabel",
              style: GoogleFonts.alike(textStyle: TextStyle(color: Colors.white, fontSize: 15.0), ),
            ),
          ],
        ),
      ),
    );
  }
}