import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.widget.dart';
import 'package:tamween_edafi/components/top-bars/app-bar.dart';
import 'package:tamween_edafi/components/custom-button.dart';
import 'package:tamween_edafi/components/navigation-bar/navigation.dart';
import 'package:tamween_edafi/controllers/size_config.dart';
import 'package:tamween_edafi/components/text-input.dart';

import '../../constants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {


    //get screen size (w & h)
    SizeConfig().init(context);
    double hBlock = SizeConfig.blockSizeHorizontal;
    double vBlock = SizeConfig.blockSizeVertical;


    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
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
              title: 'تسجيل الدخول',
              height: 12*vBlock,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5*vBlock,bottom: 2*vBlock),
              child: Image.asset(
                'assets/tamweenedafi.jpg',
                alignment: Alignment.center,
                height: 20*vBlock,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12*hBlock,vertical: vBlock),
              child: UserTextInput(
                fieldName: 'رقم المستخدم/البريد الالكتروني',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12*hBlock,vertical: vBlock),
              child: UserTextInput(
                fieldName: 'الرقم السري',
                isPassword: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/forget');
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 18*hBlock,bottom: vBlock),
                    child: Text(
                      'هل نسيت الرقم السري ؟',
                      style: kDropStyle.copyWith(fontSize: 3.5*hBlock,),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12*hBlock,vertical: vBlock),
              child: CustomButton(
                text: 'تسجيل الدخول',
                buttonColor: Color(0xFF61B356),
                textColor: Colors.white,
                onPressed: () {
                  pushNewScreen(context, screen: MyHomePage());
                },
                width: 72 * hBlock,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text(
                    'التسجيل',
                    style: kDropStyle.copyWith(color: Color(0xFF61B356),fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
