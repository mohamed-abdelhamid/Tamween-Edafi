import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

class CustomAppBar extends StatelessWidget {

  final String title ;
  final double vBlock , hBlock ;
  final double height ;
  const CustomAppBar({
    Key key, @required this.title, @required this.vBlock , @required this.hBlock, @required this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF61B356),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.0),),
      ),
      child: Center(
        child: Text(
          this.title,
          textAlign: TextAlign.center,
          style: TextStyle(
              height: height==12*vBlock ? 0.0 : 1.2*hBlock,
              color: Colors.white,
              fontSize: 5*hBlock,
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
