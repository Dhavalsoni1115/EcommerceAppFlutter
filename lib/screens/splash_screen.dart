import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
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
