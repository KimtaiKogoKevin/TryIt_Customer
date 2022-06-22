import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:tryit_customer_app/models/CartController.dart';

import '../../../../models/Product.dart';
import '../../../../models/ProductController.dart';
import 'cart_total.dart';
class CartProductCard extends StatelessWidget {
  final CartController controller;
  final int quantity;
  final int index;
  final Product product;

   CartProductCard(
      {Key? key,
        required this.index, required this.quantity,required this.controller , required this.product
       })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
       Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(product.imageUrls![0]),
                ),
                const SizedBox(width: 20),
                Expanded(child: Text(product.productName!)),


                IconButton(
                  onPressed: () {
                    controller.removeProduct(product);
                  },
                  icon: const Icon(Icons.remove_circle),
                  color: Colors.redAccent,
                ),
                Text('${quantity}'),
                IconButton(
                  onPressed: () {
                    controller.addProduct(product);
                  },
                  icon: const Icon(Icons.add_circle),
                  color: Colors.greenAccent,
                ),
              ]),


          ],
        ),

       );



  }
}