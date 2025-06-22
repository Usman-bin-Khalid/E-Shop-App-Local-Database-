import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newzler/getX/favourite_app.dart';
import 'package:newzler/model/model_class_product.dart';
import 'package:newzler/views/home_screen/detail_screen.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import '../edit_product/edit_product.dart';

class WidgetHomeScreen extends StatelessWidget {
  final ProductModelClass productModelClass;
  final VoidCallback onDelete;
  final VoidCallback onFavouriteToggle;
  final bool isFavourite;
  final ValueChanged<ProductModelClass> onEdit;

  const WidgetHomeScreen({super.key, required this.productModelClass, required this.onDelete, required this.onFavouriteToggle, required this.isFavourite, required this.onEdit});
  @override


// Inside your WidgetHomeScreen build method
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProductDetailsScreen(product: productModelClass)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Card(

          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 7,
              right: 7,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.black,
                width: 0.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 170,
                      width: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: productModelClass.image.startsWith('assets/')
                              ? AssetImage(productModelClass.image)
                          as ImageProvider
                              : FileImage(File(productModelClass.image)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Name',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            productModelClass.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                                fontWeight: FontWeight.w200),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            productModelClass.description!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                                fontWeight: FontWeight.w200),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Price',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Text(
                            "Rs : ${productModelClass.price} PKR",
                            style:
                            const TextStyle(fontSize: 12, color: Colors.blue),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Quantity',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Text(
                            productModelClass.quantity.toString(),
                            style:
                            const TextStyle(fontSize: 12, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: onFavouriteToggle,
                          icon: Icon(
                            isFavourite ? Icons.favorite : Icons.favorite_border,
                            color: isFavourite ? Colors.red : Colors.black54,
                          ),
                        ),
              GestureDetector(
                onTap: () async {
                  final editedProduct = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProductScreen(
                        product: productModelClass,
                        onSave: (updatedProduct) {
                          onEdit(updatedProduct);
                        },
                      ),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/images/editlogo.png',
                  width: 30,
                  height: 45,
                ),
              ),


                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return Container(
                                      child: AlertDialog(
                                        backgroundColor: Colors.white,
                                        title: Center(
                                          child: Column(


                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                "assets/images/logo.png",
                                                width: 70,
                                                height: 70,
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                'Are you sure you want to delete this product?',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff1E1A15)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(top: 38),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          color:
                                                          Color(0xff979797)),
                                                    )),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      onDelete();

                                                    },
                                                    child: Text(
                                                      'Delete',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          color:
                                                          Color(0xffEA4235)),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            icon: Image.asset(
                              'assets/images/deletelogoicon.png',
                              width: 30,
                              height: 45,
                            )),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}


