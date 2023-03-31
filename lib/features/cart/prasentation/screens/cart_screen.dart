import 'dart:convert';

import 'package:ecommerce_app/features/appbar/customappbar.dart';
import 'package:ecommerce_app/features/cart/data/model/cart_model.dart';
import 'package:ecommerce_app/features/cart/prasentation/widgets/shopping_card.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../home/data/model/product_model.dart';
import '../../data/data_source/shared_pref.dart';

class CartScreen extends StatefulWidget {
  List<Cart> cartData;
  int count;
  CartScreen({
    Key? key,
    required this.cartData,
    required this.count,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var prefData = SharedPref();
  dynamic cartDatapref;
  getProductPref() async {
    cartDatapref = await prefData.getCartData();
    setState(() {
      cartDatapref = cartDatapref;
    });
    print('======CartScreenData=====');
    //print(cartDatapref);
    return cartDatapref;
  }

  @override
  void initState() {
    super.initState();
    getProductPref();
  }

  @override
  Widget build(BuildContext context) {
    // int quntity = 0;
    print(cartDatapref);
    double price =
        double.parse(widget.cartData[0].items[0].productPrice.toString());
    double productPrice = price * widget.cartData[0].counter;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          appBarTitle: Center(child: Text('Shopping Cart')),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: double.infinity,
            color: appBarColor,
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Price',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Rs. ${productPrice.toString()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Purchased Items',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.cartData.length,
              itemBuilder: (context, index) => ShoppingCard(
                productImage: MemoryImage(
                  base64Decode(
                    //cartData['image'].toString(),R
                    // cartDatapref['image'].toString(),
                    widget.cartData[0].items[0].productImage.toString(),
                  ),
                ),
                productName: widget.cartData[0].items[0].productName.toString(),
                //cartDatapref['name'],
                productPrice:
                    widget.cartData[0].items[0].productPrice.toString(),
                //cartDatapref['price'],
                addOnTap: () {
                  setState(() {
                    // widget.cartData[index].counter++;
                    // price.toString() * widget.count;
                    widget.cartData[index].counter++;
                  });
                },
                removeOnTap: () {
                  setState(() {
                    //widget.count--;
                    widget.cartData[index].counter--;
                  });
                },
                productCount: widget
                    .cartData[0].counter, //widget.cartData[index].counter,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 40,
                width: 115,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: appBarColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        prefData.removePref('prefProductData');
                        prefData.removePref('count');
                      });
                    },
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
