import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tryit_customer_app/firebase_services.dart';
import 'package:tryit_customer_app/models/Product.dart';
import '../../../models/CartController.dart';
import '../../../models/ProductController.dart';
import 'products/product_detail_screen.dart';

class ProductList extends StatelessWidget {
  final String? category;

   ProductList({Key? key, this.category}) : super(key: key);

  final productController = Get.put(ProductController());

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
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1.5,
                ),
               itemCount: snapshot.docs.length,
              // itemCount: productController.products.length,

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
                  return CatalogProductcard(productId: productId, product: product,index: index);
                },

            );
          },
        ),

    );
  }
}

class CatalogProductcard extends StatelessWidget {
  const CatalogProductcard({
    Key? key,
    required this.productId,
    required this.product,
    required this.index,
  }) : super(key: key);

  final String productId;
  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    final ProductController productController = Get.find();
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: InkWell(
        onTap: () {
         // print(productId);
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context ) {
              return ProductDetails(
                index: index,
                productId: productId,
                product: product,
              );
            },
          ));
        },
        child: Container(
            padding: const EdgeInsets.all(8),
            height: 100,
            width: 100,
            color: Colors.grey.shade100,
            child: Column(children: [
              SizedBox(
                  height: 60,
                  width: 80,
                  child: CachedNetworkImage(
                    imageUrl: productController.products[index].imageUrls![0],
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
               // product.productName!,
                productController.products[index].productName!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
                maxLines: 2,
               ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    cartController.addProduct(productController.products[index]);
                  },
                  child: const Icon(Icons.shopping_cart),
                  style: ButtonStyle(

                      backgroundColor: MaterialStateProperty.all(Colors.blue)),
                ),
              )

            ])),
      ),
    ),
                );
  }
}
