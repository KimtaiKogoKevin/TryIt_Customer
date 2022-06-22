import 'package:flutter/material.dart';
import 'package:tryit_customer_app/models/RecommendedProduct.dart';
import 'package:tryit_customer_app/screens/home/Widget/Rproductitem.dart';
import 'package:tryit_customer_app/screens/home/Widget/products/ProductCarousel.dart';
import 'package:tryit_customer_app/screens/home/Widget/products/productCard2.dart';
import 'package:tryit_customer_app/screens/home/Widget/sectionList.dart';
import 'package:tryit_customer_app/screens/home/Widget/sectionTitle.dart';
import 'package:tryit_customer_app/models/Product2.dart';

class RecommendedItem extends StatelessWidget {
  //final recommendedList = RecommendedProduct.generateRecommendedProduct();
  const RecommendedItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(title: 'Recommended'),
        ProductCarousel(
            products: Product2.products
                .where((product) => product.isRecommended)
                .toList()),
        const SectionTitle(title: 'Popular'),
        ProductCarousel(
            products: Product2.products
                .where((product) => product.isPopular)
                .toList())
      ],
    );
  }
}
