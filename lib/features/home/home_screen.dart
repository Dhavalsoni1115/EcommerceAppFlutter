import 'package:ecommerce_app/features/appbar/customappbar.dart';
import 'package:ecommerce_app/features/product/select_procuct_screen.dart';
import 'package:flutter/material.dart';

import '../../Model/product_model.dart';
import '../../common/widgets/carousalslider_show.dart';

import '../../common/widgets/product_detail.dart';
import '../../common/widgets/productshow.dart';
import '../../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  List<Product> productData = [
    Product(
      productImage:
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHN8ZW58MHx8MHx8&w=1000&q=80',
      productName: 'Games',
      productLocation: 'Valsad',
      productPrice: '1200',
      productDiscription: 'Beutiful Games',
    ),
    Product(
      productImage:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Product_Photography.jpg/1200px-Product_Photography.jpg',
      productName: 'Wafers',
      productLocation: 'Valsad',
      productPrice: '1500',
      productDiscription: 'Beutiful Wafers',
    ),
    Product(
      productImage:
          'https://www.foodbev.com/wp-content/gallery/food-new-releases-june-2018/Pringles-Nashville-hot-chicken.jpg',
      productName: 'IPad',
      productLocation: 'Valsad',
      productPrice: '40000',
      productDiscription: 'Beutiful Ipad',
    ),
    Product(
      productImage:
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHN8ZW58MHx8MHx8&w=1000&q=80',
      productName: 'Games',
      productLocation: 'Valsad',
      productPrice: '1200',
      productDiscription: 'Beutiful Games',
    ),
    Product(
      productImage:
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHN8ZW58MHx8MHx8&w=1000&q=80',
      productName: 'Games',
      productLocation: 'Valsad',
      productPrice: '1200',
      productDiscription: 'Beutiful Games',
    ),
  ];
  List sliderData = [
    'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHN8ZW58MHx8MHx8&w=1000&q=80',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Product_Photography.jpg/1200px-Product_Photography.jpg',
    'https://www.foodbev.com/wp-content/gallery/food-new-releases-june-2018/Pringles-Nashville-hot-chicken.jpg',
    'https://st3.depositphotos.com/1000874/13916/i/1600/depositphotos_139163196-stock-photo-set-of-food-products.jpg',
    'https://thumbs.dreamstime.com/b/many-used-modern-electronic-gadgets-use-white-floor-reuse-recycle-concept-top-view-164230611.jpg',
  ];
  List productOffer = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img20/Beauty/AugART/Beauty/COOP/750x375_ART.png',
    'https://images-eu.ssl-images-amazon.com/images/W/IMAGERENDERING_521856-T1/images/G/31/img20/Beauty/PrimeDay20/COOP/Amazon_Prime-2020_skin-care_750X375-px.jpg',
    'https://static.toiimg.com/thumb/msid-94514254,width-1070,height-580,imgsize-42846,resizemode-6,overlay-toi_sw,pt-32,y_pad-40/photo.jpg',
    'https://images.livemint.com/img/2021/02/28/600x338/Apple_Campaign_creative_1614518851819_1614518877467.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const PreferredSize(
        preferredSize:  Size.fromHeight(60),
        child: CustomAppBar(
          appBarTitle:  Expanded(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSliderWidget(
              prodtct: sliderData,
              containerHeight: 200,
              sliderHeight: 200,
            ),
            ProductShow(
              title: 'Populer now',
              textButton: false,
              productChild: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: productData.length,
                itemBuilder: (context, index) => ProductDetail(
                    containerHeight: 150,
                    containerWidth: 100,
                    productImage: productData[index].productImage,
                    productName: productData[index].productName,
                    productLocation: productData[index].productLocation),
              ),
              onTap: () {},
            ),
            CarouselSliderWidget(
              prodtct: productOffer,
              containerHeight: 150,
              sliderHeight: 150,
            ),
            ProductShow(
              title: 'Products',
              textButton: true,
              productChild: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: productData.length,
                itemBuilder: (context, index) => ProductDetail(
                  containerHeight: 150,
                  containerWidth: 100,
                  productImage: productData[index].productImage,
                  productName: productData[index].productName,
                  productLocation: productData[index].productLocation,
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SelectSelectProductScreen(productData: productData),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
