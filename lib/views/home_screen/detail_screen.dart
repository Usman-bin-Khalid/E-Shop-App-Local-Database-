// import 'package:flutter/material.dart';
// import 'package:newzler/model/model_class_product.dart';
//
// import '../../model/cart_class.dart';
// import '../cart_screen/cart_screen.dart';
//
// class ProductDetailsScreen extends StatefulWidget {
//   final ProductModelClass product;
//
//   const ProductDetailsScreen({super.key, required this.product});
//
//   @override
//   State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
// }
//
// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   //ValueNotifier Flutter ky andr aik class hy jo hold krti hy value ko or allow krti hy widget ko k wo
//   //listen krny us change ko jo k us value ky andr arha hy
//   final ValueNotifier<Color> _fabColor = ValueNotifier<Color>(Colors.blueAccent);
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize the color based on the current cart state
//     _fabColor.value = CartManager().cartItems.contains(widget.product)
//         ? Colors.green
//         : Colors.blueAccent;
//   }
//
//
//
//
//   void _updateFabColor() {
//     final isInCart = CartManager().cartItems.contains(widget.product);
//     _fabColor.value = isInCart ? Colors.green : Colors.blueAccent;
//   }
//   @override
//   Widget build(BuildContext context) {
//     final isInCart = CartManager().cartItems.contains(widget.product);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: Text(
//           widget.product.title,
//           style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       floatingActionButton: ValueListenableBuilder<Color>(
//         valueListenable: _fabColor,
//         builder: (context, color, child) {
//           return FloatingActionButton(
//             onPressed: () {
//               if (!CartManager().cartItems.contains(widget.product)) {
//                 CartManager().addItem(widget.product);
//                 _updateFabColor();
//               }
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => CartScreen(),
//                 ),
//               ).then((_) {
//                 // Update FAB color when returning from CartScreen
//                 _updateFabColor();
//               });
//             },
//             backgroundColor: color,
//             elevation: 0,
//             child: const Icon(
//               Icons.shopping_cart,
//               color: Colors.white,
//             ),
//           );
//         },
//       ),
//       // floatingActionButton: ValueListenableBuilder<Color>(
//       //   valueListenable: _fabColor,
//       //   builder: (context, color, child) {
//       //     return FloatingActionButton(
//       //       onPressed: () {
//       //         if (!CartManager().cartItems.contains(widget.product)) {
//       //           CartManager().addItem(widget.product);
//       //           _updateFabColor();
//       //           ScaffoldMessenger.of(context).showSnackBar(
//       //             SnackBar(content: Text('Product added to cart')),
//       //           );
//       //         } else {
//       //           ScaffoldMessenger.of(context).showSnackBar(
//       //             SnackBar(content: Text('Product is already in the cart')),
//       //           );
//       //         }
//       //       },
//       //       backgroundColor: color,
//       //       elevation: 0,
//       //       child: const Icon(
//       //         Icons.shopping_cart,
//       //         color: Colors.white,
//       //       ),
//       //     );
//       //   },
//       // ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Container(
//                   height: 300,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage(
//                               widget.product.image.toString()),
//                           fit: BoxFit.fill),
//                       borderRadius: BorderRadius.circular(10)),
//                   margin: EdgeInsets.symmetric(horizontal: 6),
//                 ),
//               ),
//
//               const SizedBox(height: 20),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Color(0xffF7F8FA),
//                   borderRadius: BorderRadius.circular(10)
//                 ),
//                 padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Image.asset('assets/images/titlelogo.png',
//                       width: 24,
//                       height: 24,
//                       color:  Color(0xff323232),),
//                     SizedBox(width: 5,),
//                     Text(
//                       "Name : ",
//                       style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff1E1A15)),
//                     ),
//                     Expanded(
//                       child: Text(
//                         "${widget.product.title}",
//                         style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.blueAccent),
//                         textAlign: TextAlign.justify,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 decoration: BoxDecoration(
//                     color: Color(0xffF7F8FA),
//                     borderRadius: BorderRadius.circular(10)
//                 ),
//                 padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Image.asset('assets/images/description.png',
//                       width: 24,
//                       height: 24,
//                       color:  Color(0xff323232),),
//                     SizedBox(width: 5,),
//                     Expanded(
//                       child: RichText(
//                         textAlign: TextAlign.justify,
//                         text: TextSpan(
//
//                             children: [
//                               TextSpan(text: "Description : " , style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff1E1A15)
//                               ),
//                               ),
//                               TextSpan(text :  "${widget.product.description}",
//                                   style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.blueAccent),
//                               ),// fontStyle: FontStyle.italic,
//                             ]
//                         )
//                         ,),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 decoration: BoxDecoration(
//                     color: Color(0xffF7F8FA),
//                     borderRadius: BorderRadius.circular(10)
//                 ),
//                 padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Image.asset('assets/images/price.png',
//                       width: 24,
//                       height: 24,
//                       color:  Color(0xff323232),),
//                     SizedBox(width: 5,),
//                     Text(
//                       "Price : ",
//                       style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff1E1A15)),
//                     ),
//                     Expanded(
//                       child: Text("Rs : "
//                         "${widget.product.price}" + " PKR",
//                         style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.blueAccent),
//                         textAlign: TextAlign.justify,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 decoration: BoxDecoration(
//                     color: Color(0xffF7F8FA),
//                     borderRadius: BorderRadius.circular(10)
//                 ),
//                 padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Image.asset('assets/images/quantity.png',
//                       width: 24,
//                       height: 24,
//                       color:  Color(0xff323232),),
//                     SizedBox(width: 5,),
//                     Text(
//                       "Available Quantity : ",
//                       style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff1E1A15)),
//                     ),
//                     Expanded(
//                       child: Text(
//                         "${widget.product.quantity}",
//                         style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.blueAccent),
//                         textAlign: TextAlign.justify,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:newzler/model/model_class_product.dart';

