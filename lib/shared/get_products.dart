import 'dart:convert';

import 'package:ecommerce_app/features/home/data/data_source/get_product_data.dart';
import 'package:ecommerce_app/features/home/data/model/product_model.dart';
import 'package:flutter/material.dart';

import 'widget/product_detail.dart';
import 'widget/productshow.dart';
import '../features/home/presentation/widget/carousalslider_show.dart';
import '../features/product/presentation/screens/select_procuct_screen.dart';

class GetProductCubit {
  List<Product> productData = [];
  getProductCubit() async {
    productData = await getProduts();
    print('======');
    print(productData);
    return productData;
  }

  Widget showProductImageSlider(
      {required double containerHeight, required double sliderHeight}) {
    return CarouselSliderWidget(
      containerHeight: containerHeight,
      sliderHeight: sliderHeight,
      items: [
        for (var i = 0; i < productData.length; i++)
          Container(
            height: 200,
            width: 180,
            margin:
                const EdgeInsets.only(top: 5, left: 10, bottom: 5, right: 10),
            decoration: BoxDecoration(
              // color: Colors.amber,
              image: DecorationImage(
                  image: MemoryImage(
                      base64Decode(productData[i].productImage.toString())),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
      ],
    );
  }

  Widget showPopulerProduct(BuildContext context) {
    return ProductShow(
      title: 'Populr Products',
      textButton: false,
      productChild: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: productData.length,
        itemBuilder: (context, index) => ProductDetail(
          containerHeight: 150,
          containerWidth: 100,
          image: MemoryImage(
              base64Decode(productData[index].productImage.toString())),
          productName: productData[index].productName.toString(),
          productLocation: productData[index].productLocation.toString(),
        ),
      ),
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SelectSelectProductScreen(
              productData: productData,
            ),
          ),
        );
      },
    );
  }

  Widget showAllProduct(BuildContext context) {
    return ProductShow(
      title: 'All Products',
      textButton: true,
      productChild: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: productData.length,
        itemBuilder: (context, index) => ProductDetail(
          containerHeight: 150,
          containerWidth: 100,
          image: MemoryImage(
              base64Decode(productData[index].productImage.toString())),
          productName: productData[index].productName.toString(),
          productLocation: productData[index].productLocation.toString(),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectSelectProductScreen(
              productData: productData,
            ),
          ),
        );
      },
    );
  }

  //Widget
}
