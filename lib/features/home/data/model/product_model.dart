import 'dart:convert';

class Product {
  int? productId;
  String? productImage,
      productName,
      productLocation,
      productDiscription,
      productCreatedAt,
      productPrice,
      categories;

  Product({
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.productLocation,
    required this.productPrice,
    required this.productDiscription,
    required this.productCreatedAt,
    required this.categories,
  });

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['id'];
    productImage = json['image'];
    productName = json['name'];
    productDiscription = json['description'];
    productLocation = json['location'];
    productPrice = json['price'];
    productCreatedAt = json['createdAt'];
    categories = json['categories'];
  }
}
