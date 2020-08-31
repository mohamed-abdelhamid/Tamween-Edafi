import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tamween_edafi/components/top-bars/cart-bar.dart';
import 'package:tamween_edafi/components/custom-button.dart';
import 'package:tamween_edafi/components/product-card.dart';
import 'package:tamween_edafi/components/product-panels/product-panel.dart';
import 'package:tamween_edafi/components/search-box.dart';
import 'package:tamween_edafi/controllers/size_config.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  var assetNames = [
    'sugar.jpg',
    'afia.png',
    'matbakh.png',
    'doha.jpg',
    'maleka.png',
    'crystal.jpg',
    //'afia.png'
  ];
  static var productPrices = [
    8.0,
    13.0,
    7.5,
    12.0,
    4.0,
    22.0,
    //13.0
  ];
  static var productNames = [
    'الأسرة',
    'عافية',
    'أرز',
    'الضحى',
    'الملكة',
    'كريستال',
    //'زيت عافية'
  ];
  var isSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    //false,
  ];

  List<String> selected = [];
  List<double> selectedPrices = [];

  selectItem(int index) {
    setState(() {
      if (isSelected[index] == false) {
        isSelected[index] = true;
        selected.add(productNames.elementAt(index));
        selectedPrices.add(productPrices.elementAt(index));
      } else {
        isSelected[index] = false;
        selected.remove(productNames.elementAt(index));
        selectedPrices.remove(productPrices.elementAt(index));
      }
    });
  }

  // to make sure it doesn't crash if array size is not even number
  int evenLength = productNames.length % 2 == 0
      ? productNames.length
      : productNames.length - 1;

  @override
  Widget build(BuildContext context) {
    //get screen size (w & h)
    SizeConfig().init(context);
    double hBlock = SizeConfig.blockSizeHorizontal;
    double vBlock = SizeConfig.blockSizeVertical;

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
            CartBar(
              title: 'المتجر',
              vBlock: vBlock,
              hBlock: hBlock,
              field: SearchBox(
                fieldName: 'ابحث عن منتج',
                aheadIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 6 * hBlock,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: productNames.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 5 / 6,
                ),
                itemBuilder: (context, i) => GridTile(
                  header: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 2 * vBlock, left: 4 * hBlock),
                    child: Visibility(
                      visible: isSelected[i],
                      child: Image.asset(
                        'assets/selection.png',
                        width: 5.5 * hBlock,
                        height: 5.5 * vBlock,
                      ),
                    ),
                  ),
                  child: ProductCard(
                    isSelected: isSelected[i],
                    hBlock: hBlock,
                    vBlock: vBlock,
                    onPress: () {
                      selectItem(i);
                    },
                    assetName: assetNames[i],
                    productName: productNames[i],
                    productPrice: productPrices[i],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: vBlock,
            ),
            CustomButton(
              text: 'احسب الكميات',
              buttonColor: Color(0xFF61B356),
              textColor: Colors.white,
              onPressed: () {
                if (selected.length > 0) {
                  setState(() {
                    showMaterialModalBottomSheet(
                      expand: false,
                      useRootNavigator: true,
                      context: context,
                      enableDrag: false,
                      builder: (context, scrollController) => ProductPanel(
                        selected: selected,
                        selectedPrices: selectedPrices,
                      ),
                    );
                  });
                }
              },
              width: 72 * hBlock,
            ),
            SizedBox(
              height: vBlock,
            )
          ],
        ),
      ),
    );
  }
}
