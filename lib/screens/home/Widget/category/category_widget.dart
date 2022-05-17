import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:tryit_customer_app/screens/home/home.dart';

import '../productlist_home.dart';
import '/models/Category.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  //  final List<String> _categoryLabel = <String> [
  //   'Home Furniture',
  //   'Office Furniture',
  //   'Kitchen Appliances',
  //   'Make up and watches'
  // ];
  // int _index = 0;
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0.0, 1, 0, 1),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'View By Categories',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: SizedBox(
                height: 60,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: FirestoreListView<Category>(
                        scrollDirection: Axis.horizontal,
                        query: categoriesCollection,
                        itemBuilder: (context, snapshot) {
                          Category category = snapshot.data();
                          return Padding(
                            padding: const EdgeInsets.only(right: 1.5),
                            child: ActionChip(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              backgroundColor:
                                  selectedCategory == category.catName
                                      ? Colors.grey
                                      : Theme.of(context).colorScheme.primary,
                              label: Text(category.catName!,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          selectedCategory == category.catName
                                              ? Colors.black
                                              : Colors.grey.shade50)),
                              onPressed: () {
                                //print(category.catName);
                                setState(() {
                                  //_index = index;
                                  selectedCategory = category.catName;
                                });
                              },
                            ),
                          );
                        },
                      )
                          // ListView.builder(
                          //   scrollDirection: Axis.horizontal,
                          //
                          //   itemCount:_categoryLabel.length,
                          //   itemBuilder:(BuildContext context , int index){
                          //     return Padding(
                          //       padding: const EdgeInsets.only(right: 4),
                          //       child: ActionChip(
                          //         padding: EdgeInsets.zero,
                          //         shape: RoundedRectangleBorder(
                          //             borderRadius:BorderRadius.circular(4)
                          //         ),
                          //         backgroundColor:_index==index ? Colors.indigoAccent : Colors.black26 ,
                          //         onPressed: () {
                          //           setState(() {
                          //             _index = index;
                          //           });
                          //         },
                          //         label: Text(_categoryLabel[index], style: TextStyle(
                          //             fontSize: 12,
                          //             color: _index == index ?  Colors.white : Colors.black
                          //
                          //         )),
                          //
                          //       ),
                          //     );
                          //   },),
                          ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(color: Colors.grey.shade400))),
                        child: IconButton(
                            onPressed: () {
                              //show all categories
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const HomeScreen(
                                    index: 1,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.arrow_downward)),
                      )
                    ])),
          ),
          //Product List
          ProductList(category: selectedCategory,)

        ]));
  }
}
