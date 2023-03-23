import 'package:flutter/material.dart';

import '../../../../constants.dart';

class ShoppingCard extends StatelessWidget {
  final String productImage, productName, productPrice;
  final VoidCallback addOnTap, removeOnTap;
  final int productCount;
  const ShoppingCard({
    Key? key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.addOnTap,
    required this.removeOnTap,
    required this.productCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              height: 90,
              width: 90,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    productImage,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Rs $productPrice',
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.clear,
                    size: 25,
                    // color: appBarColor,
                  ),
                ),
                Container(
                  height: 40,
                  width: 115,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: appBarColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: removeOnTap,
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Text(
                        productCount.toString(),
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: addOnTap,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
