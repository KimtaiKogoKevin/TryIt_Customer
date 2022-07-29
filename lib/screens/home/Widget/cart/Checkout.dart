import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tryit_customer_app/screens/home/Widget/custom_appBar.dart';

import '../../../../blocs/checkout/checkout_bloc.dart';
import '../BottomNavBar/customNavBar.dart';
import '../custom_text_formfield.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Text("Customer Information", style: Theme.of(context).textTheme.headline3),
            CustomTextFormField(
              title: 'Email',
              onChanged: (value) {
                context
                    .read<CheckoutBloc>()
                    .add(UpdateCheckout(email: value));
              },
            ),
            CustomTextFormField(
              title: 'Full Name',
              onChanged: (value) {
                context
                    .read<CheckoutBloc>()
                    .add(UpdateCheckout(fullName: value));
              },
            ),
            SizedBox(height: 20),
            Text(
              'DELIVERY INFORMATION',
              style: Theme.of(context).textTheme.headline3,
            ),
            CustomTextFormField(
              title: 'Address',
              onChanged: (value) {
                context
                    .read<CheckoutBloc>()
                    .add(UpdateCheckout(address: value));
              },
            ),
            CustomTextFormField(
              title: 'City',
              onChanged: (value) {
                context
                    .read<CheckoutBloc>()
                    .add(UpdateCheckout(city: value));
              },
            ),
            CustomTextFormField(
              title: 'Country',
              onChanged: (value) {
                context
                    .read<CheckoutBloc>()
                    .add(UpdateCheckout(country: value));
              },
            ),
            CustomTextFormField(
              title: 'ZIP Code',
              onChanged: (value) {
                context
                    .read<CheckoutBloc>()
                    .add(UpdateCheckout(zipCode: value));
              },
            ),
            SizedBox(height: 20),
            Container(
              height: 60,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(color: Colors.black),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/payment-selection',
                        );
                      },
                      child: Text(
                        'SELECT A PAYMENT METHOD',
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ]
        ),
      ),
      appBar: CustomAppBar(),
      bottomNavigationBar:   BottomAppBar(
        elevation: 0,
        color: Colors.white,
        child: SizedBox(
          height: 70,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 0),
                  onPressed: () {
                    Navigator.pushNamed(context, '/orderNow');
                  },
                  child: Text(
                    'OrderNow',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
