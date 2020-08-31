import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:tamween_edafi/controllers/size_config.dart';

class CustomButton extends StatelessWidget {

  final Color buttonColor , textColor ;
  final String text ;
  final Function onPressed ;
  final double width ;

  const CustomButton({
    Key key, @required this.buttonColor, @required this.text,
    @required this.onPressed, @required this.textColor, this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double hBlock , vBlock;
    SizeConfig();
    hBlock = SizeConfig.blockSizeHorizontal;
    vBlock = SizeConfig.blockSizeVertical;
    return Container(
      height: 6.5*vBlock,
      width: width == null ? 32*hBlock : width,
      child: FlatButton(
        onPressed:onPressed,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0),
            side: BorderSide(width: 0 , color: Colors.green),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontSize: 4.5*hBlock,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
            fontWeight: FontWeight.w700
        ),

      ),
        color: buttonColor,
      ),
    );
  }
}
