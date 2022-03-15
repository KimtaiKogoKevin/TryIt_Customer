import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 25, right: 25),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,

        children: [
          Row(
            children: [
              RichText(
                  text:  TextSpan(children: [
                TextSpan(
                    text: 'Try something ',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
                const TextSpan(text: '👀', style: TextStyle(fontSize: 22)),
              ]))
            ],
          ),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          spreadRadius: 0.1,
                          blurRadius: 0.1,
                          offset: const Offset(0, 1))
                    ]),
                child: const Icon(Icons.shopping_cart_outlined),
              ),
              Positioned(
                right:10,
                top: 10,
                child: Container(
                width: 10,
                  height: 10,
                decoration: BoxDecoration(
                  color:Theme.of(context).primaryColor,
                  shape: BoxShape.circle
                ),
              ),)
            ],
          ),
        ],
      ),
    );
  }
}
