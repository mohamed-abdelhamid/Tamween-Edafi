import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.widget.dart';
import 'package:tamween_edafi/components/top-bars/app-bar.dart';
import 'package:tamween_edafi/components/custom-button.dart';
import 'package:tamween_edafi/components/navigation-bar/navigation.dart';
import 'package:tamween_edafi/components/text-input.dart';
import 'package:tamween_edafi/controllers/size_config.dart';
import '../../constants.dart';

class ResetPass extends StatefulWidget {
  @override
  _State createState() => _State();
}


class _State extends State<ResetPass> {

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
              padding: EdgeInsets.symmetric(horizontal: 12*hBlock,vertical: 1*vBlock),
              child: UserTextInput(
                fieldName: 'كلمة السر الجديدة',
                isPassword: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12*hBlock,vertical: 1*vBlock),
              child: UserTextInput(
                fieldName: 'تأكيد كلمة السر الجديدة',
                isPassword: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12*hBlock,vertical: 2*vBlock),
              child: CustomButton(
                text: 'تأكيد',
                buttonColor: Color(0xFF61B356),
                textColor: Colors.white,
                onPressed: () {
                  pushNewScreen(context, screen: MyHomePage());
                },
                width: 72 * hBlock,
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/reset');
              },
              child: Center(
                child: Text(
                  'اعادة الأرسال',
                  style: kTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
