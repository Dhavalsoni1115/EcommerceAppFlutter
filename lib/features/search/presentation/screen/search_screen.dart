import 'dart:convert';

import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/appbar/customappbar.dart';
import 'package:ecommerce_app/features/checkout/presentation/screen/checkout_screen.dart';
import 'package:ecommerce_app/features/product/presentation/screens/product_screen.dart';
import 'package:flutter/material.dart';

import '../../../../shared/get_products.dart';
import '../../../home/data/model/product_model.dart';
import 'package:search_page/search_page.dart';

class Search implements Comparable<Product> {
  final String name, category;

  const Search(this.name, this.category);

  @override
  int compareTo(Product other) => name.compareTo(other.productName.toString());
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final getdata = GetProductCubit();
  List<Product> productData = [];

  getProductData() async {
    List<Product> getproductData1 = await getdata.getProductCubit();
    setState(() {
      productData = getproductData1;
    });
  }

  @override
  void initState() {
    super.initState();
    getProductData();
    //getProduts();
  }

  @override
  Widget build(BuildContext context) {
    print('=======');
    print(productData.toString());
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          appBarTitle: Expanded(
            child: TextField(
              onTap: () {
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
                      search.productName,
                      search.categories,
                    ],
                    builder: (Product search) => ListTile(
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
                );
              },
              autofocus: true,
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
        ),
      ),
      // body: ListView.builder(
      //   itemCount: productData.length,
      //   itemBuilder: (context, index) {
      //     Product search = productData[index];
      //     return GestureDetector(
      //       onTap: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => ProductScreen(
      //                 selectProductId: search.productId.toString(),
      //               ),
      //             ));
      //       },
      //       child: ListTile(
      //         leading: Image(
      //           image: MemoryImage(
      //             base64Decode(
      //               search.productImage.toString(),
      //             ),
      //           ),
      //         ),
      //         title: Text(search.productName.toString()),
      //         subtitle: Text(search.categories.toString()),
      //       ),
      //     );
      //   },
      // ),
      // floatingActionButton: FloatingActionButton(
      //   tooltip: 'Search Product',
      //   onPressed: () => showSearch(
      //     context: context,
      //     delegate: SearchPage(
      //       onQueryUpdate: print,
      //       items: productData,
      //       searchLabel: 'Search product',
      //       suggestion: const Center(
      //         child: Text('Filter Product by name, categories'),
      //       ),
      //       failure: const Center(
      //         child: Text('No person found :('),
      //       ),
      //       filter: (Product search) => [
      //        search.productName,
      //        search.categories,
      //       ],

      //       builder: (Product search) => ListTile(
      //         title: Text(search.productName.toString()),
      //         subtitle: Text(search.categories.toString()),
      //       ),
      //     ),
      //   ),
      //   child: const Icon(Icons.search),
      // ),
      // ListView.builder(
      //   shrinkWrap: true,
      //   itemCount: productData.toSet().toList().length,
      //   itemBuilder: (context, index) => Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Container(
      //       color: Colors.white,
      //       width: double.infinity,
      //       child: ListTile(
      //         tileColor: Colors.white,
      //         leading: Container(
      //           height: 100,
      //           width: 100,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(15),
      //             image: DecorationImage(
      //               image: MemoryImage(
      //                 base64Decode(
      //                   productData[index].productImage.toString(),
      //                 ),
      //               ),
      //               fit: BoxFit.fill,
      //             ),
      //           ),
      //         ),
      //         title: Text(
      //           productData[index].productName.toString(),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
