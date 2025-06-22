import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:get/get.dart';

import '../../model/cart_class.dart';
import '../../model/theme_controller_class.dart';
import '../log_in/log_in.dart';
import '../video_live_news/video_live_news.dart';

class HomeScreenSecond extends StatelessWidget {
  final String email;

  const HomeScreenSecond({Key? key, required this.email}) : super(key: key);

  Future<Map<String, String>?> getUserDetails(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? profilesJson = prefs.getString("user_profiles");
    if (profilesJson != null) {
      List<Map<String, String>> profiles = List<Map<String, String>>.from(json.decode(profilesJson));
      var userProfile = profiles.firstWhere(
            (profile) => profile["email"] == email,
        orElse: () => {}, // Return an empty map
      );

      // Return null if the user profile is empty
      if (userProfile.isEmpty) return null;

      return userProfile;
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<Map<String, String>?>(
          future: getUserDetails(email),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey.shade200,
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Loading...',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              );
            }

            if (snapshot.hasData && snapshot.data != null) {
              var userDetails = snapshot.data!;
              return Row(
                children: [
                  if (userDetails["imagePath"] != null &&
                      userDetails["imagePath"]!.isNotEmpty)
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: FileImage(File(userDetails["imagePath"]!)),
                    )
                  else
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey.shade200,
                      child: Icon(Icons.person, color: Colors.grey.shade600),
                    ),
                  SizedBox(width: 10),
                  Text(
                    userDetails["name"] ?? "No Name",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            }

            return Text("User details not found");
          },
        ),
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
                  IconButton(onPressed: () async {
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
                                          onPressed: () async {
                                            var prefs = await SharedPreferences.getInstance();
                                            prefs.setBool(SplashScreenState.KEYLOGIN, false);
                                            CartManager().clearCart();
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
                  ))
                ],
              );

            },
          ),

        ],
      ),
      body: Center(
        child: Text('Home Screen Content'),
      ),
    );
  }
}
