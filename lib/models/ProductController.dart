import 'package:get/get.dart';
import 'package:tryit_customer_app/firebase_services.dart';

import 'ProductDepracated.dart';

class ProductController extends GetxController {
  final products = <ProductDepracated>[].obs;
  FirebaseService service = FirebaseService();

  @override
  void onInit(){
    products.bindStream(service.getAllProducts());

    super.onInit();
  }
}