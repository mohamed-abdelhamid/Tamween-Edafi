import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:tamween_edafi/components/top-bars/app-bar.dart';
import 'package:tamween_edafi/components/custom-button.dart';
import 'package:tamween_edafi/components/navigation-bar/navigation.dart';
import 'package:tamween_edafi/components/text-input.dart';
import 'package:tamween_edafi/constants.dart';
import 'package:tamween_edafi/controllers/size_config.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {



  @override
  Widget build(BuildContext context) {

    /* this function changes the bg color of status bar */
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF61B356),
        statusBarIconBrightness: Brightness.values[1],
      ),
    );

    /* this function disables screen rotation */
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);


    //get screen size (w & h)
    SizeConfig().init(context);
    double hBlock = SizeConfig.blockSizeHorizontal;
    double vBlock = SizeConfig.blockSizeVertical;
    bool showSpinner = false ;


    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        color: Colors.green,
        child: Container(
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
                 title: 'التسجيل',
                 height: 12*vBlock,
               ),
               Padding(
                 padding: EdgeInsets.only(top: vBlock),
                 child: Image.asset(
                   'assets/user.jpg',
                   alignment: Alignment.center,
                   height: 20*vBlock,
                 ),
               ),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 12*hBlock,vertical: vBlock),
                 child: UserTextInput(
                   fieldName: 'الاسم',
                 ),
               ),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 12*hBlock,vertical: vBlock),
                 child: UserTextInput(
                   fieldName: 'البريد الالكتروني',
                 ),
               ),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 12*hBlock,vertical: vBlock),
                 child: UserTextInput(
                   fieldName: 'رقم الموبايل',
                   keyboardType: TextInputType.number,
                 ),
               ),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 12*hBlock,vertical: vBlock),
                 child: UserTextInput(
                   fieldName: 'الرقم السري',
                   isPassword: true,
                 ),
               ),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 12*hBlock,vertical: vBlock),
                 child: UserTextInput(
                   fieldName: 'تأكيد الرقم السري',
                   isPassword: true,
                 ),
               ),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 12*hBlock,vertical: vBlock),
                 child: CustomButton(
                   text: 'تسجيل',
                   buttonColor: Color(0xFF61B356),
                   textColor: Colors.white,
                   onPressed: () {
                     setState(() {
                       showSpinner = true;
                     });
                     pushNewScreen(context, screen: MyHomePage());
                     setState(() {
                       showSpinner = false;
                     });
                   },
                   width: 72 * hBlock,
                 ),
               ),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 12*hBlock,vertical: vBlock),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     InkWell(
                       onTap: (){
                         Navigator.pushNamed(context, '/login');
                         },
                       child: Text(
                         'تسجيل الدخول  ',
                         style: kDropStyle.copyWith(color: Color(0xFF61B356),fontWeight: FontWeight.bold),
                       ),
                     ),
                     Text(
                        'هل تمتلك حساب ؟ ',
                       style: kTextStyle,
                     )
                   ],
                 ),
               )

             ],
          ),
        ),
      ),
    );
  }
}
