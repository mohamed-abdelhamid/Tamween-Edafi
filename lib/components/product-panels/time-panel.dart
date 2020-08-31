import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:tamween_edafi/components/selection-button.dart';
import 'package:tamween_edafi/components/product-panels/sent-panel.dart';
import 'package:tamween_edafi/controllers/size_config.dart';
import 'package:tamween_edafi/constants.dart';
import 'package:tamween_edafi/components/custom-button.dart';


class TimePanel extends StatefulWidget {

  final List<String> selected;
  final quantity;
  final double price;
  final String govName;
  final String cityName;
  final String fullAddress;
  final String selectedDay;
  TimePanel(this.selected, this.quantity, this.price, this.govName, this.cityName, this.fullAddress, this.selectedDay);

  @override
  _DatePanelState createState() => _DatePanelState();
}

class _DatePanelState extends State<TimePanel> {


  var availableTimes = [
    'من ۸ صباحا الى ۱۱ ظهرا',
    'من ۱۱ ظهرا الى ۲ عصرا',
    'من ۲ عصرا الى ٥ مساء',
    'من ٥ مساء الى ۸ مساء',
  ];
  double hBlock, vBlock;
  var isSelected =  [true , false, false, false] ;
  int selected = 0 , prevSelected ;
  String selectedTime = 'من ۸ صباحا الى ۱۱ ظهرا' ;

  void select(int index){
    if(selected != index){
      prevSelected = selected ;
      selected = index ;
      isSelected[selected] = true ;
      isSelected[prevSelected] = false ;
    }
  }

  showSentPanel(){
    showMaterialModalBottomSheet(
      expand: false,
      useRootNavigator: true,
      context: context,
      enableDrag: false,
      builder: (context, scrollController) =>
          SentPanel(
            widget.selected,
            widget.quantity,
            widget.price,
            widget.selectedDay,
            selectedTime,
          ),
    );
  }


  @override
  Widget build(BuildContext context) {

    SizeConfig();
    double vBlock = SizeConfig.blockSizeVertical;
    double hBlock = SizeConfig.blockSizeHorizontal;

    return Container(
      height: 57 * vBlock + 5,
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
                  'اختر الميعاد',
                  style: kTextStyle.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF707070),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: vBlock,
            ),
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
                      onPressed: ()async{
                          for(int i=0 ; i< 4 ; i++)
                            await Navigator.maybePop(context);
                          showSentPanel();
                        },
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

}


