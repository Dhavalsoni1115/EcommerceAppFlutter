import 'package:ecommerce_app/common/widgets/product_detail.dart';
import 'package:ecommerce_app/common/widgets/productshow.dart';
import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';

import '../../constants.dart';
import '../appbar/customappbar.dart';

class ProductScreen extends StatefulWidget {
  final dynamic productName, productImage, productDesc, productPrice;
  //   productName: productName,
  final dynamic productData;
  const ProductScreen({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.productDesc,
    required this.productPrice,
    required this.productData,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const PreferredSize(
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
                Container(
                  height: 480,
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(widget.productImage.toString()),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text(
                        widget.productName.toString(),
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
                              'Rs ${widget.productPrice}',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            FavoriteButton(
                              isFavorite: false,
                              iconColor: appBarColor,
                              //iconSize: 30,

                              // iconDisabledColor: Colors.white,
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
                              widget.productDesc.toString(),
                              // 'bhjkxfhjkvxbhjfvbhjxcbhjvbhxcvbhxbncvbhjxcvhbjbdvshdcvbshdbhbhDBchjkdvcghjSDCGHSDCVCHDHCBSH,DCBH,JDBCBH,DCH,ZDCHDCHJSADHCASHJDCVBSDHBVCHBVCXDBVCXHJBVDBBJXHDCVBXJHVBDCXBHJDVCBXHJ',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 13, color: Colors.grey.shade500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ProductShow(
                  title: 'Similiar product',
                  textButton: false,
                  onTap: () {},
                  productChild: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.productData.length,
                    itemBuilder: (context, index) => ProductDetail(
                      productImage: widget.productData[index].productImage,
                      productName: widget.productData[index].productName,
                      productLocation:
                          widget.productData[index].productLocation,
                      containerHeight: 150,
                      containerWidth: 100,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
