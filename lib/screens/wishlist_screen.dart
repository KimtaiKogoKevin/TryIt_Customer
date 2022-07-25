import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/wishlist/wishlist_bloc.dart';
import '../models/Product.dart';
import 'home/Widget/customAppBar2.dart';
import 'home/Widget/custom_appBar.dart';
import 'home/Widget/products/productCard2.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';

  const WishlistScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const WishlistScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WishlistLoaded) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2.4),
                itemCount: state.wishlist.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: ProductCard2(
                      product: state.wishlist.products[index],
                      widthFactor: 1.1,
                      leftPosition: 100,
                      isWishlist: true,
                    ),
                  );
                });
          } else {
            return const Center(child: Text('Something Went Wrong'));
          }
        }));
  }
}
