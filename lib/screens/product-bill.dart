import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tamween_edafi/components/top-bars/app-bar.dart';
import 'package:tamween_edafi/components/custom-button.dart';
import 'package:tamween_edafi/constants.dart';
import 'package:tamween_edafi/controllers/size_config.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



class ProductBill extends StatefulWidget {

  final List<String> selected;
  final quantity;
  final double price;
  final String selectedDay;
  final String selectedTime;
  ProductBill(this.selected, this.quantity, this.price,this.selectedDay, this.selectedTime);
    //print('$selected, $quantity, $price, $selectedDay, $selectedTime');

  @override
  _ProductBillState createState() => _ProductBillState();
}


class _ProductBillState extends State<ProductBill> {

  @override
  void initState() {
    super.initState();
    buildContentArray();
  }

  void buildContentArray() {

  }

  @override
  Widget build(BuildContext context) {

    final f = new DateFormat('yyyy-MM-dd');
    String date = f.format(new DateTime.now());


    //get screen size (w & h)
    SizeConfig().init(context);
    double hBlock = SizeConfig.blockSizeHorizontal;
    double vBlock = SizeConfig.blockSizeVertical;

    showAlert(){
      Alert(
        context: context,
        title: 'الغاء الطلب',
        style: AlertStyle(
          titleStyle: kTextStyle.copyWith(color: Color(0xFFFF3D3D),fontWeight: FontWeight.w700),
          descStyle: kTextStyle,
        ),
        desc: 'هل أنت متأكد من الغاء الطلب ؟',
        content:Container(
          margin: EdgeInsets.only(top: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomButton(
                onPressed: ()async{
                  await Navigator.maybePop(context);
                  Alert(
                      context: context,
                      title: 'الغاء الطلب',
                      style: AlertStyle(
                        animationDuration: Duration(milliseconds: 400),
                        titleStyle: kTextStyle.copyWith(color: Color(0xFFFF3D3D),fontWeight: FontWeight.w700),
                      ),
                      buttons: [],
                      content: Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/doneRed.png'),
                            Text(
                              'تم الغاء العملية',
                              style: kTextStyle,
                            ),
                          ],
                        ),
                      )
                  ).show();
                },
                text: 'نعم',
                width: 30*hBlock,
                buttonColor: Color(0xFFFF3D3D),
                textColor: Colors.white,
              ),
              SizedBox(width: 4*hBlock,),
              CustomButton(
                onPressed: (){
                  Navigator.maybePop(context);
                },
                text: 'رجوع',
                width: 30*hBlock,
                buttonColor: Colors.white,
                textColor: Colors.green,
              ),
            ],
          ),
        ),
        buttons: [],
      ).show();
    }


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
            CustomAppBar(
              // from component app-bar
              height: 15*vBlock,
              vBlock: vBlock,
              hBlock: hBlock,
              title: 'المشتريات',
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0x12000000),
                            offset: Offset(0, -4),
                            blurRadius: 5,
                            spreadRadius: 3)
                      ],
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10.0),
                      ),
                    ),
                    height: 6*vBlock,
                    margin: EdgeInsets.only(right: 15.0,left: 15.0, bottom: 3.0),
                    child: Text(
                      'فاتورة مشتريات هذا الشهر',
                      textAlign: TextAlign.center,
                      style: kTextStyle.copyWith(color: Colors.green,fontWeight: FontWeight.w700),
                    ),
                  ),
                  BillElement(vBlock: vBlock, value: date, fieldName: 'تاريخ الطلب',),
                  BillElement(vBlock: vBlock, value: '56238', fieldName: 'رقم الطلب',),
                  BillElement(vBlock: vBlock, value: 'تحت التسليم', fieldName: 'حالة الطلب',),
                  for(int i=0 ; i< widget.selected.length ;i++)
                    BillElement(vBlock: vBlock, value: 'عدد ${widget.quantity[i]} ${widget.selected[i]}', fieldName: 'المنتج',),
                  BillElement(vBlock: vBlock, value: '${widget.price}', fieldName: 'اجمالي المبلغ',),
                  BillElement(vBlock: vBlock, value: '${widget.selectedDay}', fieldName: 'يوم الاستلام',),
                  BillElement(vBlock: vBlock, value: '${widget.selectedTime}', fieldName: 'وقت الاستلام',),
                ],
              ),
            ),
            Container(
              color: Color(0xFFF6F6F6),
              padding: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    text: 'العودة',
                    width: 40*hBlock,
                    buttonColor: Color(0xFF61B356),
                    textColor: Colors.white,
                  ),
                  SizedBox(width: 8*hBlock,),
                  CustomButton(
                    onPressed: (){
                      showAlert();
                    },
                    text: 'الغاء الطلب',
                    width: 40*hBlock,
                    buttonColor: Color(0xFFFF3D3D),
                    textColor: Colors.white,
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

class BillElement extends StatelessWidget {
  const BillElement({
    Key key,
    @required this.vBlock,
    @required this.fieldName,
    @required this.value,
  }) : super(key: key);

  final double vBlock;
  final String fieldName, value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color(0xFFECECEC),
          width: 1,
        )
      ),
      height: 8*vBlock,
      margin: EdgeInsets.only(right: 15.0,left: 15.0, ),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            value ?? '' ,
            style: kDropStyle,
          ),
          Text(
            fieldName ?? '',
            textAlign: TextAlign.end,
            style: kTextStyle.copyWith(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
