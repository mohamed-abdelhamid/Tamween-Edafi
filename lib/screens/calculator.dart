import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'place-order-screens/order-data.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {


  @override
  Widget build(BuildContext context) {
      return OrderData(isCalculator: true,);
  }
}
