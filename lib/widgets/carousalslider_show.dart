import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  final List prodtct;
  final double containerHeight,sliderHeight;
  const CarouselSliderWidget({
    Key? key,
    required this.prodtct,
    required this.containerHeight,
    required this.sliderHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: containerHeight,
      margin: const EdgeInsets.only(top: 15),
      child: CarouselSlider(
        options: CarouselOptions(
          height: sliderHeight,
          autoPlay: true,
        ),
        items: prodtct.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                // padding: EdgeInsets.symmetric(vertical: ),
                margin: const EdgeInsets.only(top: 15, left: 10, bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image(
                  image: NetworkImage(i),
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
    // CarouselSlider(
    //   options: CarouselOptions(
    //     height: 200,
    //     autoPlay: true,
    //   ),
    //   items: prodtct.map((i) {
    //     return Builder(
    //       builder: (BuildContext context) {
    //         return Container(
    //           width: MediaQuery.of(context).size.width,
    //           // padding: EdgeInsets.symmetric(vertical: ),
    //           margin: const EdgeInsets.only(top: 15, left: 10, bottom: 15),
    //           decoration: BoxDecoration(
    //             color: Colors.amber,
    //             borderRadius: BorderRadius.circular(20),
    //           ),
    //           child: Image(
    //             image: NetworkImage(i),
    //             fit: BoxFit.cover,
    //           ),
    //         );
    //       },
    //     );
    //   }).toList(),
    // );
  }
}
