import 'package:flutter/material.dart';
import 'package:newzler/model/user_profile_manager.dart';
import 'package:newzler/views/complete_profile/complete_profile.dart';
import 'package:newzler/views/log_in/log_in.dart';
import 'package:newzler/views/video_live_news/video_live_news.dart';

import '../../model/cart_class.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController confirmpwdController = TextEditingController();
  bool isLoading = false;
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 4.8),
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: true,
      ),
          body: _getBody(context),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Have an account already? ",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 13,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen()));
              },
              child: Text(
                'Log In',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff209CEE),
                ),
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
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
                            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 0.5),
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
                        obscureText: _isObscured, // Toggle password visibility
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(Icons.lock, color: Colors.grey),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscured ? Icons.visibility_off : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscured = !_isObscured; // Toggle password visibility
                              });
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.black, width: 0.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 14),
                  // Confirm Password Field
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
                        controller: confirmpwdController,
                        obscureText: _isObscured, // Toggle password visibility
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          prefixIcon: Icon(Icons.lock, color: Colors.grey),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscured ? Icons.visibility_off : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscured = !_isObscured; // Toggle password visibility
                              });
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.black, width: 0.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Sign Up Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        // onPressed: checkValues,
                        onPressed: () async{
                          if(emailController.text.trim() == "" || pwdController.text.trim()
                              == "" || confirmpwdController.text.trim() == ""
                          ){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                                "Please fill all required fields!"
                            )));
                          }
                          else if(pwdController.text.trim() != confirmpwdController.text.trim()) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                                "Passwords should be same!"
                            )));
                          }
                          else if (
                          !await CartManager().isEmailUnique(emailController.text.trim())


                          ) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Email is already registered!")));
                          }

                          else {
                            await CartManager().registerEmail(emailController.text.trim());
                            // await UserProfileManager.registerEmail();
                           Navigator.push(context, MaterialPageRoute(builder: (context) =>
                           CompleteProfile()));
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
                                Icon(Icons.account_box, color: Colors.white),
                                SizedBox(width: 10),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
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

          ],
        ),
      ),
    );
  }
}
