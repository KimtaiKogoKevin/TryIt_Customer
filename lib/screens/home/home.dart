import 'package:flutter/material.dart';
import 'package:tryit_customer_app/screens/home/Widget/recommended.dart';
import 'package:tryit_customer_app/screens/home/Widget/categories.dart';
import 'package:tryit_customer_app/screens/home/Widget/custom_appBar.dart';
import 'package:tryit_customer_app/screens/home/Widget/newarrival.dart';
import 'package:tryit_customer_app/screens/home/Widget/searchInput.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bottomList = ['home', 'menu','heart', 'user'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
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
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: bottomList
            .map((e) => BottomNavigationBarItem(
                  label: e,
                  icon: Image.asset(
                    'assets/icons/$e.png',
                    width: 25,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
