import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../home/home_screen.dart';
import '../splashscreen/splash_screen.dart';

class NavigateScreen extends StatefulWidget {
  const NavigateScreen({Key? key}) : super(key: key);

  @override
  State<NavigateScreen> createState() => _NavigateScreenState();
}

class _NavigateScreenState extends State<NavigateScreen> {
  List screens = [
    HomeScreen(),
    SplashScreen(),
    SplashScreen(),
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: appBarColor,
        items: const [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_cart,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ],
        letIndexChange: (index) => true,
        onTap: (index) {
          setState(() {
            _onItemTapped(index);
          });
        },
      ),
      body: screens.elementAt(_selectedIndex),
    );
  }
}
