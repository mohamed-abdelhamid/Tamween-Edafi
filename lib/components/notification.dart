import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamween_edafi/constants.dart';
import 'package:tamween_edafi/controllers/size_config.dart';

class OrderNotification extends StatelessWidget {
  final Function select;
  final String title, date;
  final bool isSelected;

  const OrderNotification({
    Key key,
    @required this.select,
    @required this.title,
    @required this.isSelected,
    @required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig();
    double hBlock = SizeConfig.blockSizeHorizontal,
        vBlock = SizeConfig.blockSizeVertical;
    return GestureDetector(
      onTap: isSelected ? select : () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: .5*vBlock),
        width: double.infinity,
        height: 10 * vBlock,
        color: isSelected ? Color(0xFFEEF2ED) : Color(0xFFF6F6F6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Flexible(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      title,
                      textAlign: TextAlign.right,
                      maxLines: 2,
                      textDirection: TextDirection.rtl,
                      overflow: TextOverflow.ellipsis,
                      style: kTextStyle.copyWith(
                        color: Color(0xFF416336),
                      ),
                    ),
                  ),
                ),
                Text(
                  date,
                  textAlign: TextAlign.end,
                  style: kDropStyle.copyWith(
                    fontSize: 3 * hBlock,
                  ),
                ),
              ],
            ),
            Flexible(
              child: Container(
                width: 20*hBlock,
                height: 20*vBlock,
                padding: EdgeInsets.only(right: 3*hBlock),
                alignment: Alignment.centerRight,
                child: Image.asset('assets/notification.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
