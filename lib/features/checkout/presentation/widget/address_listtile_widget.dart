import 'package:flutter/material.dart';

import '../../../../constants.dart';

Widget addressListTile() {
  return ListTile(
    tileColor: Colors.white,
    leading: Radio(
      value: 'address',
      groupValue: 'address',
      fillColor: MaterialStateColor.resolveWith((states) => appBarColor),
      onChanged: (value) {},
    ),
    title: Text('Home Address'),
    subtitle: Text('ksdfbskjdbvksjbfdv'),
  );
}
