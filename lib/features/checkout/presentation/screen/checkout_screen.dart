import 'dart:ui';

import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/checkout/presentation/widget/address_listtile_widget.dart';
import 'package:ecommerce_app/features/checkout/presentation/widget/label_text_widget.dart';
import 'package:ecommerce_app/features/checkout/presentation/widget/loction_type_widget.dart';
import 'package:ecommerce_app/features/checkout/presentation/widget/textfield_widget.dart';
import 'package:flutter/material.dart';

import '../../../bottomnavigation/navigatescreen.dart';
import '../widget/payment_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

String groupValue = 'Cash';
String cash = "Cash";
String card = "Card";
String gPay = "Gpay";

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text('Checkout',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Payment Type',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                paymentType(
                  name: 'Cash',
                  value: cash,
                  groupValue: groupValue,
                  autoFocus: false,
                  onChange: (value) {
                    // print(value);
                    setState(() {
                      groupValue = value.toString();
                    });
                  },
                ),
                paymentType(
                  name: 'Gpay',
                  value: gPay,
                  groupValue: groupValue,
                  autoFocus: false,
                  onChange: (value) {
                    setState(() {
                      // print(value);
                      groupValue = value.toString();
                    });
                  },
                ),
                paymentType(
                  name: 'Card',
                  value: card,
                  groupValue: groupValue,
                  autoFocus: false,
                  onChange: (value) {
                    setState(() {
                      // print(value);
                      groupValue = value.toString();
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: labelText(label: 'Choose your shipping address:'),
            ),
            addressListTile(),
            Divider(
              thickness: 3,
              color: appBarColor,
            ),
            Center(
              child: labelText(label: 'Add New Address'),
            ),
            Card(
              // height: 280,
              // width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              // padding: EdgeInsets.only(left: 20, right: 20),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    textField(hintText: 'Label (E.g. Home,Work)'),
                    textField(hintText: 'Street Address'),
                    textField(hintText: 'ZIP Code'),
                    textField(hintText: 'Delivery Instruction(optional)'),
                    textField(hintText: 'Feedback'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: labelText(label: 'Location Type'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                locationType(
                  autoFocus: true,
                  name: 'Residential',
                  value: 'Residential',
                  groupValue: groupValue,
                  onChange: (value) {},
                ),
                locationType(
                  autoFocus: false,
                  name: 'Business',
                  value: 'Business',
                  groupValue: groupValue,
                  onChange: (value) {},
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: MaterialButton(
                    child: Text(
                      'Done',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    elevation: 2,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    color: appBarColor,
                    onPressed: () {
                      setState(() {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => AlertDialog(
                            // title: const Text('Basic dialog title'),
                            content: SizedBox(
                              height: 200,
                              width: 200,
                              //color: Colors.red,
                              child: Image(
                                image: AssetImage('assets/images/shopping.gif'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            actions: <Widget>[
                              Center(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: MaterialButton(
                                    height: 50,
                                    child: Text(
                                      'Back to Home',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    elevation: 2,
                                    shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                    color: appBarColor,
                                    onPressed: () {
                                      // Navigator.pushReplacement(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         NavigateScreen(),
                                      //   ),
                                      // );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
