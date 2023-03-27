import 'package:ecommerce_app/features/appbar/customappbar.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';

import '../../../../shared/get_products.dart';
import '../../data/model/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final getProductCubit = GetProductCubit();
  List<Product> productData = [];

  getData() async {
    List<Product> productData = await getProductCubit.getProductCubit();
    setState(() {
      productData = productData;
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
            child: const TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.grey,
                hintText: 'Search',
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
            getProductCubit.showProductImageSlider(
                containerHeight: 200, sliderHeight: 200),
            getProductCubit.showPopulerProduct(context),
            getProductCubit.showProductImageSlider(
                containerHeight: 150, sliderHeight: 200),
            getProductCubit.showAllProduct(context),
          ],
        ),
      ),
    );
  }
}
