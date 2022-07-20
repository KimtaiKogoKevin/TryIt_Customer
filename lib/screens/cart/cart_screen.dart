import 'package:flutter/material.dart ';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tryit_customer_app/models/Product2.dart';

import '../../blocs/cart/cart_bloc.dart';
import '../../blocs/wishlist/wishlist_bloc.dart';
import '../../models/cart_model.dart';
import '../home/Widget/custom_appBar.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  const CartScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: Colors.white,
          child: SizedBox(
            height: 70,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 0),
                    onPressed: () {
                      Navigator.pushNamed(context, '/checkoutScreen');
                    },
                    child: Text(
                      'Go to Checkout',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.white),
                    ),
                  )
                ]),
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartLoaded) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(Cart().freeDeliveryString,
                                    style:
                                        Theme.of(context).textTheme.headline5),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/');
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Theme.of(context).primaryColor,
                                        shape: const RoundedRectangleBorder(),
                                        elevation: 0),
                                    child: Text(
                                      'Add more items',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(color: Colors.white),
                                    )),
                              )
                            ]),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                          itemCount: state.cart.productQuantity(state.cart.products).keys.length,
                          itemBuilder: (context, index) {
                            return CartProductCard(
                                product: state.cart.productQuantity(state.cart.products).keys.elementAt(index),
                                 quantity:  state.cart.productQuantity(state.cart.products).values.elementAt(index)
                            );
                          }
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Divider(thickness: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 40),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'SubTotal',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                Text(
                                  state.cart.subtotalString,
                                  style: Theme.of(context).textTheme.headline2,
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Delivery Fee',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                Text(
                                  state.cart.deliveryFeeString,
                                  style: Theme.of(context).textTheme.headline2,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width - 75,
                              height: 55,
                              decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(60))),
                          Container(
                            width: MediaQuery.of(context).size.width - 80,
                            margin: const EdgeInsets.all(5.0),
                            height: 50,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    state.cart.totalString,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          } else {
            return const Text('Something Went Wrong');
          }
        }));
  }
}

class CartProductCard extends StatelessWidget {
  const CartProductCard({Key? key, required this.product , required this.quantity}) : super(key: key);
  final Product2 product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Image.network(product.imageUrl,
              width: 100, height: 80, fit: BoxFit.cover),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  'Sh ${product.price}',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            if(state is CartLoading){
              return const Center(child: CircularProgressIndicator(),);
            }
            else if(state is CartLoaded){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          context.read<CartBloc>().add(RemoveProduct(product));
                        },
                        icon: const Icon(Icons.remove_circle_outline_sharp)),
                    Text(
                      '$quantity' ,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    IconButton(
                        onPressed: () {
                          context.read<CartBloc>().add(AddProduct(product));
                        },
                        icon: const Icon(Icons.add_circle_outline_sharp)),
                  ],
                ),
              );

            }
            else {
              return const Center(child: Text('Something Went Wrong'));
            }
          })
        ],
      ),
    );
  }
}
