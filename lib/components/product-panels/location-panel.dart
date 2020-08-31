import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:tamween_edafi/controllers/size_config.dart';
import 'package:tamween_edafi/constants.dart';
import 'package:tamween_edafi/components/custom-button.dart';

import 'day-panel.dart';


class LocationPanel extends StatefulWidget {

  final quantity ;
  final List<String> selected ;
  final double price ;
  LocationPanel(this.selected,this.quantity ,this.price);


  @override
  _LocationPanelState createState() => _LocationPanelState();
}

class _LocationPanelState extends State<LocationPanel> {

  String govName = 'القاهرة', cityName = 'حلوان', fullAddress ;
  List<String> govNames = ['القاهرة', 'الجيزة'];
  List<String> cityNames = ['حلوان', 'الحوامدية', 'المعصرة', 'المعادي'];
  double vBlock,hBlock,panelHeight ;

  showDayPanel(){
    showMaterialModalBottomSheet(
      expand: false,
      useRootNavigator: true,
      context: context,
      enableDrag: false,
      builder: (context, scrollController) =>
          DayPanel(widget.selected,widget.quantity,widget.price,govName,cityName,fullAddress),
    );
  }

  @override
  void initState() {
    super.initState();
    SizeConfig();
    vBlock = SizeConfig.blockSizeVertical;
    hBlock = SizeConfig.blockSizeHorizontal;
    panelHeight = 53 * vBlock ;
  }

  @override
  Widget build(BuildContext context) {

    SizeConfig();
    vBlock = SizeConfig.blockSizeVertical;
    hBlock = SizeConfig.blockSizeHorizontal;


    return Container(
      height: panelHeight,
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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 7 * vBlock,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFFF8F8F8), width: 5)),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'حدد المنطقة',
                  style: kTextStyle.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF707070),
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5*hBlock),
                  child: buildDropDownButton(context, govNames, 1),
                ),
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
                    onChanged: (String input)=> this.fullAddress = input ,
                    onTap: ()=>
                      setState(() {
                        panelHeight = 80*vBlock;
                      }),
                    onFieldSubmitted: (String add)=>
                      setState(() {
                        panelHeight = 53 * vBlock ;
                      }),
                    style:  kTextStyle,
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
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFf8f8f8),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20.0),
                ),
              ),
              height: 15 * vBlock,
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomButton(
                      onPressed: showDayPanel,
                      text: 'التالي',
                      width: 40*hBlock,
                      buttonColor: Color(0xFF61B356),
                      textColor: Colors.white,
                    ),
                    SizedBox(width: 8*hBlock,),
                    CustomButton(
                      onPressed: (){
                        Navigator.maybePop(context);
                      },
                      text: 'السابق',
                      width: 40*hBlock,
                      buttonColor: Color(0xFFF6F6F6),
                      textColor: Colors.green,
                    ),
                  ],
                ),
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
