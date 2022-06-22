import 'package:flutter/material.dart';
import 'package:tryit_customer_app/screens/Clips/clip.dart';
import 'package:tryit_customer_app/screens/UserDirectory/Myaccount.dart';
import 'package:tryit_customer_app/screens/category/categoryscreen.dart';
import 'package:tryit_customer_app/screens/home/Widget/homebody.dart';
import 'package:tryit_customer_app/screens/home/Widget/recommendations.dart';
import 'package:tryit_customer_app/screens/home/Widget/category/test__categories.dart';
import 'package:tryit_customer_app/screens/home/Widget/custom_appBar.dart';
import 'package:tryit_customer_app/screens/home/Widget/newarrival.dart';
import 'package:tryit_customer_app/screens/home/Widget/searchInput.dart';

class HomeScreen extends StatefulWidget {
  final int? index ;
  const HomeScreen({this.index , Key? key}) : super(key: key);
  static const  String routeName = '/';
  static Route route(){
    return MaterialPageRoute(
        settings: const RouteSettings(name:routeName),
        builder: (_) =>  HomeScreen());
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  final pages = [HomeBody(), CategoryScreen(),Clip(), MyAccount()];
  @override
  void initState() {
    // TODO: implement initState
    if(widget.index!= null){
      setState(() {
        pageIndex = widget.index!;
      });
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,

      body: pages[pageIndex],


      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                Icons.home_filled,
                color: Colors.white,
                size: 35,
              )
                  : const Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                Icons.work_rounded,
                color: Colors.white,
                size: 35,
              )
                  : const Icon(
                Icons.work_outline_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const Icon(
                Icons.widgets_rounded,
                color: Colors.white,
                size: 35,
              )
                  : const Icon(
                Icons.widgets_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? const Icon(
                Icons.person,
                color: Colors.white,
                size: 35,
              )
                  : const Icon(
                Icons.person_outline,
                color: Colors.white,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
