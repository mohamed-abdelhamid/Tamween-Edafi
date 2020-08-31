import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:tamween_edafi/controllers/size_config.dart';
import 'package:tamween_edafi/constants.dart';
import 'package:tamween_edafi/components/custom-button.dart';
import 'package:tamween_edafi/screens/product-bill.dart';

String picName ='assets/sent1.png';


class SentPanel extends StatefulWidget {

  final List<String> selected;
  final quantity;
  final double price;
  final String selectedDay;
  final String selectedTime;
  SentPanel(this.selected, this.quantity, this.price,this.selectedDay, this.selectedTime);

  @override
  _SentPanelState createState() => _SentPanelState();
}

class _SentPanelState extends State<SentPanel> {

  @override
  void initState() {
    super.initState();
    changePic();
  }

  void changePic() async {
    await Future.delayed(const Duration(milliseconds: 500), (){});
    setState(() {
      picName = 'assets/sent2.png';
    });
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
                  'المشتريات',
                  style: kTextStyle.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF707070),
                  ),
                ),
              ),
            ),
            Flexible(
              child: AnimatedSwitcher(
                duration: Duration(seconds: 1),
                child: ChangedPicture(hBlock: hBlock, vBlock: vBlock),
              ),
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
                      onPressed: () async {
                        picName = 'assets/sent1.png';// so it's reset if he makes another order doesn't just stay as sent2
                        await Navigator.maybePop(context);
                        pushNewScreen(context, screen: ProductBill(
                          widget.selected,
                          widget.quantity,
                          widget.price,
                          widget.selectedDay,
                          widget.selectedTime,
                        ),withNavBar: true); // it's not working it does not push with nav bar i will skip this for now
                      },
                      text: 'اذهب للفاتورة',
                      width: 40*hBlock,
                      buttonColor: Color(0xFF61B356),
                      textColor: Colors.white,
                    ),
                    SizedBox(width: 8*hBlock,),
                    CustomButton(
                      onPressed: (){
                        picName = 'assets/sent1.png';
                        Navigator.maybePop(context);
                      },
                      text: 'اذهب لاحقا',
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



class ChangedPicture extends StatelessWidget {


  const ChangedPicture({
    Key key,
    @required this.hBlock,
    @required this.vBlock,
  }) : super(key: key);

  final double hBlock;
  final double vBlock;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      picName,
      width: 40*hBlock,
      height: 80*vBlock,
    );
  }
}
