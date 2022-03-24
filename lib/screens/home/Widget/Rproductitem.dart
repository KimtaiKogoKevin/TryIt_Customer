import 'package:flutter/material.dart';
import 'package:tryit_customer_app/models/RecommendedProduct.dart';

class RproductItem extends StatelessWidget {

  final RecommendedProduct recommendedProduct;
  RproductItem(this.recommendedProduct);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left:8),
      child:  Card(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          recommendedProduct.imageUrl,
                          width: 100,
                        )),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                         Text(recommendedProduct.title ,style:const TextStyle(fontWeight: FontWeight.bold,height: 1.5)) ,
                         Text(recommendedProduct.subtitle ,style:const TextStyle(fontWeight: FontWeight.bold,height: 1.5)),
                        Text(recommendedProduct.price,style:TextStyle(fontWeight: FontWeight.bold,height: 1.5 ,color: Theme.of(context).primaryColor)),

                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:Colors.white.withOpacity(0.9),
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )))
            ],
          )),
    );
  }
}
