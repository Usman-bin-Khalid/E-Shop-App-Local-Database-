import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newzler/views/sign_up/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_screen/home_screen.dart';
import '../log_in/log_in.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  static const String KEYLOGIN = "logIn";
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Center(
              child: Image.asset("assets/images/logo.png",
              width: 150,
              height: 150,),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          children: [
                            TextSpan(text: "E-" , style: TextStyle(fontSize: 22,
                              fontWeight: FontWeight.bold, color: Color(0xff198fbd),

                            ),
                            ),
                            TextSpan(text: "SHOP",
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,

                                  color: Color(0xff7ec440)),// fontStyle: FontStyle.italic,
                            ),
                          ]
                      )
                      ,),
                  ),
                ],
              ),
            )
          ],
        ),
      ),


    );
  }



  void whereToGo() async {
    var prefs = await SharedPreferences.getInstance();
    var isLoggedIn =  prefs.getBool(KEYLOGIN);
    Timer(Duration(seconds: 3), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
              HomeScreen(name: "Name")));
        }else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
              LogInScreen()));
        }
      }else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
            LogInScreen()));
      }

    });
  }

}
