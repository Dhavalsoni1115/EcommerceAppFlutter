import 'package:flutter/material.dart';

import '../../../../constants.dart';

class CommonTextFormField extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final Function(dynamic) onChanged;
  final TextEditingController controller;
  final bool obscureText;
  const CommonTextFormField({
    Key? key,
    required this.icon,
    required this.labelText,
    required this.controller,
    required this.onChanged,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          //borderSide: const BorderSide(color: appBarColor),
          borderRadius: BorderRadius.circular(25.0),
        ),
        prefixIcon: Icon(
          icon,
          color: appBarColor,
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 18,
          fontWeight: FontWeight.w300,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
