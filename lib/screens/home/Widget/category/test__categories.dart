import 'package:flutter/material.dart';
import 'package:tryit_customer_app/models/Category.dart';
import 'package:tryit_customer_app/screens/home/Widget/category/category_item.dart';
import 'package:tryit_customer_app/screens/home/Widget/sectionList.dart';

import '../../../../firebase_services.dart';

class Categories extends StatelessWidget {
  final FirebaseService _service = FirebaseService();

  //final categoryList = Category.generateCategory();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SectionList('Category'),
          Container(
            height: 200,
            // child: ListView.separated(
            //     padding: const EdgeInsets.symmetric(horizontal: 25),
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) =>
            //         CategoryItem(categoryList[index]),
            //     separatorBuilder: (_, index) => const SizedBox(
            //       width: 10,
            //     ),
            //     itemCount: categoryList.length),
          )
        ],
      ),
    );
  }
}
