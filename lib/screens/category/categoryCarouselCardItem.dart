import 'package:tryit_customer_app/models/Category.dart';
import 'package:flutter/material.dart';

import '../../models/Product2.dart';


class CategoryCarouselCard extends StatelessWidget {
  const CategoryCarouselCard({
    Key? key,
     this.category2,
     this.product2
  }) : super(key: key);
  final Category? category2;
  final Product2 ?product2;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(const Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(product2== null ? category2!.image : product2!.imageUrl,
                  fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(200, 0, 0, 0),
                        const Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(
                      product2 == null ? category2!.catName : '',
                      style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white)
                  ),
                ),
              ),
            ],
          )),
    );
  }
}