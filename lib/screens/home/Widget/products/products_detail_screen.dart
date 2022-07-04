import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tryit_customer_app/blocs/cart/cart_bloc.dart';
import 'package:tryit_customer_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:tryit_customer_app/models/Product2.dart';
import 'package:tryit_customer_app/screens/category/categoryCarouselCardItem.dart';
import 'package:tryit_customer_app/screens/home/Widget/custom_appBar.dart';
import 'package:tryit_customer_app/screens/home/Widget/products/ProductCarousel.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  const ProductScreen({Key? key, required this.product}) : super(key: key);

  static Route route({required Product2 product}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ProductScreen(product: product));
  }

  final Product2 product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.5,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
          items: [CategoryCarouselCard(product2: product)],
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(children: [
              Container(
                  margin: const EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Name: ${product.name}',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.black87),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Text('Price: KSH ${product.price} ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.black87)))
                      ],
                    ),
                  ))
            ])),
        ExpansionTile(
          title: Text(
            'Product Description',
            style: Theme.of(context).textTheme.headline3,
          ),
          children: [
            ListTile(
              title: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla in consectetur nisi, vel fringilla dui. Aenean gravida, risus id iaculis semper, arcu erat imperdiet tellus, nec vestibulum sapien nibh vel odio. Cras lobortis varius tortor, placerat laoreet orci rhoncus a. Proin id nulla dignissim eros commodo malesuada. Fusce in neque congue, imperdiet ipsum et, ultrices massa. Mauris sit amet interdum risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In venenatis, nisl et tempor fermentum, enim nunc semper neque, vitae euismod lorem lacus eget nunc. Aenean suscipit neque et erat semper gravida. Praesent quis nisi quis turpis ornare commodo. Curabitur mattis posuere turpis et mollis. Vivamus sed lectus sit amet eros mollis elementum. Cras in semper massa. Fusce nec ullamcorper tellus. Quisque consectetur dui vel tristique egestas.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )
          ],
        ),
        ExpansionTile(
          title: Text(
            'Delivery Details',
            style: Theme.of(context).textTheme.headline3,
          ),
          children: [
            ListTile(
              title: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla in consectetur nisi, vel fringilla dui. Aenean gravida, risus id iaculis semper, arcu erat imperdiet tellus, nec vestibulum sapien nibh vel odio. Cras lobortis varius tortor, placerat laoreet orci rhoncus a. Proin id nulla dignissim eros commodo malesuada. Fusce in neque congue, imperdiet ipsum et, ultrices massa. Mauris sit amet interdum risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In venenatis, nisl et tempor fermentum, enim nunc semper neque, vitae euismod lorem lacus eget nunc. Aenean suscipit neque et erat semper gravida. Praesent quis nisi quis turpis ornare commodo. Curabitur mattis posuere turpis et mollis. Vivamus sed lectus sit amet eros mollis elementum. Cras in semper massa. Fusce nec ullamcorper tellus. Quisque consectetur dui vel tristique egestas.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )
          ],
        )
      ]),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: Container(
          height: 70,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                )),
            BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
              if (state is WishlistLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
              return IconButton(
                  onPressed: () {
                    const snackBar = SnackBar(
                      content: Text('Added to Favourites!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    context
                        .read<WishlistBloc>()
                        .add(AddWishlistProduct(product));
                    Navigator.pushNamed(context, '/wishlist');
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ));
            }),
            BlocBuilder<CartBloc,CartState>(
              builder: (context,state) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<CartBloc>().add(AddProduct(product));
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: Text(
                    'Add To Cart',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white),
                  ),
                );
              }
            )
          ]),
        ),
      ),
    );
  }
}
