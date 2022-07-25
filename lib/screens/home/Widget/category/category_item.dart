import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tryit_customer_app/models/CategoryDeprecated.dart';
import 'package:flutter/material.dart';

import '../../../../blocs/catgeory/category_bloc.dart';
import '../../../../firebase_services.dart';
import '../../../../models/Category.dart';

class CategoryItem extends StatelessWidget {
   final Category category;
   CategoryItem(this.category);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        child: BlocBuilder<CategoryBloc,CategoryState>(
          builder:(context,state){

            if(state is CategoryLoading){
              return const Center(child: CircularProgressIndicator(),);
            }
            if (state is CategoryLoaded){
               return  Card(
                 shape:
                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Stack(
                       children: [
                         Container(
                           height: 150,
                           width: 150,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(13),
                               image: DecorationImage(
                                 image: AssetImage(category.image.toString()),
                                 fit: BoxFit.fitWidth,
                               )),
                         ),
                         // Positioned(
                         //     right: 20,
                         //     top: 15,
                         //     child: Container(
                         //       padding: const EdgeInsets.all(8),
                         //       decoration: BoxDecoration(
                         //           color: Colors.white.withOpacity(0.9),
                         //           shape: BoxShape.circle),
                         //       child: const Icon(
                         //         Icons.favorite,
                         //         color: Colors.red,
                         //         size: 15,
                         //       ),
                         //     ))
                       ],
                     ),
                     Text(
                       category.catName.toString(),
                       style:
                       const TextStyle(fontWeight: FontWeight.bold, height: 9.5),
                     ),


                   ],
                 ),
               );
            }
            else {
              return const Text('Something Went Wrong');
            }
     })

        );

  }
}
