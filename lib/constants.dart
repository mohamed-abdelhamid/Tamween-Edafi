import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'controllers/size_config.dart';

TextStyle kTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 4.5 * SizeConfig.blockSizeHorizontal ,
  fontFamily: ArabicFonts.Cairo,
  package: 'google_fonts_arabic',
  fontWeight: FontWeight.w600,

);

TextStyle kDropStyle = TextStyle(
    fontSize: 4.5 * SizeConfig.blockSizeHorizontal ,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
    fontWeight: FontWeight.w400
);
