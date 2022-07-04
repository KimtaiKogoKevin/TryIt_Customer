import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tryit_customer_app/blocs/cart/cart_bloc.dart';
import 'package:tryit_customer_app/models/Product2.dart';

class ProductCard2 extends StatelessWidget {
  final Product2 product;
  final double leftPosition;
  final double widthFactor;
 final  bool isWishlist;

  const ProductCard2({
    Key? key,
    required this.product,
     this.isWishlist = false,
    this.leftPosition = 5,
    this.widthFactor = 2.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery
        .of(context)
        .size
        .width / widthFactor;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(children: [
        Container(
          width: widthValue,
          height: 150,
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 60,
          left: leftPosition,
          child: Container(
            width: widthValue - 10,
            height: 80,
            decoration: BoxDecoration(color: Colors.black87.withAlpha(0)),
          ),
        ),
        Positioned(
          top: 90,
          left: leftPosition + 5,
          child: Container(
            width: widthValue - 20 - leftPosition,
            height: 80,
            decoration: BoxDecoration(color: Colors.black.withAlpha(100)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(product.name,
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.white)),
                        Text('\KSH ${product.price}',
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context , state){

                      if(state is CartLoading){
                        return const Center(
                          child:CircularProgressIndicator(),
                        );
                      } else if (state is CartLoaded){
                        return  Expanded(
                            child: IconButton(
                                onPressed: () {
                                  context.read<CartBloc>()
                       .add(AddProduct(product));
                        },
                                icon: const Icon(
                                  Icons.add_circle_outline_sharp,
                                  color: Colors.white,
                                )));
                      } else
                        return Text('Something Wrong Occured');
    } ,


                  ),




                  isWishlist ? Expanded(
                      child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                      Icons.delete_outline_outlined,
                      color: Colors.white,
                      )))


                   : SizedBox()

                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
