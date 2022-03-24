import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:tryit_customer_app/models/Category.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String title = 'Categories';
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? title : selectedCategory!,
          style: const TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
      body: Row(
        children: [
          Container(
            width: 80,
            color: Colors.grey.shade300,
            child: FirestoreListView<Category>(
              query: categoriesCollection,
              itemBuilder: (context, snapshot) {
                Category category = snapshot.data();
                return InkWell(
                  onTap: (){
                  setState(() {
                    selectedCategory = category.catName;
                  });
                  },
                  child: SizedBox(
                      height: 70,
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          SizedBox(
                              height: 30,
                              child: CachedNetworkImage(
                                imageUrl: category.image!,
                                color: Colors.grey.shade700,
                              )),
                          Text(
                            category.catName!,
                            style: TextStyle(
                                fontSize: 8,
                                color: Colors.grey.shade700
                            ),
                            textAlign: TextAlign.center,
                          )
                        ]),
                      ))),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
