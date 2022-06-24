import 'package:flutter/material.dart';

import '../models/Product2.dart';
import 'home/Widget/custom_appBar.dart';
import 'home/Widget/products/productCard2.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  const WishlistScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => WishlistScreen());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.15),
            itemCount: Product2.products.length,
            itemBuilder: (BuildContext context , int index ){
              return Center(
                child:ProductCard2(product: Product2.products[index],
                  
                )
              );
            }));
  }
}
