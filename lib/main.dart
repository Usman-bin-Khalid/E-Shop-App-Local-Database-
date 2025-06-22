import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newzler/getX/get_language.dart';
import 'package:newzler/views/calculator/calculator.dart';
import 'package:newzler/views/home_screen/home_screen.dart';
import 'package:newzler/views/log_in/log_in.dart';
import 'package:newzler/views/video_live_news/video_live_news.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'getX/display_language.dart';
import 'getX/languages.dart';
import 'model/cart_class.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CartManager().loadCartFromLocalStorage();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      fallbackLocale: Locale('en', 'US'),
      locale: Locale('en', 'US'),
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }



}


