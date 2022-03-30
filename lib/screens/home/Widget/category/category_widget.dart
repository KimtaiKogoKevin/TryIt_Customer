import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';

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
        margin: const EdgeInsets.only(top:10,right:10),
        padding: const EdgeInsets.all(10),

        color: Colors.white ,
        child:Column(
            children: [
              const SizedBox(height: 18,),
              const  Padding(
                padding: const EdgeInsets.fromLTRB(0.0,10,0,10),
                child: Align(
                  alignment:Alignment.topLeft,
                  child:Text('Browse Store Categories',
                    style:TextStyle(
                      fontWeight:FontWeight.bold,
                      letterSpacing:0.5 ,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,8),
                child:  SizedBox(
                    height:40,
                    child:Row(
                        children:[
                          Expanded(
                              child:
                              FirestoreListView<Category>(
                                scrollDirection: Axis.horizontal,
                                query: categoriesCollection,
                                itemBuilder: (context, snapshot) {
                                  Category category = snapshot.data();
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 4),
                                    child: ActionChip(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:BorderRadius.circular(4)
                                      ),
                                      backgroundColor:selectedCategory == category.catName ? Colors.blue : Colors.grey,

                                      label: Text(category.catName!, style: TextStyle(
                                          fontSize: 12,
                                          color: selectedCategory==category.catName ? Colors.white : Colors.black

                                      )),
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
                          IconButton(
                              onPressed: (){
                                //show all categories
                              },
                              icon: Icon(Icons.arrow_downward))
                        ]
                    )
                ),
              )


            ]

        )
    );
  }
}