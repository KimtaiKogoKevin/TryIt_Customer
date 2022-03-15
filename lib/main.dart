import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tryit_customer_app/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor:Colors.transparent ,


  ));


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        backgroundColor: const Color(0XFFFFFFFF),
        primaryColor: const Color(0XFF0D47A1),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0XFF18FFFF)),

      ),
      home:  HomeScreen()
    );
  }
}


