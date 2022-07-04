import 'package:equatable/equatable.dart';

import 'Product2.dart';

class Cart extends Equatable {
  final List<Product2>products;
   const Cart({this.products = const <Product2>[]});

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  String get subtotalString => subtotal.toStringAsFixed(2);

  double deliveryFee(subtotal) {
    if (subtotal >= 2500.00) {
      return 0.0;
    } else {
      return 100.0;
    }
  }
  double total(subtotal , deliveryFee){
    return subtotal + deliveryFee(subtotal);
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 2500.00) {
      return 'You have free Delivery';
    } else {
      double deficit = 2500.00 - subtotal;
      return 'Add sh $deficit to get free delivery ';
    }
  }

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
   String get totalString => total(subtotal ,deliveryFee).toStringAsFixed(2);

   String get freeDeliveryString => freeDelivery(subtotal);




  @override
  // TODO: implement props
  List<Object?> get props => [products];
}
