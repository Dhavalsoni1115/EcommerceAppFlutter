import 'package:ecommerce_app/constants.dart';
import 'package:flutter/material.dart';

Widget paymentType(
    {required bool autoFocus,
    required String name,
    required String value,
    required String groupValue,
    required Function(dynamic) onChange}) {
  return Container(
    height: 40,
    width: 100,
    margin: EdgeInsets.only(top: 5, bottom: 5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
    ),
    child: Row(
      children: [
        Radio(
          autofocus: autoFocus,
          value: value,
          groupValue: groupValue,
          onChanged: onChange,
          fillColor: MaterialStateColor.resolveWith((states) => appBarColor),
        ),
        Text(
          name,
          style: TextStyle(fontSize: 15),
        ),
      ],
    ),
  );
}
