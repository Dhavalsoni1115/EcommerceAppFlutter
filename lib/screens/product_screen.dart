import 'package:flutter/material.dart';

import '../constants.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Expanded(
          child: TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.grey,
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ),
        actions: const [
          Icon(
            Icons.notifications,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.mail,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.favorite,
            size: 30,
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('assets/images/T973DText.png'),
                          fit: BoxFit.fill)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
