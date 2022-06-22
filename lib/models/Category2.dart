import 'package:equatable/equatable.dart';

class Category2 extends Equatable {
  final String name;
  final String imageUrl;

  const Category2({
    required this.name,
    required this.imageUrl
  });

  @override
  // TODO: implement props
  List<Object?> get props => [name, imageUrl];

  static List<Category2> categories = [
    const Category2(name: 'category1',
      imageUrl: 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    ),
    const Category2(name: 'category2',
      imageUrl: 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',

    ),
    const Category2(name: 'category3',
      imageUrl: 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',

    ),

  ];
}