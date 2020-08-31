import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:tamween_edafi/components/navigation-bar/navigation.dart';
import 'package:tamween_edafi/components/sliding-panel.dart';
import 'package:tamween_edafi/components/top-bars/app-bar.dart';
import 'package:flutter/services.dart';
import 'package:tamween_edafi/components/custom-button.dart';
import 'package:tamween_edafi/controllers/size_config.dart';
import 'package:tamween_edafi/constants.dart';
import 'package:tamween_edafi/components/text-input.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


class OrderData extends StatefulWidget {
  final bool isCalculator;
  OrderData({
    @required this.isCalculator,
  });

  @override
  _OrderDataState createState() => _OrderDataState();
}

class _OrderDataState extends State<OrderData> {
  double hBlock, vBlock;
  var hints = [
    'كم لتر من الزيت ؟',
    'كم كيلو من الورق ؟',
    'كم كيلو من البلاستيك ؟',
    'كم كيلو من الصفيح او المعدن ؟'
  ];

  @override
  Widget build(BuildContext context) {


    //get screen size (w & h)
    SizeConfig().init(context);
    hBlock = SizeConfig.blockSizeHorizontal;
    vBlock = SizeConfig.blockSizeVertical;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        children: <Widget>[
          Column(
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
                      child: Text('احسب مخلفاتك',
                          textAlign: TextAlign.center,
                          style: kTextStyle.copyWith(
                            color: Color(0xff416336),
                            fontWeight: FontWeight.w700,
                            fontSize: 3.5 * hBlock,
                          )),
                      padding:
                          EdgeInsets.only(top: 4 * vBlock, left: 47 * hBlock),
                    ),
                    SizedBox(
                      height: vBlock,
                    ),
                    for (var hint in hints)
                      Column(
                        children: <Widget>[
                          UserTextInput(
                            fieldName: hint,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 2 * vBlock,
                          ),
                        ],
                      ),
                    SizedBox(
                      height: vBlock,
                    ),
                    CustomButton(
                      text: 'احسب',
                      buttonColor: Color(0xFF61B356),
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          showMaterialModalBottomSheet(
                              expand: false,
                              useRootNavigator: true,
                              context: context,
                              enableDrag: false,
                              builder: (context, scrollController) =>
                                  SlidingPanel(
                                    isCalculator: widget.isCalculator,
                                    goToOrderLocation: () {
                                      pushNewScreen(context, screen: MyHomePage());
                                    },
                                  ));
                        });
                      },
                      width: 72 * hBlock,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
