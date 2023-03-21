import 'package:ecommerce_app/features/bottomnavigation/navigatescreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   navigateHome();
  // }

  // navigateHome() async {
  //   await Future.delayed(Duration(milliseconds: 1500), () {});
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => NavigateScreen(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: double.infinity,
            //color: Colors.red,
            child: Image(
              image: AssetImage('assets/images/e_logo.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 150,
            width: 250,
            //color: Colors.red,
            child: Image(
              image: AssetImage('assets/images/T973DText.png'),
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
