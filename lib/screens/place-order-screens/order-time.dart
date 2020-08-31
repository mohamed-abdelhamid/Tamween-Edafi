import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:tamween_edafi/components/top-bars/app-bar.dart';
import 'package:flutter/services.dart';
import 'package:tamween_edafi/components/custom-button.dart';
import 'package:tamween_edafi/controllers/size_config.dart';
import 'package:tamween_edafi/constants.dart';
import 'package:tamween_edafi/components/selection-button.dart';
import 'order-data.dart';

class OrderTime extends StatefulWidget {
  @override
  _OrderTimeState createState() => _OrderTimeState();
}

class _OrderTimeState extends State<OrderTime> {


  var availableTimes = [
    'من ۸ صباحا الى ۱۱ ظهرا',
    'من ۱۱ ظهرا الى ۲ عصرا',
    'من ۲ عصرا الى ٥ مساء',
    'من ٥ مساء الى ۸ مساء',
  ];
  double hBlock, vBlock;
  var isSelected =  [true , false, false, false] ;
  int selected = 0 , prevSelected ;
  String selectedTime ;

  void select(int index){
    if(selected != index){
      prevSelected = selected ;
      selected = index ;
      isSelected[selected] = true ;
      isSelected[prevSelected] = false ;
    }
  }


  @override
  Widget build(BuildContext context) {

    //get screen size (w & h)
    SizeConfig().init(context);
    hBlock = SizeConfig.blockSizeHorizontal ;
    vBlock = SizeConfig.blockSizeVertical ;


    return Scaffold(
      resizeToAvoidBottomInset: true,
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
            CustomAppBar(
              // from component app-bar
              vBlock: vBlock,
              hBlock: hBlock,
              title: 'أرسل طلب',
              height: 15*vBlock,
            ),
            SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    child: Text(
                        'المواعيد المتاحة لزيارة هذه المنطقة',
                        textAlign: TextAlign.center,
                        style: kTextStyle.copyWith(
                          color: Color(0xff416336),
                          fontWeight: FontWeight.w700,
                          fontSize: 3.5*hBlock,
                        )
                    ),
                    padding: EdgeInsets.only(top: 12*vBlock ,left: 12*hBlock),
                  ),
                  SizedBox(height: vBlock,),
                  for(int i=0 ; i <availableTimes.length ; ++i)
                    Column(
                      children: <Widget>[
                        SelectionButton(
                          buttonText: availableTimes[i],
                          isSelected: isSelected[i],
                          select: (){
                            setState(() {
                              select(i);
                              selectedTime = availableTimes[i];
                            });
                          },
                          borderWidth: isSelected[i] ? 1.5 : 0,
                          borderColor: isSelected[i] ? Colors.green : Color(0xFFD5E7D3),
                        ),
                        SizedBox(height: 2*vBlock,)
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomButton(
                        onPressed: (){
                          pushNewScreen(context, screen: OrderData(
                            isCalculator: false,
                          ));
                        },
                        text: 'التالي',
                        buttonColor: Color(0xFF61B356),
                        textColor: Colors.white,
                      ),
                      SizedBox(width: 8*hBlock,),
                      CustomButton(
                        onPressed: (){
                          Navigator.maybePop(context);
                        },
                        text: 'السابق',
                        buttonColor: Color(0xFFF6F6F6),
                        textColor: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
