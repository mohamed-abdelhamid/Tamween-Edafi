import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:tamween_edafi/controllers/size_config.dart';
import 'package:tamween_edafi/constants.dart';
import 'package:tamween_edafi/components/custom-button.dart';
import 'package:tamween_edafi/screens/place-order-screens/order-data.dart';
import 'package:tamween_edafi/screens/place-order-screens/order-location.dart';
import 'package:tamween_edafi/screens/place-order-screens/order-sent.dart';


class SlidingPanel extends StatelessWidget {

  final bool isCalculator;
  final Function goToOrderLocation ;

  SlidingPanel({
    @required this.isCalculator, this.goToOrderLocation
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig();
    double vBlock = SizeConfig.blockSizeVertical,
           hBlock = SizeConfig.blockSizeHorizontal;
    return Container(
      height: 29 * vBlock + 5,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFA3A3A3),
        boxShadow: [
          BoxShadow(
              color: const Color(0x12000000),
              offset: Offset(0, -4),
              blurRadius: 14,
              spreadRadius: 3)
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xFFF8F8F8), width: 1),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
            ),
            height: 7 * vBlock,
            child: Center(
              child: Text(
                'مجموع نقاط هذه المخلقات',
                style: kTextStyle.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Color(0xff707070),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xFFF8F8F8), width: 2),
              boxShadow: [
                BoxShadow(
                    color: const Color(0x0d000000),
                    offset: Offset(0, -2),
                    blurRadius: 1,
                    spreadRadius: 0)
              ],
            ),
            height: 8 * vBlock,
            child: Center(
              child: Text(
                '25646',
                style: kTextStyle.copyWith(
                    color: Color(0xff528540),
                    fontSize: 8 * hBlock,
                    height: .2 * vBlock,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFf8f8f8),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0),
              ),
            ),
            height: 14 * vBlock,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  isCalculator ?
                      CustomButton(
                        onPressed: goToOrderLocation,
                        text: 'ارسل طلب',
                        buttonColor: Color(0xFF61B356),
                        textColor: Colors.white,
                        width: 40 * hBlock,
                      )
                   : CustomButton(
                    onPressed: () {
                      pushNewScreen(context, screen: OrderSent(),);
                    },
                    text: 'تأكيد الطلب',
                    buttonColor: Color(0xFF61B356),
                    textColor: Colors.white,
                    width: 40 * hBlock,
                  ),
                  SizedBox(
                    width: 4 * hBlock,
                  ),
                  isCalculator ?
                  CustomButton(
                    onPressed: () {
                      Navigator.maybePop(context);
                    },
                    text: 'احسب مره أخرى',
                    buttonColor: Color(0xFF61B356),
                    textColor: Colors.white,
                    width: 40 * hBlock,
                  ) :CustomButton(
                    onPressed: goToOrderLocation,
                    text: 'الغاء',
                    buttonColor: Color(0xFFF6F6F6),
                    textColor: Colors.green,
                    width: 40 * hBlock,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
