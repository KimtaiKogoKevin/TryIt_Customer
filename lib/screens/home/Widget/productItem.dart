import 'package:flutter/material.dart';
import 'package:tryit_customer_app/models/ProductDepracated.dart';

class ProductItem extends StatelessWidget {
  final ProductDepracated product;

   ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          // child: Column(
          //   children: [
          //     Stack(
          //       children: [
          //         Container(
          //           height: 170,
          //           width: 200,
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(13),
          //               image: DecorationImage(
          //                 image: AssetImage(product.imageUrl),
          //                 fit: BoxFit.fitWidth,
          //               )),
          //         ),
          //         Positioned(
          //             right: 20,
          //             top: 15,
          //             child: Container(
          //               padding: const EdgeInsets.all(8),
          //               decoration: BoxDecoration(
          //                   color: Colors.white.withOpacity(0.9),
          //                   shape: BoxShape.circle),
          //               child: const Icon(
          //                 Icons.favorite,
          //                 color: Colors.red,
          //                 size: 15,
          //               ),
          //             ))
          //       ],
          //     ),
          //     Text(
          //       product.title,
          //       style:
          //           const TextStyle(fontWeight: FontWeight.bold, height: 1.5),
          //     ),
          //     Text(
          //       product.subtitle,
          //       style:
          //           const TextStyle(fontWeight: FontWeight.bold, height: 1.5),
          //     ),
          //     Text(
          //       product.price,
          //       style:
          //            TextStyle(fontWeight: FontWeight.bold, height: 1.5,color: Theme.of(context).primaryColor),
          //     ),
          //   ],
          // ),
        ));
  }
}
