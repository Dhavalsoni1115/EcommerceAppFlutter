import 'package:ecommerce_app/features/home/data/model/product_model.dart';

class Cart {
  int counter;
  List<Product> items;
  Cart({
    required this.items,
    required this.counter,
  });
}
