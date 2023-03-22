import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce_app/features/home/home_screen.dart';
import 'package:ecommerce_app/features/bottomnavigation/navigatescreen.dart';
import 'package:ecommerce_app/features/login/login.dart';
import 'package:ecommerce_app/features/product/product_screen.dart';
import 'package:ecommerce_app/features/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'features/register/register.dart';

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
      home:
          //RegisterScreen(),
          AnimatedSplashScreen(
        splash: SplashScreen(),
        nextScreen: NavigateScreen(),
        duration: 1000,
        splashTransition: SplashTransition.scaleTransition,
      ),
    );
  }
}
