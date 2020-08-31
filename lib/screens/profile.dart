import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamween_edafi/components/top-bars/profile-bar.dart';
import 'package:tamween_edafi/constants.dart';
import 'package:tamween_edafi/controllers/size_config.dart';

class ProfileController extends StatefulWidget {
  @override
  _ProfileControllerState createState() => _ProfileControllerState();
}

class _ProfileControllerState extends State<ProfileController> {
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
        child: Column(
          children: <Widget>[
            ProfileBar(
              vBlock: vBlock,
              hBlock: hBlock,
              title: 'الحساب الشخصي',
              id: '76325123157613',
              name: 'محمد عبد الحميد خليفه',
              points: '1532',
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                    horizontal: 5 * hBlock, vertical: 2*vBlock),
                children: <Widget>[
                  Text(
                    'العمليات السابقة',
                    style: kDropStyle,
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(height: 5*vBlock,),
                  CircleAvatar(
                    radius: 8*vBlock,
                    backgroundColor: Color(0xFFDFECDE),
                    child: Image.asset('assets/no-orders.png',width: 20*hBlock,height: 20*vBlock,),
                  ),
                  Text(
                    'لم تقم بأي عمليات من قبل',
                    textAlign: TextAlign.center,
                    style: kTextStyle.copyWith(color: Colors.green),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
