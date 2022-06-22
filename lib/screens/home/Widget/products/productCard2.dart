import 'package:flutter/material.dart';
import 'package:tryit_customer_app/models/Product2.dart';

class ProductCard2 extends StatelessWidget {
  final Product2 product;
  const ProductCard2({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: 150,
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 60,
          left: 5,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 80,
            decoration: BoxDecoration(color: Colors.black87.withAlpha(0)),
          ),
        ),
        Positioned(
          top: 90,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width / 2.5 - 10,
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
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.white)),
                        Text('\KSH ${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                  Expanded(child: IconButton(onPressed: (){}, icon: const Icon(Icons.add_circle_outline_sharp ,color: Colors.white,)))
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
