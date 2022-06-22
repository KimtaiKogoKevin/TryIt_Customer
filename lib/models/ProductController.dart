import 'package:get/get.dart';
import 'package:tryit_customer_app/firebase_services.dart';

import 'Product.dart';

class ProductController extends GetxController {
  final products = <Product>[].obs;
  FirebaseService service = FirebaseService();

  @override
  void onInit(){
    products.bindStream(service.getAllProducts());

    super.onInit();
  }
}