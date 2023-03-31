import 'dart:convert';

import 'package:ecommerce_app/features/cart/data/model/cart_model.dart';
import 'package:ecommerce_app/features/home/data/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  storeCartData(Product prefProductData) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // Cart storeProduct = cartPrefData;
    final String encodeData = jsonEncode(prefProductData);

    var productDataPref = await pref.setString('prefProductData', encodeData);
    // print('=======Pref======');
    // print(productDataPref);
    return productDataPref;
  }

  getCartData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    final String productDataString = pref.getString('prefProductData')!;

    var cart = jsonDecode(productDataString);

    return cart;
  }

  void storeCounterData(int count) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int countData = count;
    pref.setInt('count', countData);
  }

  getCounterData(var count) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // print('====Count====');
    // print(pref.getInt('count'));
    count = pref.getInt('count') ?? 0;
    return count;
  }

  removePref(String keyName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(keyName);
  }
}
