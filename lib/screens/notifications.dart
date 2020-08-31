import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tamween_edafi/components/custom-button.dart';
import 'package:tamween_edafi/components/notification.dart';
import 'package:tamween_edafi/components/top-bars/app-bar.dart';
import 'package:tamween_edafi/constants.dart';
import 'package:tamween_edafi/controllers/size_config.dart';

class Notifier extends StatefulWidget {
  @override
  _NotifierState createState() => _NotifierState();
}

class _NotifierState extends State<Notifier> {
  List<String> notificationsTitle = [
    'تسليم المشتريات 5 أكتوبر الساعة 10', // if the text is larger than this it will overflow
    // and overflow isn't working idk why
    'تم ارسال طلب المشتريات',
    'تم ارسال طلب استبدال المخلفات',
    'أهلا بك في تموين اضافي',
  ];

  List<String> notificationsDates = [
    '5/8/2019',
    '5/8/2019',
    '28/7/2019',
    '25/7/2019',
  ];

  var isSelected = [true, false, false, false];

  deSelectNotification(int index) {
    isSelected[index] = false;
  }

  @override
  Widget build(BuildContext context) {
    //get screen size (w & h)
    SizeConfig().init(context);
    double hBlock = SizeConfig.blockSizeHorizontal;
    double vBlock = SizeConfig.blockSizeVertical;


    showAlert(int counter) {
      Alert(
        context: context,
        title: 'تأكيد العملية',
        style: AlertStyle(
          titleStyle: kTextStyle.copyWith(
              color: Colors.green, fontWeight: FontWeight.w700),
          descStyle: kTextStyle,
        ),
        desc: notificationsTitle[counter],
        content: Container(
          margin: EdgeInsets.only(top: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  Alert(
                      context: context,
                      title: 'تأكيد العملية',
                      style: AlertStyle(
                        animationDuration:
                        Duration(milliseconds: 400),
                        titleStyle: kTextStyle.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.w700),
                      ),
                      buttons: [],
                      content: Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.assignment_turned_in, color: Colors.green,size: 40,),
                            SizedBox(height: vBlock,),
                            Text(
                              'تم تأكيد العملية',
                              style: kTextStyle,
                            ),
                          ],
                        ),
                      )).show();
                  setState(() {
                    deSelectNotification(counter);
                  });
                },
                text: 'تأكيد',
                width: 30 * hBlock,
                buttonColor: Colors.white,
                textColor: Colors.green,
              ),
              SizedBox(
                width: 4 * hBlock,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  Alert(
                    context: context,
                    title: 'الغاء العملية',
                    style: AlertStyle(
                      titleStyle: kTextStyle.copyWith(
                          color: Color(0xFFFF3D3D),
                          fontWeight: FontWeight.w700),
                      descStyle: kTextStyle,
                    ),
                    desc: 'هل أنت متأكد من الغاء العملية ؟',
                    content: Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomButton(
                            buttonColor: Colors.white,
                            text: 'العودة',
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            textColor: Colors.green,
                          ),
                          SizedBox(
                            width: 4 * hBlock,
                          ),
                          CustomButton(
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop();
                              Alert(
                                  context: context,
                                  title: 'الغاء العملية',
                                  style: AlertStyle(
                                    animationDuration:
                                        Duration(milliseconds: 400),
                                    titleStyle: kTextStyle.copyWith(
                                        color: Color(0xFFFF3D3D),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  buttons: [],
                                  content: Container(
                                    margin: EdgeInsets.only(top: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset('assets/doneRed.png'),
                                        Text(
                                          'تم الغاء العملية',
                                          style: kTextStyle,
                                        ),
                                      ],
                                    ),
                                  )).show();
                              setState(() {
                                deSelectNotification(counter);
                              });
                            },
                            text: 'نعم',
                            width: 30 * hBlock,
                            buttonColor: Color(0xFFFF3D3D),
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    buttons: [],
                  ).show();
                },
                text: 'الغاء',
                width: 30 * hBlock,
                buttonColor: Color(0xFFFF3D3D),
                textColor: Colors.white,
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
              vBlock: vBlock,
              hBlock: hBlock,
              title: 'التنبيهات',
              height: 15 * vBlock,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5 * hBlock),
                    child: Text(
                      'تنبيهات تهمك',
                      textAlign: TextAlign.end,
                      style: kTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 2 * vBlock,
                  ),
                  for (int i = 0; i < notificationsTitle.length; i++)
                    Container(
                      alignment: Alignment.centerRight,
                      child: OrderNotification(
                        title: notificationsTitle[i],
                        isSelected: isSelected[i],
                        date: notificationsDates[i],
                        select: () {
                          showAlert(i);
                        },
                      ),
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
