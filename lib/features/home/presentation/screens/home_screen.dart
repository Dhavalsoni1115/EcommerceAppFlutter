import 'dart:convert';

import 'package:ecommerce_app/features/appbar/customappbar.dart';
import 'package:ecommerce_app/features/product/presentation/screens/product_screen.dart';
import 'package:ecommerce_app/features/search/presentation/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import '../../../../constants.dart';

import '../../../../shared/get_products.dart';
import '../../data/data_source/get_product_data.dart';
import '../../data/model/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final getdata = GetProductCubit();
  List<Product> productData = [];

  getData() async {
    List<Product> productData1 = await getdata.getProductCubit();
    setState(() {
      productData = productData1;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    //getProduts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          appBarTitle: Expanded(
            child: TextField(
              onTap: () {
                setState(() {
                  showSearch(
                    context: context,
                    delegate: SearchPage(
                      onQueryUpdate: print,
                      items: productData,
                      searchLabel: 'Search product',
                      suggestion: const Center(
                        child: Text('Filter Product by name, categories'),
                      ),
                      failure: const Center(
                        child: Text('No Product found :('),
                      ),
                      filter: (Product search) => [
                        search.productName.toString(),
                        search.categories.toString(),
                      ],
                      builder: (Product search) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductScreen(
                                selectProductId: search.productId.toString(),
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: Image(
                            image: MemoryImage(
                              base64Decode(
                                search.productImage.toString(),
                              ),
                            ),
                          ),
                          title: Text(search.productName.toString()),
                          subtitle: Text(search.categories.toString()),
                        ),
                      ),
                    ),
                  );
                });
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.grey,
                hintText: 'Search Product',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          appBarAction: const [
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            getdata.showProductImageSlider(
                containerHeight: 200, sliderHeight: 200),
            getdata.showPopulerProduct(context),
            getdata.showProductImageSlider(
                containerHeight: 150, sliderHeight: 200),
            getdata.showAllProduct(context),
          ],
        ),
      ),
    );
  }
}
