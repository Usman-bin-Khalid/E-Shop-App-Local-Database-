import 'package:flutter/material.dart';
import 'package:newzler/model/cart_class.dart';
import 'package:newzler/views/home_screen/home_screen.dart';
import 'package:newzler/views/home_screen/home_second.dart';
import 'package:newzler/views/sign_up/sign_up.dart';
import 'package:newzler/views/video_live_news/video_live_news.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/custom_appBar.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  bool isLoading = false; // Loading state
  bool _isObscured = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 4.8),
          child: Text(
            'Log In',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: true,
      ),
      // appBar: CustomAppBar(title: "Home"),
      body: _getBody(context),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? ",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 13),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff209CEE)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0.5, color: Colors.black),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            SizedBox(height: 24),
            // Email Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                    hintText: 'Email Address',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(Icons.email, color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 0.5),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 14),
            // Password Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: pwdController,
                  obscureText: _isObscured, // Hides the password
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(Icons.password, color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscured ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured =
                              !_isObscured; // Toggle password visibility
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black, width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 0.5),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            // Log In Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (emailController.text.isEmpty || pwdController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please fill all required fields!")));
                    } else {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      List<String>? registeredEmails = prefs.getStringList('registered_emails') ?? [];

                      // Check if the entered email exists in the list
                      if (registeredEmails.contains(emailController.text.trim())) {
                        // Email exists, proceed with login
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString('logged_in_user', emailController.text.trim());

                        prefs.setBool(SplashScreenState.KEYLOGIN, true);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(name: 'usman',

                            ),
                          ),
                        );
                      } else {
                        // Email does not exist, show error message
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Email is not registered. Please sign up first.")));
                      }
                    }
                  },

                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff6a11cb), Color(0xff2575fc)],
                        begin: Alignment.topLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.lock_open, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            'Log In',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    maximumSize: Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
