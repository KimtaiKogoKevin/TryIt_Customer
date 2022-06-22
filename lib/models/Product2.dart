import 'package:equatable/equatable.dart';

class Product2 extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product2({
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [name, category, imageUrl, price, isPopular, isRecommended];

  static List<Product2> products = [
    const Product2(
        name: 'product1',
        category: 'category1',
        price: 3.00,
        imageUrl:'https://images.unsplash.com/photo-1540574163026-643ea20ade25?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        isRecommended: true,
        isPopular: false),
    const Product2(
        name: 'product2',
        category: 'category2',
        price: 3.00,
        imageUrl: 'https://images.unsplash.com/photo-1551298370-9d3d53740c72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        isRecommended: true,
        isPopular: false),
    const Product2(
        name: 'product3',
        category: 'category3',
        price: 3.00,
        imageUrl:
            'https://images.unsplash.com/photo-1551298370-9d3d53740c72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        isRecommended: true,
        isPopular: false),
    const Product2(
        name: 'product4',
        category: 'category4',
        price: 3.00,
        imageUrl:
            'https://images.unsplash.com/photo-1551298370-9d3d53740c72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        isRecommended: false,
        isPopular: true),
    const Product2(
        name: 'product5',
        category: 'category5',
        price: 3.00,
        imageUrl:
            'https://images.unsplash.com/photo-1551298370-9d3d53740c72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        isRecommended: false,
        isPopular: true),
    const Product2(
        name: 'product5',
        category: 'category5',
        price: 3.00,
        imageUrl:
        'https://images.unsplash.com/photo-1551298370-9d3d53740c72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        isRecommended: false,
        isPopular: true), const Product2(
        name: 'product5',
        category: 'category5',
        price: 3.00,
        imageUrl:
        'https://images.unsplash.com/photo-1551298370-9d3d53740c72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        isRecommended: false,
        isPopular: true), const Product2(
        name: 'product5',
        category: 'category5',
        price: 3.00,
        imageUrl:
        'https://images.unsplash.com/photo-1551298370-9d3d53740c72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        isRecommended: false,
        isPopular: true),
  ];
}
