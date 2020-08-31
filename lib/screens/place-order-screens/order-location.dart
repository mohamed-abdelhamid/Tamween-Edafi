import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:tamween_edafi/components/top-bars/app-bar.dart';
import 'package:flutter/services.dart';
import 'package:tamween_edafi/components/custom-button.dart';
import 'package:tamween_edafi/controllers/size_config.dart';
import 'package:tamween_edafi/screens/place-order-screens/order-day.dart';
import 'package:tamween_edafi/constants.dart';

class OrderLocation extends StatefulWidget {
  @override
  _OrderLocationState createState() => _OrderLocationState();
}

class _OrderLocationState extends State<OrderLocation> with SingleTickerProviderStateMixin {

  String govName = 'القاهرة', cityName = 'حلوان';
  List<String> govNames = ['القاهرة', 'الجيزة'];
  List<String> cityNames = ['حلوان', 'الحوامدية', 'المعصرة', 'المعادي'];
  double hBlock , vBlock  ;

  AnimationController controller;
  Animation animation;
  FocusNode focusNode = FocusNode();



  @override
  void dispose() {
    controller.dispose(); // end controller
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    controller = new AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
      upperBound: 10.0,
      lowerBound: 0.0,
      value: 10.0,
    );

    controller.addListener(() {
      setState(() {});
    });

    focusNode.addListener(() {
     setState(() {
       if (focusNode.hasFocus) {
         controller.reverse();
       } else {
         controller.forward();
       }
     });
    });
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
                        'حدد المنطقة',
                        textAlign: TextAlign.center,
                        style: kDropStyle
                    ),
                    padding: EdgeInsets.only(top: controller.value*vBlock, left: 50*hBlock),
                  ),

                  buildDropDownButton(context, govNames, 1),
                  SizedBox(
                    height: vBlock,
                  ),

                  buildDropDownButton(context, cityNames, 2),
                  SizedBox(
                    height: vBlock,
                  ),

                  Container(
                    height: 10*vBlock,
                    width: 72*hBlock,
                    margin: EdgeInsets.symmetric(vertical: vBlock, horizontal: 5*hBlock),
                    child: TextFormField(
                      style:  kTextStyle,
                      focusNode: focusNode,
                      maxLength: 48,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        counterText: "", // underline of drop down
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                          BorderSide(color: Color(0xFFE7F4E6), width: 0.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                          BorderSide(width: 2.0, color: Colors.green),
                        ),
                        hintText: 'العنوان بالتفصيل',
                        hintStyle: kDropStyle.copyWith(color: Colors.green,height: 1.7),
                        fillColor: Color(0xFFD5E7D3),
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2*vBlock,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomButton(
                        onPressed: (){
                          pushNewScreen(context, screen: OrderDay(),);
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


  Container buildDropDownButton(
      BuildContext context, List<String> dropList, int buttonID)
  {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.symmetric(vertical: vBlock, horizontal: 5*hBlock),
      height: 6.5*vBlock,
      width: 72*hBlock,
      decoration: BoxDecoration(
        color: Color(0xFFD5E7D3),
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF61B356),
        ),
        child: DropdownButton<String>(
          underline: SizedBox(),
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 30,
          value: buttonID == 1 ? govName : cityName,
          style: kDropStyle,
          onChanged: (String newValue) {
            setState(() {
              buttonID == 1 ? govName = newValue : cityName = newValue;
            });
          },
          selectedItemBuilder: (BuildContext context) {
            return dropList.map((String value) {
              return Container(
                width: 60*hBlock,
                padding: EdgeInsets.only(left: 6*hBlock),
                alignment: Alignment.center,
                child: Text(
                  buttonID == 1 ? govName : cityName,
                  style: TextStyle(color: Color(0xFF61B356),),
                ),
              );
            }).toList();
          },
          items: dropList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Column(
                children: <Widget>[
                  Text(
                    value,
                  ),
                  SizedBox(height: .8*vBlock,),
                  Container(
                    height: .3,
                    color: Colors.white,
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