import '../../model/cart_class.dart';
import '../cart_screen/cart_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModelClass product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ValueNotifier<Color> _fabColor = ValueNotifier<Color>(Colors.blueAccent);

  @override
  void initState() {
    super.initState();
    _fabColor.value = CartManager().cartItems.contains(widget.product)
        ? Colors.green
        : Colors.blueAccent;
  }

  void _updateFabColor() {
    final isInCart = CartManager().cartItems.contains(widget.product);
    _fabColor.value = isInCart ? Colors.green : Colors.blueAccent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          widget.product.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      floatingActionButton: ValueListenableBuilder<Color>(
        valueListenable: _fabColor,
        builder: (context, color, child) {
          return FloatingActionButton(
            onPressed: () {
              if (!CartManager().cartItems.contains(widget.product)) {
                CartManager().addItem(widget.product);
                _updateFabColor();
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              ).then((_) {
                _updateFabColor();
              });
            },
            backgroundColor: color,
            elevation: 0,
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(

                      image: _getImageProvider(widget.product.image),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 6),
                ),
              ),
              const SizedBox(height: 20),
              _buildInfoRow(
                iconPath: 'assets/images/titlelogo.png',
                label: 'Name',
                value: widget.product.title,
              ),
             SizedBox(height: 10,),
        Container(
                decoration: BoxDecoration(
                    color: Color(0xffF7F8FA),
                    borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/description.png',
                      width: 24,
                      height: 24,
                      color:  Color(0xff323232),),
                    SizedBox(width: 5,),
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(

                            children: [
                              TextSpan(text: "Description : " , style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff1E1A15)
                              ),
                              ),
                              TextSpan(text :  "${widget.product.description}",
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.blueAccent),
                              ),// fontStyle: FontStyle.italic,
                            ]
                        )
                        ,),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              _buildInfoRow(
                iconPath: 'assets/images/price.png',
                label: 'Price',
                value: 'Rs: ${widget.product.price} PKR',
              ),
              const SizedBox(height: 10),
              _buildInfoRow(
                iconPath: 'assets/images/quantity.png',
                label: 'Available Quantity',
                value: widget.product.quantity.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Determine the image provider based on the image path.
  ImageProvider _getImageProvider(String imagePath) {
    if (imagePath.startsWith('assets/')) {
      return AssetImage(imagePath);
    } else {
      return FileImage(File(imagePath));
    }
  }

  /// Reusable method to build a row displaying icon, label, and value.
  /// Adds a parameter to handle specific alignment for the description row.
  Widget _buildInfoRow({
    required String iconPath,
    required String label,
    required String value,
    bool isDescriptionRow = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF7F8FA),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Row(
        crossAxisAlignment: isDescriptionRow
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        mainAxisAlignment: isDescriptionRow
            ? MainAxisAlignment.start
            : MainAxisAlignment.start,
        children: [
          Image.asset(
            iconPath,
            width: 24,
            height: 24,
            color: const Color(0xff323232),
          ),
          const SizedBox(width: 5),
          Text(
            "$label : ",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xff1E1A15),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.blueAccent,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
