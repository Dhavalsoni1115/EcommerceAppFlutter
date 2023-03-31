import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:ecommerce_app/features/bottomnavigation/navigatescreen.dart';
import 'package:ecommerce_app/features/checkout/presentation/screen/checkout_screen.dart';
import 'package:ecommerce_app/features/login/presentation/screens/login.dart';
import 'package:ecommerce_app/features/product/presentation/screens/product_screen.dart';
import 'package:ecommerce_app/features/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'features/cart/prasentation/screens/cart_screen.dart';
import 'features/register/presentation/screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckoutScreen(),
      //     AnimatedSplashScreen(
      //   splash: SplashScreen(),
      //   nextScreen: NavigateScreen(),
      //   duration: 1000,
      //   splashTransition: SplashTransition.scaleTransition,
      // ),
    );
  }
}
