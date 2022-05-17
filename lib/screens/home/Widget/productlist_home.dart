import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:tryit_customer_app/firebase_services.dart';
import 'package:tryit_customer_app/models/Product.dart';
import 'products/product_detail_screen.dart';

class ProductList extends StatelessWidget {
  final String? category;

  const ProductList({Key? key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FirestoreQueryBuilder<Product>(
        query: productQuery(category: category),
        builder: (context, snapshot, _) {
          if (snapshot.isFetching) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('error ${snapshot.error}');
          }

          return GridView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1 / 1.5,
            ),
            itemCount: snapshot.docs.length,
            itemBuilder: (context, index) {
              // if we reached the end of the currently obtained items, we try to
              // obtain more items
              if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                // Tell FirestoreQueryBuilder to try to obtain more items.
                // It is safe to call this function from within the build method.
                snapshot.fetchMore();
              }
              var productIndex = snapshot.docs[index];
              Product product = productIndex.data();
              String productId = productIndex.id;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: InkWell(
                    onTap: () {
                      print(productId);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ProductDetails(
                            productId: productId,
                            product: product,
                          );
                        },
                      ));
                    },
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        height: 80,
                        width: 80,
                        color: Colors.grey.shade200,
                        child: Column(children: [
                          SizedBox(
                              height: 60,
                              width: 80,
                              child: CachedNetworkImage(
                                imageUrl: product.imageUrls![0],
                                fit: BoxFit.cover,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            product.productName!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                            maxLines: 2,
                          )
                        ])),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
