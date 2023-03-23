import 'dart:convert';

import 'package:ecommerce_app/features/product/presentation/screens/product_screen.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widget/product_detail.dart';
import '../../../../constants.dart';
import '../../../../shared/get_products.dart';
import '../../../appbar/customappbar.dart';
import '../../../home/data/model/product_model.dart';

class SelectSelectProductScreen extends StatefulWidget {
  final List<Product> productData;
  const SelectSelectProductScreen({
    Key? key,
    required this.productData,
  }) : super(key: key);

  @override
  State<SelectSelectProductScreen> createState() =>
      _SelectSelectProductScreenState();
}

class _SelectSelectProductScreenState extends State<SelectSelectProductScreen> {
  // final getProductCubit = GetProductCubit();
  // List<Product> productData = [];

  // getData() async {
  //   List<Product> productData1 = await getProductCubit.getProductCubit();
  //   setState(() {
  //     productData = productData1;
  //   });
  //   print(productData);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
          appBarTitle: Expanded(
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.grey,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
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
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: widget.productData.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            //print(productData[index]);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductScreen(
                    productId: widget.productData[index].productId,
                    productImage: widget.productData[index].productImage,
                    productName: widget.productData[index].productName,
                    productDesc: widget.productData[index].productDiscription,
                    productPrice: widget.productData[index].productPrice,
                    productCategories: widget.productData[index].categories,
                    productData: widget.productData,
                  ),
                ));
          },
          child: ProductDetail(
            containerHeight: 130,
            containerWidth: double.infinity,
            image: MemoryImage(
              base64Decode(
                widget.productData[index].productImage.toString(),
              ),
            ),
            productName: widget.productData[index].productName.toString(),
            productLocation:
                widget.productData[index].productLocation.toString(),
          ),
        ),
      ),
    );
  }
}
