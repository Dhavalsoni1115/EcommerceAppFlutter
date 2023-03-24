import 'dart:convert';

import 'package:ecommerce_app/shared/widget/product_detail.dart';
import 'package:ecommerce_app/shared/widget/productshow.dart';
import 'package:ecommerce_app/features/home/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';

import '../../../../constants.dart';
import '../../../../shared/get_products.dart';
import '../../../appbar/customappbar.dart';

class ProductScreen extends StatefulWidget {
  final String selectProductId;
  const ProductScreen({
    Key? key,
    required this.selectProductId,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final getProductCubit = GetProductCubit();
  Product? productData;
  List<Product> allproductData = [];

  getAllProductData() async {
    List<Product> allproductData1 = await getProductCubit.getProductCubit();
    setState(() {
      allproductData = allproductData1;
    });
  }

  getData() async {
    dynamic productData1 = await getProductCubit.getSelectedProductCubit(
        productId: widget.selectProductId.toString());
    setState(() {
      productData = productData1;
    });
    print(productData!);
  }

  @override
  void initState() {
    super.initState();
    print(widget.selectProductId.toString());
    getData();
    getAllProductData();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      print('/././././././././././.');
      print(productData);
      print('/././././././././././.');
    });
    return Scaffold(
      backgroundColor: backgroundColor,
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
              Icons.share,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.shopping_cart,
              size: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.more_vert,
              size: 30,
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                productData == null
                    ? getProductCubit.showProductDetilCard(
                        image: const AssetImage('assets/images/T973DText.png'),
                        name: 'null',
                        price: 'null',
                        desc: 'null',
                        child: Text('No Data'),
                      )
                    : getProductCubit.showProductDetilCard(
                        image: MemoryImage(
                          base64Decode(productData!.productImage.toString()),
                        ),
                        name: productData!.productName.toString(),
                        price: productData!.productPrice.toString(),
                        desc: productData!.productDiscription.toString(),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: allproductData.length,
                          itemBuilder: (context, index) => ProductDetail(
                              productName:
                                  allproductData[index].productName.toString(),
                              productLocation: allproductData[index]
                                  .productLocation
                                  .toString(),
                              containerHeight: 150,
                              containerWidth: 100,
                              image: MemoryImage(base64Decode(
                                  allproductData[index]
                                      .productImage
                                      .toString()))),
                        ),
                      ),
              ],
            ),
          ),
          Container(
            height: 70,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 610),
            color: appBarColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.chat,
                  size: 30,
                  color: Colors.white,
                ),
                MaterialButton(
                  color: Colors.white,
                  onPressed: () {},
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      color: appBarColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.white,
                  onPressed: () {},
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add,
                        color: appBarColor,
                      ),
                      Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: appBarColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
// Stack(
//         children: [
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 productData == null
//                     ? getProductCubit.showProductDetilCard(
//                         image: const AssetImage('assets/images/T973DText.png'),
//                         name: 'null',
//                         price: 'null',
//                         desc: 'null',
//                         child: Text('No Data'),
//                       )
//                     : getProductCubit.showProductDetilCard(
//                         image: MemoryImage(
//                           base64Decode(productData!.productImage.toString()),
//                         ),
//                         name: productData!.productName.toString(),
//                         price: productData!.productPrice.toString(),
//                         desc: productData!.productDiscription.toString(),
//                         child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: allproductData.length,
//                           itemBuilder: (context, index) => ProductDetail(
//                               productName:
//                                   allproductData[index].productName.toString(),
//                               productLocation: allproductData[index]
//                                   .productLocation
//                                   .toString(),
//                               containerHeight: 150,
//                               containerWidth: 100,
//                               image: MemoryImage(base64Decode(
//                                   allproductData[index]
//                                       .productImage
//                                       .toString()))),
//                         ),
//                       ),
//               ],
//             ),
//           ),
//         ],
//       ),
 // Container(
                      //   height: 70,
                      //   width: double.infinity,
                      //   margin: const EdgeInsets.only(top: 610),
                      //   color: appBarColor,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       const Icon(
                      //         Icons.chat,
                      //         size: 30,
                      //         color: Colors.white,
                      //       ),
                      //       MaterialButton(
                      //         color: Colors.white,
                      //         onPressed: () {},
                      //         elevation: 2,
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(10),
                      //         ),
                      //         child: Text(
                      //           'Checkout',
                      //           style: TextStyle(
                      //             color: appBarColor,
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //         ),
                      //       ),
                      //       MaterialButton(
                      //         color: Colors.white,
                      //         onPressed: () {},
                      //         elevation: 2,
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(10),
                      //         ),
                      //         child: Row(
                      //           children: const [
                      //             Icon(
                      //               Icons.add,
                      //               color: appBarColor,
                      //             ),
                      //             Text(
                      //               'Add to Cart',
                      //               style: TextStyle(
                      //                 color: appBarColor,
                      //                 fontWeight: FontWeight.bold,
                      //               ),
                      //             ),