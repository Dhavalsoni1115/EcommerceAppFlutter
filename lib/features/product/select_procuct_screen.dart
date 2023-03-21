import 'package:ecommerce_app/features/product/product_screen.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/product_detail.dart';
import '../../constants.dart';
import '../appbar/customappbar.dart';

class SelectSelectProductScreen extends StatelessWidget {
  final dynamic productData;
  const SelectSelectProductScreen({
    Key? key,
    required this.productData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Icons.notifications,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.mail,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.favorite,
              size: 30,
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: productData.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            print(productData[index]);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductScreen(
                    productImage: productData[index].productImage,
                    productName: productData[index].productName,
                    productDesc: productData[index].productDiscription,
                    productPrice: productData[index].productPrice,
                    productData: productData,
                  ),
                ));
          },
          child: ProductDetail(
              containerHeight: 125,
              containerWidth: double.infinity,
              productImage: productData[index].productImage,
              productName: productData[index].productName,
              productLocation: productData[index].productLocation),
        ),
      ),
    );
  }
}

// class GridViewData extends StatelessWidget {
//   const GridViewData({
//     Key? key,
//     required this.productData,
//   }) : super(key: key);

//   final List productData;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(5),
//       child: SizedBox(
//         width: double.infinity,
//         child: Column(
//           children: [
//             Container(
//               height: 110,
//               width: double.infinity,
//               margin: const EdgeInsets.only(left: 10, top: 5, right: 10),
//               decoration: BoxDecoration(
//                 color: Colors.grey,
//                 borderRadius: BorderRadius.circular(15),
//                 image: DecorationImage(
//                   image: NetworkImage(
//                     productData[index].productImage,
//                   ),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 5),
//               child: Text(
//                 productData[index].productName,
//                 style: const TextStyle(fontSize: 15),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 5),
//               child: Text(
//                 productData[index].productLocation,
//                 style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
