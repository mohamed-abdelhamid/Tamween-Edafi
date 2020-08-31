import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:tamween_edafi/components/top-bars/app-bar.dart';
import 'package:flutter/services.dart';
import 'package:tamween_edafi/components/navigation-bar/navigation.dart';
import 'package:tamween_edafi/controllers/size_config.dart';

String picName ='assets/sent1.png';

class OrderSent extends StatefulWidget {
  @override
  _OrderSentState createState() => _OrderSentState();
}

class _OrderSentState extends State<OrderSent> {

  double hBlock, vBlock;

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
    await Future.delayed(const Duration(seconds: 1), (){});
    setState(() {
      picName ='assets/sent1.png';
    });
    pushNewScreen(context, screen: MyHomePage());
  }

  @override
  Widget build(BuildContext context) {

    //get screen size (w & h)
    SizeConfig().init(context);
    hBlock = SizeConfig.blockSizeHorizontal;
    vBlock = SizeConfig.blockSizeVertical;

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
              vBlock: vBlock,
              hBlock: hBlock,
              title: 'أرسل طلب',
              height: 15*vBlock,
            ),
            Center(
              child: AnimatedSwitcher(
                duration: Duration(seconds: 1),
                child: ChangedPicture(hBlock: hBlock, vBlock: vBlock),
              ),
            )
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
