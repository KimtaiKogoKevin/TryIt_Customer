import 'package:flutter/material.dart';
import 'package:tryit_customer_app/screens/home/Widget/sectionList.dart';

class Recommended extends StatelessWidget {
  const Recommended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SectionList('Recommendations'),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 25),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/images/chair3.jpg',
                            width: 100,
                          )),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const Text('Living room Couch' ,style:TextStyle(fontWeight: FontWeight.bold,height: 1.5)) ,
                          const Text('Home and Decor' ,style:TextStyle(fontWeight: FontWeight.bold,height: 1.5)),
                          Text('\K\S\H 450',style:TextStyle(fontWeight: FontWeight.bold,height: 1.5 ,color: Theme.of(context).primaryColor))
                        ],
                      )
                    ],
                  ),
                ),
                 Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:Colors.white.withOpacity(0.9),
                        ),
                        child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )))
              ],
            )),
      ],
    ));
  }
}
