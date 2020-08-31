/**
 * this file is written by package persistent_bottom_nav_bar makers
 * this is the structured Nav bar example existing at the example tap of the package
 * date of use : 4-6-2020
 * you can find its version at the pubspec.yaml
 * **/

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:tamween_edafi/screens/place-order-screens/order.dart';
import 'custom-widget.dart';
import 'package:tamween_edafi/screens/calculator.dart';
import 'package:tamween_edafi/screens/notifications.dart';
import 'package:tamween_edafi/screens/profile.dart';
import 'package:tamween_edafi/screens/shopping-cart.dart';

const Color selectedColor = Color(0xFF61B356);
const Color deSelectedColor = Colors.grey;



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 2);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // this is the distrctr
    _controller.dispose(); // end controller
    super.dispose();
  }


  List<Widget> _buildScreens() {
    return [
      Calculator(),
      Cart(),
      Order(),
      Notifier(),
      ProfileController(),
     ];
  }

  var iconsColors = [
    deSelectedColor,
    deSelectedColor,
    selectedColor,
    deSelectedColor,
    deSelectedColor,
  ];


  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
            'assets/calculator.svg',
            alignment: Alignment.center,
            color: this.iconsColors[0],
            fit: BoxFit.none,
        ),
        title: ("Calculator"),
      ),
      PersistentBottomNavBarItem(
        //icon: Image.asset('icons/cart.png',width: 40, height: 40,),
        icon: SvgPicture.asset(
          'assets/cart.svg',
          color: this.iconsColors[1],
          fit: BoxFit.none,
        ),
        title: ("Cart"),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/order4.svg',
          color: this.iconsColors[2],
          fit: BoxFit.fill,
        ),
        title: ("Order"),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/notification.svg',
          color: this.iconsColors[3],
          fit: BoxFit.scaleDown,
        ),
        title: ("Notifications"),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/user.svg',
          color: this.iconsColors[4],
          fit: BoxFit.scaleDown,
        ),
        title: ("Profile"),
      ),
    ];
  }

  changeColor(int index){
    setState(() {
      for(int i=0 ; i < iconsColors.length ;i++){
        iconsColors[i] = deSelectedColor ;
      }
      iconsColors[index] = selectedColor ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        controller: _controller,
        screens: _buildScreens(),
        items:
        _navBarsItems(), // Redundant here but defined to demonstrate for other than custom style
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        onItemSelected: (int x) {
          setState(
                  () {
                    changeColor(x) ;
                  }); // This is required to update the nav bar if Android back button is pressed
        },
        customWidget: CustomNavBarWidget(
          items: _navBarsItems(),
          onItemSelected: (index) {
            setState(() {
              _controller.index = index; // THIS IS CRITICAL!! Don't miss it!
            });
          },
          selectedIndex: _controller.index,
        ),
        itemCount: 5,
        navBarStyle:
        NavBarStyle.neumorphic // Choose the nav bar style with this property
    );
  }
}

