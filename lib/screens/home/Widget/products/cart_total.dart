import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tryit_customer_app/firebase_services.dart';
import 'package:tryit_customer_app/models/CartController.dart';


class CartTotal extends StatefulWidget {

   CartTotal({Key? key}) : super(key: key);


  @override
  State<CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {
  final CartController controller = Get.find();

  final FirebaseService _service = FirebaseService();



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal:75),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
            const Text('Total',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)) ,
              Text('${controller.total}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)) ,

              // Consumer<DataClass>(builder: (context, data, child){
              //   return Text('${data.x}', style: const TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 20,
              //   ),);
              // }),


            ]),
     );
  }
}
