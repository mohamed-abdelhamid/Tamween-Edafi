import 'package:flutter/material.dart';
import 'package:tamween_edafi/constants.dart';

class ProductCard extends StatelessWidget {
  final Function onPress;
  final double hBlock, vBlock, productPrice;
  final bool isSelected;
  final String productName, assetName;

  ProductCard(
      {
      @required this.onPress,
      @required this.hBlock,
      @required this.vBlock,
      @required this.isSelected,
      @required this.productName,
      @required this.assetName,
      @required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40*hBlock,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.fromBorderSide(
            BorderSide(color: isSelected ? Colors.green : Colors.white, width: 2.0),
          ),
        boxShadow: [
          BoxShadow(
              color: Colors.black12.withOpacity(0.1),
              blurRadius: 10,
          )
        ],
      ),
      margin: EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'assets/$assetName',
                    width: 30*hBlock,
                    height: 25*vBlock,
                  ),
                ),
              ],
            ),
            Container(color: Colors.grey,height: 1,width: double.infinity,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  '$productPrice LE',
                  style: kDropStyle.copyWith(color: Colors.green,fontWeight: FontWeight.w700),
                ),
                Text(
                  productName,
                  style: kTextStyle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
