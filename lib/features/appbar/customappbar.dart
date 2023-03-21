import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomAppBar extends StatelessWidget {
  final dynamic appBarAction, appBarTitle;
  const CustomAppBar({Key? key, this.appBarTitle, this.appBarAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBarColor,
      title: appBarTitle,
      actions: appBarAction,
    );
  }
}
