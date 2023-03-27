import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/product_model.dart';

getProduts() async {
  try {
    String url = 'http://192.168.1.7:3000/product';
    var response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      List<dynamic> productData = jsonDecode(response.body);
      List<Product> productList = productData
          .map((i) => Product.fromJson(i as Map<String, dynamic>))
          .toList();
      print(productList);
      return productList;
    } else {
      throw Exception('Failed to load products');
    }
  } catch (e) {
    print(e);
  }
}

dynamic getSelectedProdut({required String productId}) async {
  final String url = 'http://192.168.1.7:3000/product/$productId';
  final response = await http.get(
    Uri.parse(url),
  );
  if (response.statusCode == 200) {
    //print(response.body);

    var productData = jsonDecode(response.body);
    print('0000000000');
    print(productData);
    Product selectProductList = Product.fromJson(productData);

    return selectProductList;
  } else {
    throw Exception('Failed to load products');
  }
}
