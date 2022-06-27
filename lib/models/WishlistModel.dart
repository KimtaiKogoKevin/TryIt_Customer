import 'package:equatable/equatable.dart';

import 'Product2.dart';

class WishList extends Equatable {

  final List <Product2> products;
  const WishList({
    this.products = const <Product2>[]
});
  @override
  // TODO: implement props
  List<Object?> get props => [products];

}