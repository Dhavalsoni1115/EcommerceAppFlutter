import 'package:ecommerce_app/Widgets/product_detail.dart';
import 'package:flutter/material.dart';

class ProductShow extends StatelessWidget {
  final String title;
  final bool textButton;
  final Widget productChild;
  final VoidCallback onTap;
  const ProductShow({
    Key? key,
    required this.title,
    required this.textButton,
    required this.onTap,
    required this.productChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 250,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(title),
              ),
              textButton == true
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: onTap,
                        child: const Text(
                          'See all',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    )
                  : const Text(''),
            ],
          ),
          Expanded(
            child: productChild,
            //     ListView.builder(
            //   shrinkWrap: true,
            //   scrollDirection: Axis.horizontal,
            //   itemCount: productList.length,
            //   itemBuilder: (context, index) =>
            //    ProductDetail(productImage: productList[], productName: productName, productLocation: productLocation),
            // ),
          ),
        ],
      ),
    );
  }
}
