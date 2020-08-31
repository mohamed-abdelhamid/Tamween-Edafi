import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:tamween_edafi/constants.dart';

class ProfileBar extends StatelessWidget {
  final String title;
  final double vBlock, hBlock;
  final String name, points, id;

  ProfileBar({
    Key key,
    @required this.title,
    @required this.vBlock,
    @required this.hBlock,
    @required this.name,
    @required this.points,
    @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50 * vBlock,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF61B356),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20.0),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: 2*vBlock,
            ),
            Text(
              this.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 5 * hBlock,
                  fontFamily: ArabicFonts.Cairo,
                  package: 'google_fonts_arabic',
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2*vBlock, bottom: vBlock),
              child: Image.asset('assets/profile-white.png'),
            ),
            Text(
              name,
              style: kTextStyle.copyWith(
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'نقطة  ',
                  style: kTextStyle.copyWith(color: Colors.white),
                ),
                Text(
                  points,
                  style: kTextStyle.copyWith(
                      color: Colors.white,
                      fontSize: 6.5 * hBlock,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Container(
              height: 8 * vBlock,
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                  horizontal: 5 * hBlock, vertical: vBlock),
              decoration: BoxDecoration(
                color: Color(0xFF81C278),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                  bottom: Radius.circular(20),
                ),
              ),
              child: Text(
                id,
                textAlign: TextAlign.center,
                style: kTextStyle.copyWith(
                    color: Color(0xFF528540),
                    fontSize: 6.5 * hBlock,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
