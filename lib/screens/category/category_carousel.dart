import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tryit_customer_app/models/Category2.dart';

import 'categoryCarouselCardItem.dart';

class CategoryCarousel extends StatelessWidget {
  const CategoryCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Category2 category2;

    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
      aspectRatio: 1.5,
      viewportFraction: 0.9,
      enlargeCenterPage: true,
      enlargeStrategy: CenterPageEnlargeStrategy.height,
      enableInfiniteScroll: false,
        ),
        items: Category2.categories
        .map((category2) => CategoryCarouselCard(category2: category2))
        .toList(),
      ),
    );

  }
}


