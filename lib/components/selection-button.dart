import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamween_edafi/constants.dart';
import 'package:tamween_edafi/controllers/size_config.dart';

class SelectionButton extends StatelessWidget {
  final Function select;
  final String buttonText;
  final double borderWidth;
  final bool isSelected;
  final Color borderColor;

  SelectionButton({
    @required this.select,
    @required this.buttonText,
    @required this.isSelected,
    @required this.borderColor,
    @required this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig();
    double hBlock = SizeConfig.blockSizeHorizontal,
        vBlock = SizeConfig.blockSizeVertical;
    return GestureDetector(
      onTap: select,
      child: Container(
        width: 72 * hBlock,
        height: 6.5 * vBlock,
        decoration: BoxDecoration(
          color: Color(0xFFD5E7D3),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: borderWidth, color: borderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: isSelected,
                child: Image.asset(
                  'assets/selection.png',
                  width: 5.5 * hBlock,
                  height: 5.5 * vBlock,
                ),
              ),
            ),
            Text(
              buttonText,
              textAlign: TextAlign.center,
              style: kTextStyle.copyWith(color: Color(0xff416336),),
            ),
            SizedBox(width: 10*hBlock,)
          ],
        ),
      ),
    );
  }
}
