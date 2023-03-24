import 'dart:convert';

import 'package:ecommerce_app/features/product/presentation/screens/product_screen.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widget/product_detail.dart';
import '../../../../constants.dart';
import '../../../../shared/get_products.dart';
import '../../../appbar/customappbar.dart';
import '../../../home/data/model/product_model.dart';

class SelectSelectProductScreen extends StatefulWidget {
  const SelectSelectProductScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectSelectProductScreen> createState() =>
      _SelectSelectProductScreenState();
}

class _SelectSelectProductScreenState extends State<SelectSelectProductScreen> {
  final getProductCubit = GetProductCubit();
  List<Product> productData = [];

  getData() async {
    List<Product> productData1 = await getProductCubit.getProductCubit();
    setState(() {
      productData = productData1;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          appBarTitle: Text('All Products'),
          appBarAction: [
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
      ),
      body: getProductCubit.seclectProduct(context),

    );
  }
}
