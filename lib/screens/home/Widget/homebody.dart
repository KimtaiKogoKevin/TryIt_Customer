import 'package:flutter/material.dart';
import 'package:tryit_customer_app/screens/home/Widget/category/category_widget.dart';
import 'package:tryit_customer_app/screens/home/Widget/customAppBar2.dart';
import 'package:tryit_customer_app/screens/home/Widget/recommendations.dart';
import 'package:tryit_customer_app/screens/home/Widget/searchInput.dart';
import 'package:tryit_customer_app/screens/home/Widget/productlist_home.dart';

import '../../category/category_carousel.dart';
import 'custom_appBar.dart';
import 'newarrival.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          SearchInput(),
          NewArrivals(),
          const CategoryCarousel(),
         // const CategoryWidget(),
          RecommendedItem(),
        ],
      ),
    );
  }
}
