import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../model/product_model.dart';

dynamic getProduts() async {
  final String url = 'http://192.168.1.7:3000/product';
  final response = await http.get(
    Uri.parse(url),
  );
  if (response.statusCode == 200) {
     print(response.body);
    // final List parsedList = json.decode(response.body);
    List<dynamic> parsed = jsonDecode(response.body);
    // print(parsed);
    // List<dynamic> respon = jsonDecode(response.body);
    List<Product> tagOwnerList =
        parsed.map((i) => Product.fromJson(i as Map<String, dynamic>)).toList();
    // print('aassssss');
    // print(tagOwnerList);
    // print(tagOwnerList[7].productPrice);
    return tagOwnerList;
    // return Product.fromJson(
    //   jsonDecode(parsed),
    // );
  } else {
    throw Exception('Failed to load products');
  }
}

// void _getImageBase64() async {
//   final String url = 'http://192.168.1.5:3000/product';
//   http.Response response = await http.get(Uri.parse(url));
//   List<dynamic> parsed = jsonDecode(response.body);
//     // print(parsed);
//     // List<dynamic> respon = jsonDecode(response.body);
//     List<Product> imageList =
//         parsed.map((i) => Product.fromJson(i as Map<String, dynamic>)).toList();
//   var _base64 = base64Encode();
//   print(_base64);
// }
