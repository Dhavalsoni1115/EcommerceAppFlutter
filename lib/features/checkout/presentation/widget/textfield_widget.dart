import 'package:flutter/material.dart';

Widget textField({required String hintText}) {
  return TextField(
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey.shade400),
    ),
  );
}
