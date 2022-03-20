import 'package:flutter/material.dart';
import 'package:tryit_customer_app/screens/home/Widget/recommended.dart';
import 'package:tryit_customer_app/screens/home/Widget/searchInput.dart';

import 'custom_appBar.dart';
import 'newarrival.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:     SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            SearchInput(),
            //Categories(),
            NewArrivals(),
            Recommended(),
          ],
        ),
      ),
    );
  }
}
