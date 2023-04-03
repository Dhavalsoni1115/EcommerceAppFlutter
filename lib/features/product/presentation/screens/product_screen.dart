import 'dart:convert';

import 'package:ecommerce_app/features/cart/data/data_source/shared_pref.dart';
import 'package:ecommerce_app/features/cart/data/model/cart_model.dart';
import 'package:ecommerce_app/features/cart/prasentation/screens/cart_screen.dart';
import 'package:ecommerce_app/features/login/data/data_source/login_shared_prefrance.dart';
import 'package:ecommerce_app/features/register/presentation/screens/register.dart';
import 'package:ecommerce_app/features/splashscreen/splash_screen.dart';
import 'package:ecommerce_app/shared/widget/product_detail.dart';
import 'package:ecommerce_app/shared/widget/productshow.dart';
import 'package:ecommerce_app/features/home/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';

import '../../../../constants.dart';
import '../../../../shared/get_products.dart';
import '../../../appbar/customappbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    Product productData1 = await getProductCubit.getSelectedProductCubit(
        productId: widget.selectProductId.toString());
    setState(() {
      productData = productData1;
    });
    //print(productData!);
  }

  var token;
  getLoginPref() async {
    var loginpref = LoginSharedPrefrance();
    token = await loginpref.getLoginToken();
    print(token);
    return token;
  }

  var prefData = SharedPref();

  @override
  void initState() {
    super.initState();
    // print(widget.selectProductId.toString());
    getData();
    getAllProductData();
    print('data......data');
    prefData.getCounterData(prefCountData);
    getPrefCountData();
    print('Token');
    getLoginPref() ?? null;
  }

  addPrefrenceData({required List<String> cartList}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('cartList', cartList);
  }

  getPrefrenceData({required List<String> cartList}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getStringList(cartList.toString());
  }

  List<Cart> cartData = [];
  var count = 0;
  var prefCountData;
  getPrefCountData() async {
    prefCountData = await prefData.getCounterData(count);
    setState(() {
      prefCountData = prefCountData;
    });
    // print('=====productScrrenData=====');
    // print(prefCountData);
    return prefCountData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          appBarTitle: const Text('Product'),
          appBarAction: [
            const Icon(
              Icons.share,
              size: 30,
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(
                      cartData: cartData,
                      count: prefCountData,
                    ),
                  ),
                );
              },
              child: Stack(
                children: [
                  const Center(
                    child: Icon(
                      Icons.shopping_cart,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: CircleAvatar(
                      radius: 12,
                      child: Text(prefCountData.toString()),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.more_vert,
              size: 30,
            ),
            const SizedBox(
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
                          itemBuilder: (context, index) =>
                              allproductData[index].categories ==
                                      productData!.categories
                                  ? ProductDetail(
                                      productName: allproductData[index]
                                          .productName
                                          .toString(),
                                      productLocation: allproductData[index]
                                          .productLocation
                                          .toString(),
                                      containerHeight: 150,
                                      containerWidth: 100,
                                      image: MemoryImage(
                                        base64Decode(
                                          allproductData[index]
                                              .productImage
                                              .toString(),
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                        ),
                      ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
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
                    onPressed: () {
                      // var token = await loginpref.getLoginToken();
                      print(token.toString());
                      print('checkout');
                      setState(() {
                        if (token == null) {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          });
                        } else {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SplashScreen(),
                              ),
                            );
                          });
                        }
                      });
                    },
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
                    onPressed: () {
                      setState(() {
                        prefCountData++;
                        prefData.storeCounterData(prefCountData);
                        prefData.getCounterData(prefCountData);
                        prefData.storeCartData(productData!);
                        prefData.getCartData();
                        // if (cartData.isEmpty) {
                        cartData.add(
                          Cart(items: [
                            Product(
                                productId: productData!.productId,
                                productImage: productData!.productImage,
                                productName: productData!.productName,
                                productLocation: productData!.productLocation,
                                productPrice: productData!.productPrice,
                                productDiscription:
                                    productData!.productDiscription,
                                productCreatedAt: productData!.productCreatedAt,
                                categories: productData!.categories),
                          ], counter: prefCountData),
                        );
                        //  }
                        // else {
                        //   var data;
                        //   for (int i = 0; i < cartData.length; i++) {
                        //     for (int j = 0;
                        //         j <= cartData[i].items.length;
                        //         i++) {
                        //       data = cartData[i].items[j].productId.toString();
                        //       print('======Data1=======');
                        //       print(cartData[i].items[j].productId.toString());
                        //       print('=======Data2=======');
                        //     }
                        //   }
                        //   data == cartData[0].items[0].productId
                        //       ? cartData.add(
                        //           Cart(items: [
                        //             Product(
                        //                 productId: productData!.productId,
                        //                 productImage: productData!.productImage,
                        //                 productName: productData!.productName,
                        //                 productLocation:
                        //                     productData!.productLocation,
                        //                 productPrice: productData!.productPrice,
                        //                 productDiscription:
                        //                     productData!.productDiscription,
                        //                 productCreatedAt:
                        //                     productData!.productCreatedAt,
                        //                 categories: productData!.categories),
                        //           ], counter: prefCountData),
                        //         )
                        //       : null;
                        // }
                      });
                      // cartData.add(
                      //   Cart(items: [
                      //     Product(
                      //         productId: productData!.productId,
                      //         productImage: productData!.productImage,
                      //         productName: productData!.productName,
                      //         productLocation: productData!.productLocation,
                      //         productPrice: productData!.productPrice,
                      //         productDiscription:
                      //             productData!.productDiscription,
                      //         productCreatedAt: productData!.productCreatedAt,
                      //         categories: productData!.categories),
                      //   ], counter: prefCountData),
                      // );
                      print(cartData);
                    },
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
            ),
          )
        ],
      ),
    );
  }
}
