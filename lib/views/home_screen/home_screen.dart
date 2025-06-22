import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newzler/getX/display_language.dart';
import 'package:newzler/getX/logIn_screen.dart';
import 'package:newzler/model/model_class_product.dart';
import 'package:newzler/views/add_product/add_product.dart';
import 'package:newzler/views/home_screen/widget_home_screen.dart';
import 'package:newzler/views/log_in/log_in.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/cart_class.dart';
import '../../model/user_profile_manager.dart';
import '../../model/theme_controller_class.dart';
import '../favourite_screen/favourite_screen.dart';
import '../video_live_news/video_live_news.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  const HomeScreen({super.key, required this.name});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModelClass> productsList = [
    ProductModelClass(
        id: 1,
        image: "assets/images/first_product.jpg",
        title: "Laptop",
        price: 64000,
        description:
            "Laptops have become an indispensable part of modern life. Whether you're a student, professional, gamer, or creative enthusiast, the right laptop can significantly enhance your productivity and entertainment experience. However, with the vast number of options available, selecting the perfect laptop can feel overwhelming. Here’s a comprehensive guide to help you make an informed decision.",
        quantity: 5),
    ProductModelClass(
        id: 2,
        image: "assets/images/second_product.jpg",
        title: "Computer",
        price: 15000,
        description:
            "Computers have revolutionized the way we live, work, and interact with the world. From their humble beginnings as room-sized machines to the sleek devices we carry in our bags, computers have become a cornerstone of technological advancement. Here’s a look at their evolution, significance, and how they continue to shape our future.",
        quantity: 5),
    ProductModelClass(
        id: 3,
        image: "assets/images/third_product.png",
        title: "Robots",
        price: 124000,
        description:
            "Robots, once confined to the realm of science fiction, are now an integral part of our daily lives. From industrial automation to healthcare, they are transforming industries and redefining the limits of what technology can achieve. In this blog, we’ll explore the evolution of robots, their applications, and their potential impact on our future",
        quantity: 5),
    ProductModelClass(
        id: 4,
        image: "assets/images/fourth_product.png",
        title: "Tik Tok Shop",
        price: 5600,
        description:
            "TikTok Shop is an integrated shopping feature within the TikTok app, allowing businesses and creators to showcase and sell products directly to users. It combines TikTok’s unique algorithm-driven content with e-commerce, enabling creators to promote items in a way that feels natural and engaging. Through TikTok Shop, users can purchase products without ever leaving the app.",
        quantity: 5),
    ProductModelClass(
        id: 5,
        image: "assets/images/fifth_product.png",
        title: "AI",
        price: 98000,
        description:
            "Artificial Intelligence (AI) has evolved from a futuristic concept into a powerful and transformative technology shaping various industries. From self-driving cars to AI-powered assistants, this technology is poised to revolutionize the way we live and work. In this blog, we will explore what AI is, its applications, and the potential impact it will have on our future.",
        quantity: 5),
    ProductModelClass(
        id: 6,
        image: "assets/images/six_product.jpg",
        title: "Co-Working Place",
        price: 98000,
        description:
            "In the modern workforce, flexibility, collaboration, and work-life balance have become essential elements of a fulfilling career. Traditional office spaces, with their rigid structures and long commutes, no longer fit the needs of today's dynamic professionals. Enter co-working spaces, a solution that’s reshaping the way people work, collaborate, and build their businesses.",
        quantity: 5),
    ProductModelClass(
        id: 7,
        image: "assets/images/seven_product.jpg",
        title: "Amazon",
        price: 78390,
        description:
            "Amazon, a name synonymous with online shopping, has evolved from a small online bookstore to a global e-commerce empire. Today, it is not just a marketplace but a vast ecosystem that influences nearly every industry, from retail and logistics to entertainment and cloud computing.",
        quantity: 5),
    ProductModelClass(
        id: 8,
        image: "assets/images/eight_product.jpg",
        title: "Computer Lab",
        price: 98790,
        description:
            "A computer lab is a dedicated space within a school, college, or university where students can access computers and other technological resources for learning and research purposes. These labs are often equipped with desktop computers, high-speed internet, printers, scanners, and various educational software.",
        quantity: 5),
    ProductModelClass(
        id: 9,
        image: "assets/images/ds.png",
        title: "Office Work",
        price: 681980,
        description:
            "The modern office is more than a physical workspace—it's a hub for collaboration, innovation, and productivity. Navigating office work efficiently requires a mix of technical skills, interpersonal abilities, and adaptability. With the shift toward hybrid and remote work models, the dynamics of office life are rapidly evolving."
            , quantity: 5),
    ProductModelClass(
        id: 10,
        image: "assets/images/datascience.png",
        title: "Data Science",
        price: 531480,
        description:  "Data Science is an interdisciplinary field that uses scientific methods, algorithms, and systems to extract knowledge and insights from structured and unstructured data. It integrates fields like statistics, machine learning, data engineering, and data visualization to help organizations make informed decisions.",
             quantity: 5),
  ];

  Set<int> favouriteProducts = {};
  List<ProductModelClass> filteredProductsList = [];

  int currentImageIndex = 0;

  Future<void> _logoutUser(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Remove the user's product data
    await prefs.remove('products_$userEmail');

    // Clear login state
    prefs.setBool(SplashScreenState.KEYLOGIN, false);
    CartManager().clearCart();

    // Navigate to the login screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LogInScreen()),
    );
  }




  @override
  void initState() {
    super.initState();

    // Load user email from SharedPreferences
    SharedPreferences.getInstance().then((prefs) {
      String? userEmail = prefs.getString('logged_in_user');
      if (userEmail != null) {
        _loadProducts(userEmail); // Call the method with the retrieved email
      }
    });

    filteredProductsList = List.from(productsList);
  }

  void _deleteProduct(ProductModelClass product) {
    setState(() {
      // Remove product from the main list
      productsList.remove(product);
      // Refresh the filtered list
      filteredProductsList = List.from(productsList);
    });
  }

  final TextEditingController _searchController = TextEditingController();

  void _searchAndFilter(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProductsList = List.from(productsList);
      } else {
        filteredProductsList = productsList
            .where((product) =>
                product.title.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Future<void> _saveProducts(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String productsJson = json.encode(productsList.map((e) => e.toJson()).toList());
    await prefs.setString('products_$userEmail', productsJson);
  }

  Future<void> _loadProducts(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? productsJson = prefs.getString('products_$userEmail');
    if (productsJson != null) {
      List<dynamic> products = json.decode(productsJson);
      setState(() {
        productsList = products
            .map((product) => ProductModelClass.fromJson(product))
            .toList();
        filteredProductsList = List.from(productsList);
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: [
          GetBuilder<ThemeController>(
            init: ThemeController(),
            builder: (controller) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      controller.toggleTheme();
                    },
                    icon: Icon(
                      controller.isDarkTheme
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                      color: controller.isDarkTheme ? Colors.white : Colors.black,
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
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
                                      Image.asset("assets/images/logo.png",
                                        width: 70,
                                        height: 70,),
                                      SizedBox(height: 8,),
                                      Text(
                                        'Are you sure you want to LogOut from all devices?',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight:
                                            FontWeight.w500,
                                            color: Color(0xff1E1A15)),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(
                                        top: 38),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
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
                                                  FontWeight
                                                      .w600,
                                                  color: Color(
                                                      0xff979797)),
                                            )),
                                        TextButton(
                                            // onPressed: () async {
                                            //   var prefs = await SharedPreferences.getInstance();
                                            //   prefs.setBool(SplashScreenState.KEYLOGIN, false);
                                            //   CartManager().clearCart();
                                            //   Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen()));
                                            //
                                            // },
                                            onPressed: () async {
                                              SharedPreferences prefs = await SharedPreferences.getInstance();
                                              prefs.setBool(SplashScreenState.KEYLOGIN, false);
                                                CartManager().clearCart();

                                              String? userEmail = prefs.getString('logged_in_user');
                                              if (userEmail != null) {
                                                await _logoutUser(userEmail);
                                              }
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen()));
                                            },
                                            child: Text(
                                              'LogOut',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                  FontWeight
                                                      .w600,
                                                  color: Color(
                                                      0xffEA4235)),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });

                  }, icon: Icon(Icons.exit_to_app,
                    color: controller.isDarkTheme ? Colors.white : Colors.black,
                  )),

                ],
              );

            },
          ),

        ],

        elevation: 0,
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        // title: Padding(
        //   padding: const EdgeInsets.only(top: 4.8),
        //   child: GestureDetector(
        //     onTap: () {
        //       // Replace with your navigation logic
        //       Get.to(LoginScreenApi());
        //     },
        //     child: Text(
        //       "E-Shop",
        //       style: TextStyle(
        //         fontSize: 22,
        //         fontWeight: FontWeight.w600,
        //         color: Get.isDarkMode ? Colors.white : Color(0xff1E1A15),
        //       ),
        //     ),
        //   ),
        // ),
        title: Row(
          children: [
            FutureBuilder<String?>(
              future: UserProfileManager.getProfileImagePath(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return CircleAvatar(
                    radius: 20,
                    backgroundImage: FileImage(File(snapshot.data!)),
                  );
                }
                return CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(Icons.person, color: Colors.grey.shade600),
                );
              },
            ),
            SizedBox(width: 10),
            FutureBuilder<String?>(
              future: UserProfileManager.getProfileName(),
              builder: (context, snapshot) {
                return Text(
                  snapshot.data ?? "No Name",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Get.isDarkMode ? Colors.white : Color(0xff1E1A15),),
                );
              },
            ),
          ],
        ),

      ),

      body: _getBody(context),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FloatingActionButton(
            onPressed: () async {
              // Calculate the index for the image from the existing productsList
              int imageIndex = currentImageIndex % productsList.length;

              // Get the product image from the existing productsList
              String productImage = productsList[imageIndex].image;

              final newProduct = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddProduct(
                    // imageIndex: imageIndex,
                    // productImage: productImage, // Pass the product image
                  ),
                ),
              );

              if (newProduct != null && newProduct is ProductModelClass) {
                setState(() {
                  productsList.add(newProduct);
                  filteredProductsList = List.from(productsList);
                  currentImageIndex++; // Increment the index for the next product
                });

                // Retrieve user email from SharedPreferences
                SharedPreferences prefs = await SharedPreferences.getInstance();
                String? userEmail = prefs.getString('logged_in_user');
                if (userEmail != null) {
                  await _saveProducts(userEmail); // Pass the userEmail argument
                }
              }
            },

            backgroundColor: Colors.green,
            elevation: 0,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.04,),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteScreen(

                    favoriteProducts: productsList
                        .asMap()
                        .entries
                        .where((entry) => favouriteProducts.contains(entry.key))
                        .map((entry) => entry.value)
                        .toList(),
                    onRemoveFavorite: (product) {
                      final index = productsList.indexOf(product);
                      if (index != -1) {
                        setState(() {
                          favouriteProducts.remove(index);
                        });
                      }
                    },
                  ),
                ),
              );
            },
            backgroundColor: Colors.red,
            elevation: 0,
            child: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),

        ],
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              onChanged: _searchAndFilter,
              controller: _searchController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 9, vertical: 14),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.grey,
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
        ),
        Expanded(
          child: filteredProductsList.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Image.asset(
                      "assets/images/notfound.png",
                      width: 80,
                      height: 80,
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text('No product found',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                )
              :
          ListView.builder(
            itemCount: filteredProductsList.length,
            itemBuilder: (context, index) {
              final productIndex = productsList.indexOf(filteredProductsList[index]);
              final product = filteredProductsList[index];
              return WidgetHomeScreen(
                productModelClass: product,
                isFavourite: favouriteProducts.contains(productIndex),
                onFavouriteToggle: () {
                  setState(() {
                    if (favouriteProducts.contains(productIndex)) {
                      favouriteProducts.remove(productIndex);
                    } else {
                      favouriteProducts.add(productIndex);
                    }
                  });
                },
                onDelete: () => _deleteProduct(product),
                onEdit: (updatedProduct) async {
                  setState(() {
                    int index = productsList.indexWhere((p) => p.id == updatedProduct.id);
                    if (index != -1) {
                      productsList[index] = updatedProduct;
                      filteredProductsList = List.from(productsList);
                    }
                  });

                  // Save updated products to SharedPreferences
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  String? userEmail = prefs.getString('logged_in_user');
                  if (userEmail != null) {
                    await _saveProducts(userEmail);
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}


