import 'dart:convert';

class Product {
  String? productId,
      productImage,
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
    productId = json['id'].toString();
    productImage = json['image'].toString();
    productName = json['name'].toString();
    productDiscription = json['description'].toString();
    productLocation = json['location'].toString();
    productPrice = json['price'].toString();
    productCreatedAt = json['createdAt'].toString();
    categories = json['categories'].toString();
  }

  Map<String, dynamic> toJson() => {
        'id': productId,
        'image': productImage,
        'name': productName,
        'description': productDiscription,
        'location': productLocation,
        'price': productPrice,
        'createdAt': productCreatedAt,
        'categories': categories,
      };
}
