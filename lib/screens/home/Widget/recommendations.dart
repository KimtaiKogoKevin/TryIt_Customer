import 'package:flutter/material.dart';
import 'package:tryit_customer_app/models/RecommendedProduct.dart';
import 'package:tryit_customer_app/screens/home/Widget/Rproductitem.dart';
import 'package:tryit_customer_app/screens/home/Widget/sectionList.dart';

class RecommendedItem extends StatelessWidget {
  final recommendedList = RecommendedProduct.generateRecommendedProduct();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
    SectionList('Recommendations'),
      SizedBox(
    height: 400,
    child: ListView.separated(
        padding: const EdgeInsets.only(left: 0),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) =>
            RproductItem(recommendedList[index]),
        separatorBuilder: (_, index) => const SizedBox(
          width: 10,
        ),
        itemCount: recommendedList.length),
      )
      ],
    );
  }
}
