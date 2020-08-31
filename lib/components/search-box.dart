import 'package:flutter/material.dart';
import 'package:tamween_edafi/controllers/size_config.dart';
import 'package:tamween_edafi/constants.dart';

class SearchBox extends StatelessWidget {

  final String fieldName ;
  final Icon aheadIcon ;

  SearchBox({
    @required this.fieldName, @required this.aheadIcon
  });

  @override
  Widget build(BuildContext context) {
    double vBlock, hBlock;
    SizeConfig();
    vBlock = SizeConfig.blockSizeVertical ;
    hBlock = SizeConfig.blockSizeHorizontal ;

    return Container(
      height: 6*vBlock,
      width: 90*hBlock,
      child: TextField(
        style: kTextStyle.copyWith(color: Colors.white),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hoverColor: Colors.blue,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFF528540), width: 0.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(width: 2.0,color: Colors.lightBlue),
          ),
          prefixIcon: this.aheadIcon,
          hintText: this.fieldName,
          hintStyle: kTextStyle.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            height: 1.2,
          ),
          fillColor: Color(0xFF528540),
          filled: true,
        ),
      ),
    );
  }
}