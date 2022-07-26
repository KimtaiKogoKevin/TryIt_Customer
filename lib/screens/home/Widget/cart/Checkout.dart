import 'package:flutter/material.dart';
import 'package:tryit_customer_app/screens/home/Widget/custom_appBar.dart';

import '../BottomNavBar/customNavBar.dart';

class CheckoutScreen extends StatelessWidget {

  static const String routeName = '/checkoutscreen';
  const CheckoutScreen({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CheckoutScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomNavBar(screen: '',),
    );
  }
}
