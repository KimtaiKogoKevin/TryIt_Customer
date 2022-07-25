import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tryit_customer_app/models/RecommendedProduct.dart';
import 'package:tryit_customer_app/screens/home/Widget/Rproductitem.dart';
import 'package:tryit_customer_app/screens/home/Widget/products/ProductCarousel.dart';
import 'package:tryit_customer_app/screens/home/Widget/products/productCard2.dart';
import 'package:tryit_customer_app/screens/home/Widget/sectionList.dart';
import 'package:tryit_customer_app/screens/home/Widget/sectionTitle.dart';
import 'package:tryit_customer_app/models/Product.dart';
import '../../../../blocs/products/product_bloc.dart';

class RecommendedItem extends StatelessWidget {
  //final recommendedList = RecommendedProduct.generateRecommendedProduct();
  const RecommendedItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(title: 'Recommended'),
        BlocBuilder<ProductBloc,ProductState>(
          builder:(context,state){
            if(state is ProductLoading){
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProductLoaded ){
              return ProductCarousel(
                  products: state.products
                      .where((product) => product.isRecommended!)
                      .toList());
    }
            else {
            return const Text('Something Went Wrong');
            }
    }

        ),
        const SectionTitle(title: 'Popular'),
        BlocBuilder<ProductBloc,ProductState>(
          builder: (context,state){
            if(state is ProductLoading){
              return const Center(child: CircularProgressIndicator());
            }

            if(state is ProductLoaded){
              return ProductCarousel(
                  products: state.products
                      .where((product) => product.isPopular!)
                      .toList());
            }
            else {
              return const Text('Something Went Wrong');
            }


          },

        )
      ],
    );
  }
}
