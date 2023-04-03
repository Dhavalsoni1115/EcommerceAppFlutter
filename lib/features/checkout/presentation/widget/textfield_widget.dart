import 'package:flutter/material.dart';

Widget textField({required TextInputType keybordType,required String hintText,required Function(String) onChenge}) {
  return TextField(
    onChanged: onChenge,
    keyboardType: keybordType,
    decoration: InputDecoration(
      
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey.shade400),
    ),
  );
}
