import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:tryit_customer_app/models/MainCategoryDepracated.dart';
import 'package:tryit_customer_app/models/SubCategoryDeprecated.dart';
import 'package:tryit_customer_app/screens/home/Widget/category/sub_category_widget.dart';

import '../../../../models/MainCategory.dart';

class MainCategoryWidget extends StatefulWidget {
   final String? selectedCat;

  const MainCategoryWidget({required this.selectedCat,Key? key}) : super(key: key);

  @override
  State<MainCategoryWidget> createState() => _MainCategoryWidgetState();
}

class _MainCategoryWidgetState extends State<MainCategoryWidget> {
  //  final List<String> _categoryLabel = <String> [
  //   'Home Furniture',
  //   'Office Furniture',
  //   'Kitchen Appliances',
  //   'Make up and watches'
  // ];
  // int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: FirestoreListView<MainCategoryDeprecated>(
            query: mainCategoriesCollection(widget.selectedCat),
            itemBuilder: (context, snapshot) {
              MainCategoryDeprecated mainCategory = snapshot.data();
              return ExpansionTile(
                  title: Text(mainCategory.mainCategory!) ,
                  children: [SubCategoryWidget(selectedSubCat: mainCategory.mainCategory)]


              );
            },
          ));
  }
}
