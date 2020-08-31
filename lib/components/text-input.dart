import 'package:flutter/material.dart';
import 'package:tamween_edafi/controllers/size_config.dart';
import 'package:tamween_edafi/constants.dart';

class UserTextInput extends StatelessWidget {

  final String fieldName ;
  final Icon aheadIcon ;
  final bool isPassword;
  final TextInputType keyboardType;

  UserTextInput({
    @required this.fieldName,
    this.aheadIcon, this.keyboardType, this.isPassword
  });

  @override
  Widget build(BuildContext context) {
    double vBlock, hBlock;
    SizeConfig();
    vBlock = SizeConfig.blockSizeVertical ;
    hBlock = SizeConfig.blockSizeHorizontal ;

    return Container(
      height: 6.5*vBlock,
      width: 72*hBlock,
      child: TextField(
        maxLength: 30,
        maxLengthEnforced: true,
        obscureText: isPassword == null ? false : isPassword,
        style: kTextStyle,
        textAlign: TextAlign.center,
        keyboardType: this.keyboardType == null ? TextInputType.text : TextInputType.number,
        decoration: InputDecoration(
          hoverColor: Colors.green,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Color(0xFFE7F4E6), width: 0.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(width: 2.0,color: Colors.green),
          ),
          prefixIcon: this.aheadIcon == null ? null : this.aheadIcon,
          hintText: this.fieldName,
          hintStyle: kTextStyle.copyWith(
            height: 1.3,
            color: Color(0xff416336),
            fontWeight: FontWeight.w300,
          ),
          fillColor: Color(0xFFD5E7D3),
          filled: true,
          counterText: '',
        ),
      ),
    );
  }
}