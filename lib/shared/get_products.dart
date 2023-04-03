import 'dart:convert';

import 'package:ecommerce_app/features/home/data/data_source/get_product_data.dart';
import 'package:ecommerce_app/features/home/data/model/product_model.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../features/product/presentation/screens/product_screen.dart';
import 'widget/product_detail.dart';
import 'widget/productshow.dart';
import '../features/home/presentation/widget/carousalslider_show.dart';
import '../features/product/presentation/screens/select_procuct_screen.dart';
import 'dart:io';

class GetProductCubit {
  List<Product> productData = [];
  Product? selectdProductData;
  getProductCubit() async {
    productData = await getProduts();
    print(productData);
    return productData;
  }

  getSelectedProductCubit({required String productId}) async {
    selectdProductData = await getSelectedProdut(productId: productId);
    print('..........................');
    print(selectdProductData);
    return selectdProductData;
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
            builder: (context) => SelectSelectProductScreen(),
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
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            selectProductId = productData[index].productId.toString();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductScreen(
                  selectProductId: selectProductId.toString(),
                ),
              ),
            );
          },
          child: ProductDetail(
            containerHeight: 150,
            containerWidth: 100,
            image: MemoryImage(
              base64Decode(
                productData[index].productImage.toString(),
              ),
            ),
            productName: productData[index].productName.toString(),
            productLocation: productData[index].productLocation.toString(),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectSelectProductScreen(),
          ),
        );
      },
    );
  }

  String? selectProductId;
  Widget seclectProduct(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: productData.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          selectProductId = productData[index].productId.toString();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductScreen(
                selectProductId: selectProductId.toString(),
              ),
            ),
          );
        },
        child: ProductDetail(
          containerHeight: 130,
          containerWidth: double.infinity,
          image: MemoryImage(
            base64Decode(productData[index].productImage.toString()),
          ),
          productName: productData[index].productName.toString(),
          productLocation: productData[index].productLocation.toString(),
        ),
      ),
    );
  }

  Widget showProductDetilCard({
    required ImageProvider image,
    required String name,
    required String price,
    required String desc,
    required Widget child,
  }) {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rs ${price}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                FavoriteButton(
                  isFavorite: false,
                  iconColor: appBarColor,
                  valueChanged: (_isFavorite) {
                    print(_isFavorite);
                  },
                ),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.all(10),
            elevation: 0,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Discription',
                  style: TextStyle(fontSize: 20),
                ),
                Divider(
                  color: Colors.black38,
                ),
                Text(
                  desc,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          Divider(thickness: 5),
          ProductShow(
            title: 'Similar Products',
            textButton: false,
            onTap: () {},
            productChild: child,
          ),
        ],
      ),
    );
  }
  //Widget
}
