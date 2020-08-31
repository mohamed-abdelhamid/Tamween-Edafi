import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tamween_edafi/components/top-bars/app-bar.dart';
import 'package:tamween_edafi/components/custom-button.dart';
import 'package:tamween_edafi/components/text-input.dart';
import 'package:tamween_edafi/controllers/size_config.dart';

import '../../constants.dart';


class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {

  @override
  Widget build(BuildContext context) {

    //get screen size (w & h)
    SizeConfig().init(context);
    double hBlock = SizeConfig.blockSizeHorizontal;
    double vBlock = SizeConfig.blockSizeVertical;


    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFF6F6F6),
          border: Border(
            bottom: BorderSide(color: Color(0xFFEDEDED), width: 4),
          ),
        ),
        child: ListView(
          children: <Widget>[
            CustomAppBar(
              // from component app-bar
              vBlock: vBlock,
              hBlock: hBlock,
              title: 'اعادة التعيين',
              height: 12*vBlock,
            ),
            Padding(
              padding: EdgeInsets.only(top: 4*vBlock),
              child: Image.asset(
                'assets/user.jpg',
                alignment: Alignment.center,
                height: 20*vBlock,
              ),
            ),
            Center(
              child: Text(
                'اعادة تعيين الرقم السري',
                style: kTextStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12*hBlock,vertical: 2*vBlock),
              child: UserTextInput(
                fieldName: 'البريد الالكتروني',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12*hBlock,vertical: vBlock),
              child: CustomButton(
                text: 'تأكيد',
                buttonColor: Color(0xFF61B356),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/confirm');
                },
                width: 72 * hBlock,
              ),
            ),

          ],
        ),
      ),
    );
  }

}