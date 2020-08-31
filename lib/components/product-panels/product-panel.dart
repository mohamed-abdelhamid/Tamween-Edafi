import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:tamween_edafi/controllers/size_config.dart';
import 'package:tamween_edafi/constants.dart';
import 'package:tamween_edafi/components/custom-button.dart';

import 'location-panel.dart';



class ProductPanel extends StatefulWidget {

  final List<String> selected ;
  final List<double> selectedPrices;

  ProductPanel({@required this.selected, @required this.selectedPrices,});
  @override
  _ProductPanelState createState() => _ProductPanelState();
}

class _ProductPanelState extends State<ProductPanel> {

  var quantity = [];
  List<String> selected = [];
  List<double> selectedPrices = [];
  double limit = 50.0 ;
  double price =0 ;

  calculatePrice(){
    double temp = 0 ;
    for(int i=0 ; i<selectedPrices.length ; i++){
      temp += selectedPrices.elementAt(i) * quantity[i];
    }
    price = temp ;
  }

  subtract(int index){
    if(quantity.elementAt(index) > 1){
      quantity[index]-- ;
      calculatePrice();
    }
  }

  add(int index){
    quantity[index]++ ;
    calculatePrice();
  }

  showLocationPanel(){
    showMaterialModalBottomSheet(
      expand: false,
      useRootNavigator: true,
      context: context,
      enableDrag: false,
      builder: (context, scrollController) =>
          LocationPanel(selected,quantity,price),
    );
  }

  @override
  void initState() {
    super.initState();
    calculatePrice();
    selected = widget.selected ;
    selectedPrices = widget.selectedPrices ;
    for(int i=0; i< selected.length; i++) // initialize quantity list
      quantity.add(1);
  }

  @override
  Widget build(BuildContext context) {

    calculatePrice();
    SizeConfig();
    double vBlock = SizeConfig.blockSizeVertical,
        hBlock = SizeConfig.blockSizeHorizontal;
    return Container(
      height: 52 * vBlock + 5,
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
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'المشتريات',
                  style: kTextStyle.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF707070),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  for(int i =0 ; i<selected.length ; ++i)
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(FontAwesomeIcons.minus,size: 6*hBlock,color: Color(0xFF61B356),),
                            onPressed:()=> setState(() {
                              subtract(i);
                            }),
                          ),
                          SizedBox(width: 2*hBlock,),
                          Text(
                            quantity[i].toString(),
                            style: kTextStyle,
                          ),
                          SizedBox(width: 2*hBlock,),
                          IconButton(
                            icon: Icon(FontAwesomeIcons.plus,size: 6*hBlock,color: Color(0xFF61B356),),
                            color: Color(0xFFD7ECD5),
                            onPressed: ()=> setState(() {
                              add(i);
                            }),
                          ),
                          SizedBox(
                            width: 50*hBlock,
                          ),
                          Text(
                            selected[i],
                            style: kTextStyle,
                          )
                        ],
                      ),
                    ),
                ],
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                      SizedBox(width: 5*hBlock,),
                      CustomButton(
                        onPressed: (){
                          if (price <= limit){
                            showLocationPanel();
                          }
                        },
                        textColor: Colors.white,
                        buttonColor: price <= limit ? Color(0xFF61B356) : Color(0xFFABABAB),
                        text: 'تأكيد الشراء',
                        width: 43*hBlock,
                      ),
                      SizedBox(width: 7*hBlock,),
                    Text(
                      price.toString(),
                      style: kTextStyle.copyWith(
                        color: price <= limit ? Color(0xFF61B356) : Colors.red,
                      ),
                    ),
                      Text(
                        '  :اجمالي المبلغ ',
                        style: kTextStyle,
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
