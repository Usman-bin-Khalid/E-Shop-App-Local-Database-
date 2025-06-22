//
// import 'package:flutter/material.dart';
// import 'package:newzler/model/custom_appBar.dart';
// import '../../model/cart_class.dart';
//
// class CartScreen extends StatefulWidget {
//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//   int _calculateTotalPrice() {
//     final cartManager = CartManager();
//     int total = 0;
//     for (var item in cartManager.cartItems) {
//       final quantity = cartManager.getQuantity(item);
//       total += item.price * quantity;
//     }
//     return total;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final cartManager = CartManager();
//
//     return Scaffold(
//       appBar: CustomAppBar(title: "Cart Screen",),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: cartManager.cartItems.length + 1, // Add 1 for the total card
//               itemBuilder: (context, index) {
//                 if (index == cartManager.cartItems.length) {
//                   // Show the total price card
//                   final total = _calculateTotalPrice();
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//                     child: Card(
//                       color: Colors.grey.shade200,
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Image.asset("assets/images/total_price.png", width: 24, height: 24,),
//                             SizedBox(width: 4,),
//                             Expanded(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "Total : ",
//                                     style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
//                                   ),
//                                   Text(
//                                     'Rs $total PKR',
//                                     style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.blueAccent),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 }
//
//                 // Show individual product cards
//                 final item = cartManager.cartItems[index];
//                 final quantity = cartManager.getQuantity(item);
//
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                   child: Card(
//                     color: Colors.white,
//                     child: ListTile(
//                       leading: ClipRRect(
//                         borderRadius: BorderRadius.circular(25),
//                         child: Image.asset(
//                           item.image,
//                           width: 50,
//                           height: 50,
//                         ),
//                       ),
//                       title: Text(
//                         item.title,
//                         style: const TextStyle(color: Colors.black),
//                       ),
//                       subtitle: Text(
//                         'Rs ${item.price} x $quantity = Rs ${item.price * quantity} PKR',
//                         style: const TextStyle(color: Colors.black),
//                       ),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 if (quantity > 1) {
//                                   cartManager.updateQuantity(item, quantity - 1);
//                                 } else {
//                                   cartManager.removeItem(item);
//                                 }
//                               });
//                             },
//                             icon: Image.asset(
//                               "assets/images/minus_icon.png",
//                               width: 21,
//                               height: 21,
//                             ),
//                           ),
//                           Text(
//                             quantity.toString(),
//                             style: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 cartManager.updateQuantity(item, quantity + 1);
//                               });
//                             },
//                             icon: Image.asset(
//                               "assets/images/plus_icon.png",
//                               width: 21,
//                               height: 21,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// // import 'package:flutter/material.dart';
// // import '../../model/cart_class.dart';
// //
// // class CartScreen extends StatefulWidget {
// //   @override
// //   State<CartScreen> createState() => _CartScreenState();
// // }
// //
// // class _CartScreenState extends State<CartScreen> {
// //   final cartManager = CartManager();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     loadCartData();
// //   }
// //
// //   Future<void> loadCartData() async {
// //     await cartManager.loadCartFromLocalStorage();
// //     setState(() {}); // Refresh the UI after loading data
// //   }
// //
// //   int _calculateTotalPrice() {
// //     int total = 0;
// //     for (var item in cartManager.cartItems) {
// //       final quantity = cartManager.getQuantity(item);
// //       total += item.price * quantity;
// //     }
// //     return total;
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         elevation: 0,
// //         title: const Text(
// //           "Cart",
// //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: cartManager.cartItems.length + 1,
// //               itemBuilder: (context, index) {
// //                 if (index == cartManager.cartItems.length) {
// //                   final total = _calculateTotalPrice();
// //                   return Padding(
// //                     padding: const EdgeInsets.symmetric(
// //                         horizontal: 10.0, vertical: 10.0),
// //                     child: Card(
// //                       color: Colors.grey.shade200,
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(16.0),
// //                         child: Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             const Text(
// //                               "Total:",
// //                               style: TextStyle(
// //                                 fontSize: 17,
// //                                 fontWeight: FontWeight.w600,
// //                                 color: Colors.black,
// //                               ),
// //                             ),
// //                             Text(
// //                               'Rs $total PKR',
// //                               style: const TextStyle(
// //                                 fontSize: 17,
// //                                 fontWeight: FontWeight.w600,
// //                                 color: Colors.blueAccent,
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   );
// //                 }
// //
// //                 final item = cartManager.cartItems[index];
// //                 final quantity = cartManager.getQuantity(item);
// //
// //                 return Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
// //                   child: Card(
// //                     child: ListTile(
// //                       leading: Image.asset(
// //                         item.image,
// //                         width: 50,
// //                         height: 50,
// //                       ),
// //                       title: Text(item.title),
// //                       subtitle: Text(
// //                         'Rs ${item.price} x $quantity = Rs ${item.price * quantity}',
// //                       ),
// //                       trailing: Row(
// //                         mainAxisSize: MainAxisSize.min,
// //                         children: [
// //                           IconButton(
// //                             onPressed: () {
// //                               setState(() {
// //                                 if (quantity > 1) {
// //                                   cartManager.updateQuantity(item, quantity - 1);
// //                                 } else {
// //                                   cartManager.removeItem(item);
// //                                 }
// //                               });
// //                             },
// //                             icon: const Icon(Icons.remove),
// //                           ),
// //                           Text('$quantity'),
// //                           IconButton(
// //                             onPressed: () {
// //                               setState(() {
// //                                 cartManager.updateQuantity(item, quantity + 1);
// //                               });
// //                             },
// //                             icon: const Icon(Icons.add),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:newzler/model/custom_appBar.dart';
import '../../model/cart_class.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _calculateTotalPrice() {
    final cartManager = CartManager();
    int total = 0;
    for (var item in cartManager.cartItems) {
      final quantity = cartManager.getQuantity(item);
      total += item.price * quantity;
    }
    return total;
  }

  /// Determines the appropriate ImageProvider for the given image path.
  ImageProvider _getImageProvider(String imagePath) {
    if (imagePath.startsWith('assets/')) {
      return AssetImage(imagePath);
    } else {
      return FileImage(File(imagePath));
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartManager = CartManager();

    return Scaffold(
      appBar: CustomAppBar(title: "Cart Screen"),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartManager.cartItems.length + 1, // Add 1 for the total card
              itemBuilder: (context, index) {
                if (index == cartManager.cartItems.length) {
                  // Show the total price card
                  final total = _calculateTotalPrice();
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: Card(
                      color: Colors.grey.shade200,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/total_price.png",
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Total : ",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'Rs $total PKR',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                // Show individual product cards
                final item = cartManager.cartItems[index];
                final quantity = cartManager.getQuantity(item);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image(
                          image: _getImageProvider(item.image),
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        item.title,
                        style: const TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        'Rs ${item.price} x $quantity = Rs ${item.price * quantity} PKR',
                        style: const TextStyle(color: Colors.black),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) {
                                  cartManager.updateQuantity(item, quantity - 1);
                                } else {
                                  cartManager.removeItem(item);
                                }
                              });
                            },
                            icon: Image.asset(
                              "assets/images/minus_icon.png",
                              width: 21,
                              height: 21,
                            ),
                          ),
                          Text(
                            quantity.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                cartManager.updateQuantity(item, quantity + 1);
                              });
                            },
                            icon: Image.asset(
                              "assets/images/plus_icon.png",
                              width: 21,
                              height: 21,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
