import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';

import '../../../../models/MainCategory.dart';
import '../../../../models/SubCategory.dart';

class SubCategoryWidget extends StatelessWidget {
  final String? selectedSubCat;

  const SubCategoryWidget({this.selectedSubCat, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){}, // To product screen
      child: SizedBox(
        height: 80,

        child: Column(children: <Widget>[

          Expanded(

              child: FirestoreQueryBuilder<SubCategory>(
                  query: subCategoriesCollection(subCatSelected: selectedSubCat),
                  builder: (context, snapshot, _) {
                    if (snapshot.isFetching) {
                      // print(selectedSubCat);

                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text('error ${snapshot.error}');
                    }
                    print(snapshot.docs.length);
                    if (snapshot.docs.isEmpty) {
                      print('empty');
                    }


                    return GridView.builder(
                      gridDelegate:
                       SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: snapshot.docs.isEmpty ? 1/.1 : 1 / 1.1),
                      shrinkWrap: true,
                      itemCount: snapshot.docs.length,
                      itemBuilder: (context, index) {
                        final subCat = snapshot.docs[index].data();

                        // if we reached the end of the currently obtained items, we try to
                        // obtain more items
                        if (snapshot.hasMore &&
                            index + 1 == snapshot.docs.length) {
                          // Tell FirestoreQueryBuilder to try to obtain more items.
                          // It is safe to call this function from within the build method.
                          snapshot.fetchMore();
                        }

                        return Column(children: [
                          SizedBox(
                          height: 40,
                          width: 40,
                          child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Image.network(subCat.image!)),
                        ),
                        Text(subCat.subCatName! , style: const TextStyle(fontSize: 12 ) , textAlign: TextAlign.center,)
                        ]);
                        },
                    );
                  })),
        ]),
      ),
    );
  }
}
