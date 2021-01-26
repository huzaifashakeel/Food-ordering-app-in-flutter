import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_app/Helpers/screen_navigation.dart';
import 'package:food_ordering_app/Screens/Home.dart';
import 'package:food_ordering_app/Screens/shoppingBag.dart';

class BottomNavBar extends StatefulWidget {
  int active;
  BottomNavBar({@required this.active});
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 50,
      color: Colors.red,
      backgroundColor: Colors.white,
      animationDuration: Duration(milliseconds: 350),
      animationCurve: Curves.easeInOutExpo,
      index: widget.active,
      items: <Widget>[
        Icon(Icons.arrow_back, size: 30, color: Colors.black),
        Icon(Icons.account_box, size: 30, color: Colors.black),
        Icon(Icons.home, size: 30, color: Colors.black),
        Icon(Icons.shop, size: 30, color: Colors.black),
        Icon(Icons.settings, size: 30, color: Colors.black),
      ],
      onTap: (index) {
        if (index == widget.active) return;
        if (index == 3) {
          ChangeScreen(context, ShoppingBag());
          initState();
        }
        if (index == 2) {
          ChangeScreen(context, Home());
          initState();
        }
      },
    );
  }
}
