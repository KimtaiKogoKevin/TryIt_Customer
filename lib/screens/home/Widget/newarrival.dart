import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tryit_customer_app/screens/home/Widget/productItem.dart';

import '../../../models/Product.dart';
import 'sectionList.dart';

class NewArrivals extends StatelessWidget {
  // final productList = Product.generateProduct();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SectionList('New Arrivals'),
          // Container(
          //   height: 280,
          //   child: ListView.separated(
          //     padding: const EdgeInsets.symmetric(horizontal: 25),
          //     scrollDirection: Axis.horizontal,
          //       itemBuilder: (context, index) =>
          //           ProductItem(productList[index]),
          //       separatorBuilder: (_, index) => const SizedBox(
          //             width: 10,
          //           ),
          //       itemCount: productList.length),
          // )
        ],
      ),
    );
  }
}
