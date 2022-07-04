import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:tryit_customer_app/firebase_services.dart';
import 'package:get/get.dart';
import 'package:tryit_customer_app/models/CartController.dart';
import 'package:tryit_customer_app/screens/home/Widget/products/cart_screendeprecated.dart';
import '../../../../models/Product.dart';
import '../../../../models/ProductController.dart';

class ProductDetails extends StatefulWidget {
  final Product? product;
  final String? productId;
  final int index;


  const ProductDetails({Key? key, this.product, this.productId , required this.index})
      : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  FirebaseService service = FirebaseService();
  final   ProductController productController =Get.find();

  final cartController = Get.put(CartController());



  int? pageNo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(product!.productName!),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.grey),
          actions: const [
            CircleAvatar(
                radius: 18,
                backgroundColor: Colors.black26,
                child: Icon(IconlyLight.buy, color: Colors.white)),
            SizedBox(width: 8),
            CircleAvatar(
                radius: 18,
                backgroundColor: Colors.black26,
                child: Icon(Icons.more_horiz, color: Colors.white)),
            SizedBox(width: 10),
          ]),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 300,
            child: Stack(children: [
              PageView(
                onPageChanged: (value) {
                  setState(() {
                    pageNo = value;
                  });
                },
                children: widget.product!.imageUrls!.map((e) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: CachedNetworkImage(
                      imageUrl: e,
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
              ),
              Positioned(
                  bottom: 10,
                  right: MediaQuery.of(context).size.width / 2,
                  child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.black45,
                      child: Text(
                          '${pageNo! + 1}/ ${widget.product!.imageUrls!.length}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12)))),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$h : ${widget.product!.discountPrice != null ? service.formattedNumber(widget.product!.discountPrice!) : service.formattedNumber(widget.product!.regularPrice!)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                          fontSize: 16),
                    ),
                    Row(
                      children:  [
                        IconButton(
                          icon: const Icon(IconlyLight.heart),
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                ),
                if (widget.product!.discountPrice != null)
                  Row(
                    children: [
                      Text(
                        '\$h ${service.formattedNumber(widget.product!.regularPrice)}',
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey),
                      ),
                      const SizedBox(width: 10),
                      Text(
                          '${((widget.product!.regularPrice! - widget.product!.discountPrice!) / widget.product!.regularPrice! * 100).toStringAsFixed(0)}%')
                    ],
                  ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product!.productName!,
                      style: const TextStyle(fontSize: 18),
                    ),
                    TextButton(
                        onPressed: () {}, child: const Text('View with AR'))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Rating',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                Row(children: [
                  Icon(IconlyBold.star,
                      color: Theme.of(context).primaryColor, size: 16),
                  Icon(IconlyBold.star,
                      color: Theme.of(context).primaryColor, size: 16),
                  Icon(IconlyBold.star,
                      color: Theme.of(context).primaryColor, size: 16),
                  Icon(IconlyBold.star,
                      color: Theme.of(context).primaryColor, size: 16),
                  Icon(IconlyBold.star,
                      color: Theme.of(context).primaryColor, size: 16),
                  const SizedBox(width: 4),
                  const Text(
                    '(5)',
                    style: TextStyle(fontSize: 16),
                  )
                ]),
                Divider(
                  color: Colors.grey.shade500,
                  thickness: 1,
                ),
                InkWell(
                  onTap: () {
                    showBottomSheet(
                        context: context,
                        builder: (context) {
                          return BottomSheet(
                              onClosing: () {},
                              builder: (context) {
                                return Container();
                              });
                        });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                          flex: 2,
                          child: Text(
                            'Delivery',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          )),
                      Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  //fetch google map
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                        child: Text(
                                      'Address Details from google maps',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Theme.of(context).primaryColor),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                    Icon(
                                      IconlyLight.location,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ],
                                ),
                              ),
                              const Text(
                                'Home Delivery 3-5 Days',
                                style: TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Delivery charge: ${widget.product!.chargeShipping! ? '\$h ${widget.product!.shippingCharge!}' : 'Free'}',
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.grey),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey.shade500,
                  thickness: 1,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Rating & Reviews (10)",
                          style: TextStyle(color: Colors.grey)),
                      Column(
                        children: [
                          Text("View All",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor)),
                          const Icon(IconlyLight.arrowDownCircle)
                        ],
                      )
                    ]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Kevin\'s review  -15/05/2022',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(children: [
                        Icon(IconlyBold.star,
                            size: 12, color: Theme.of(context).primaryColor),
                        Icon(IconlyBold.star,
                            size: 12, color: Theme.of(context).primaryColor),
                        Icon(IconlyBold.star,
                            size: 12, color: Theme.of(context).primaryColor),
                        Icon(IconlyBold.star,
                            size: 12, color: Theme.of(context).primaryColor),
                        Icon(IconlyLight.star,
                            size: 12, color: Theme.of(context).primaryColor),
                      ]),
                    ]),
                const Text(
                    'Quality Furniture ,\n  suited my house well with the AR'),
                const SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Kevin\'s review  -15/05/2022',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(children: [
                        Icon(IconlyBold.star,
                            size: 12, color: Theme.of(context).primaryColor),
                        Icon(IconlyBold.star,
                            size: 12, color: Theme.of(context).primaryColor),
                        Icon(IconlyBold.star,
                            size: 12, color: Theme.of(context).primaryColor),
                        Icon(IconlyBold.star,
                            size: 12, color: Theme.of(context).primaryColor),
                        Icon(IconlyLight.star,
                            size: 12, color: Theme.of(context).primaryColor),
                      ]),
                    ]),
                const Text(
                    'Quality Furniture ,\n  suited my house well with \n the AR'),
                const SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Kevin\'s review  -15/05/2022',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(children: [
                        Icon(IconlyBold.star,
                            size: 12, color: Theme.of(context).primaryColor),
                        Icon(IconlyBold.star,
                            size: 12, color: Theme.of(context).primaryColor),
                        Icon(IconlyBold.star,
                            size: 12, color: Theme.of(context).primaryColor),
                        Icon(IconlyBold.star,
                            size: 12, color: Theme.of(context).primaryColor),
                        Icon(IconlyLight.star,
                            size: 12, color: Theme.of(context).primaryColor),
                      ]),
                    ]),
                const Text(
                    'Quality Furniture suited my house well with \n the AR'),
                const SizedBox(height: 20),
              ],
            ),
          )
        ]),
      ),
      bottomSheet: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.shade400))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(
            fit: BoxFit.fill,
            child: Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Icon(
                    Icons.store_mall_directory_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 34,
                  ),
                  Text('Store',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 12))
                ],
              ),
              SizedBox(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: VerticalDivider(
                    color: Colors.grey.shade900,
                    thickness: 1,
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 4),
                  Icon(
                    IconlyLight.chat,
                    color: Theme.of(context).primaryColor,
                    size: 34,
                  ),
                  Text('Chat',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 12))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: VerticalDivider(
                  color: Colors.grey.shade900,
                  thickness: 1,
                ),
              ),
              ElevatedButton(
              //   onPressed: (){
              //   Navigator.push(context, MaterialPageRoute(
              //     builder: (BuildContext context) {
              //       return CartScreen(
              //
              //       );
              //     },
              //   ));
              // },
                onPressed: () => Get.to(()=> CartScreenDeprecated()),
                child: const Text(
                  'Checkout',
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange)),
              ),
              const SizedBox(width: 15),
              ElevatedButton(
                onPressed: () {
                  cartController.addProduct(widget.product!);
                },
                child: const Text(
                  'Add to cart',
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
