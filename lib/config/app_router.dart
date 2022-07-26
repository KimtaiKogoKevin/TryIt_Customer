 import 'package:flutter/material.dart';
import 'package:tryit_customer_app/screens/home/Widget/products/products_detail_screen.dart';
import 'package:tryit_customer_app/screens/home/home.dart';
import 'package:tryit_customer_app/screens/wishlist_screen.dart';

import '../Authentication/Login.dart';
import '../models/Product.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/home/Widget/cart/Checkout.dart';


class AppRouter {

  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route:${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case LoginPage.routeName:
        return LoginPage.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(appBar: AppBar(title: const Text('Error'))));
  }
}
