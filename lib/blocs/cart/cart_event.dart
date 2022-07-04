part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {
  @override
  List<Object> get props => [];
}

class AddProduct extends CartEvent {
  final Product2 product;

  const AddProduct(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProduct extends CartEvent {
  final Product2 product;

  const RemoveProduct(this.product);

  @override
  List<Object> get props => [product];
}
