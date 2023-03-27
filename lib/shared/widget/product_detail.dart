import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final String productName, productLocation;
  final double containerHeight, containerWidth;
  final ImageProvider image;

  const ProductDetail({
    Key? key,
    required this.productName,
    required this.productLocation,
    required this.containerHeight,
    required this.containerWidth,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: containerHeight,
          width: containerWidth,
          margin: const EdgeInsets.only(left: 10, top: 5, right: 10),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 5),
          child: Text(
            productName,
            style: const TextStyle(fontSize: 12),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 2),
          child: Text(
            productLocation,
            style: TextStyle(fontSize: 10, color: Colors.grey.shade700),
          ),
        ),
      ],
    );
  }
}
