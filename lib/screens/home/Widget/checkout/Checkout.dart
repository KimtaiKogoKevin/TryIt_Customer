import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tryit_customer_app/screens/home/Widget/custom_appBar.dart';

import '../../../../blocs/checkout/checkout_bloc.dart';
import '../BottomNavBar/customNavBar.dart';
import '../custom_text_formfield.dart';
import '../ordersummary.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkoutscreen';

  CheckoutScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => CheckoutScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Customer Information",
                    style: Theme.of(context).textTheme.headline3),
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
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'ORDER SUMMARY',
                  style: Theme.of(context).textTheme.headline3,
                ),
                OrderSummary()
              ],
            ),
          ),
        ),
      ),
      appBar: CustomAppBar(),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.white,
        child: SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocBuilder<CheckoutBloc, CheckoutState>(
                      builder: (context, state) {
                    if (state is CheckoutLoaded) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 0),
                        onPressed: () {
                          //print("tapped");
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }

                          context
                              .read<CheckoutBloc>()
                              .add(ConfirmCheckout(checkout: state.checkout));
                        },
                        child: Text(
                          'OrderNow',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: Colors.white),
                        ),
                      );
                    }
                    if (state is CheckoutLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return (const Text('Something Went Wrong'));
                    }
                  }),
                ]),
          ),
        ),
      ),
    );
  }
}
