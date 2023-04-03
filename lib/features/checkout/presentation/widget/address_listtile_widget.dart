import 'package:flutter/material.dart';

import '../../../../constants.dart';

Widget addressListTile(
    {required String addressTitle,
    required String addressSubTitle,
    required Function(dynamic) onChange,
    required String addressValue,
    required String addressGroupValue}) {
  return ListTile(
    tileColor: Colors.white,
    leading: Radio(
      autofocus: false,
      value: addressValue,
      groupValue: addressGroupValue,
      fillColor: MaterialStateColor.resolveWith((states) => appBarColor),
      onChanged: onChange,
    ),
    title: Text(addressTitle),
    subtitle: Text(addressSubTitle),
  );
}
