import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

class CartBar extends StatelessWidget {

  final String title ;
  final double vBlock , hBlock ;
  final Widget field;

  CartBar({
    Key key, @required this.title, @required this.vBlock , @required this.hBlock, @required this.field,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18*vBlock,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF61B356),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.0),),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 4*hBlock,),
              Text(
                this.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 5*hBlock,
                    fontFamily: ArabicFonts.Cairo,
                    package: 'google_fonts_arabic',
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: vBlock,bottom: 3*vBlock),
            child: field,
          ),
        ],
      ),
    );
  }
}
