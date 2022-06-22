import 'package:flutter/material.dart';
import 'package:tryit_customer_app/screens/home/Widget/products/productCard2.dart';

import '../../../../models/Product2.dart';

class ProductCarousel extends StatelessWidget {
  final List <Product2> products;
  const ProductCarousel({Key? key , required  this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 165,
        child: ListView.builder(
            shrinkWrap:true,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0
            ),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.only(right:5.0),
                child: ProductCard2(product:products[index]),
              );
            }),
      ),
    );
  }
}
