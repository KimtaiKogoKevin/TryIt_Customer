import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:tryit_customer_app/models/CartController.dart';
import 'package:tryit_customer_app/models/ProductController.dart';
import 'package:tryit_customer_app/screens/home/Widget/products/cart_total.dart';
import 'package:tryit_customer_app/screens/home/Widget/products/productCard.dart';

import '../../../../models/Product.dart';

class CartScreenDeprecated extends StatefulWidget {
  final Product? product;
  final String? productId;
  static const  String routeName = '/cartdeprecated';
  static Route route(){
    return MaterialPageRoute(
        settings: const RouteSettings(name:routeName),
        builder: (_) =>  CartScreenDeprecated());
  }

  CartScreenDeprecated({Key? key , this.product, this.productId}) : super(key: key);

  @override
  State<CartScreenDeprecated> createState() => _CartScreenDeprecatedState();
}

class _CartScreenDeprecatedState extends State<CartScreenDeprecated> {
  final CartController controller = Get.find();
  @override
  void initState() {

    super.initState();
    setState((){
    });
    print("initState() called");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
              // title: Text(product!.productName!),
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.grey),
              actions: const [
                CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.black26,
                    child: Icon(IconlyLight.buy, color: Colors.white)),
                SizedBox(width: 8),
                CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.black26,
                    child: Icon(Icons.more_horiz, color: Colors.white)),
                SizedBox(width: 10),
              ]),
          body:Obx(()
            => Column(
                children: [
                  SizedBox(
                      height: 600,
                      child: ListView.builder(
                          itemCount: controller.products().length,
                          itemBuilder: (BuildContext context, int index) {
                            return CartProductCard(
                             controller: controller,
                              quantity: controller.products.values.toList()[index],
                              product: controller.products.keys.toList()[index],
                              index: index,
                            );
                          })),
                 // if(controller.total!=null)
                  Expanded(child:CartTotal())

                ],
              ),
          ),

    );






  }
}




