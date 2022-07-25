import 'dart:convert';
import 'dart:ffi';

import 'package:get/get.dart';

import '../firebase_services.dart';
import 'ProductDepracated.dart';

class CartController extends GetxController {
  // Add a dict to store the products in the cart
 // final RxMap _products={}.obs;
  final _products = {}.obs;

  FirebaseService service = FirebaseService();

  //add product to cart
  void addProduct(ProductDepracated product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
      print(_products);
    } else {
      _products[product] = 1;
    }
    Get.snackbar(
        "Product Added", "${product.productName} has been added to your basket",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2));
  }

  //remove Product
  void removeProduct(ProductDepracated product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
      Get.snackbar("No Items in Basket!", "Shopping Cart is Empty",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 2));
    } else {
      _products[product] -= 1;

      Get.snackbar("Product removed",
          "${product.productName} has been added to your basket",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }
  }

//product getter

  get products => _products;

  //subtotal
  get productSubTotal => _products.entries
      .map((product) => product.key.discountPrice * product.value)
      .toList();

//total getter

  get total => _products.entries
      .map((product) => product.key.discountPrice * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);


}
