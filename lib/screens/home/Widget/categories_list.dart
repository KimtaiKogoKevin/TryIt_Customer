import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final String title;

  CategoryList(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Row(
              children: [
            Text('View All',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 18)),
            const SizedBox(width:10),
            Container(
              padding:const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:Theme.of(context).primaryColor
              ),
              child: const Icon(Icons.arrow_forward_ios , color:Colors.white,size:15),
            )
          ])
        ],
      ),
    );
  }
}
