import 'package:flutter/material.dart';
import 'package:newzler/getX/logIn_signUp.dart';
import 'package:get/get.dart';
class LoginScreenApi extends StatefulWidget {
  const LoginScreenApi({super.key});

  @override
  State<LoginScreenApi> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenApi> {
  LogInController controller = Get.put(LogInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LogIn"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             // TextFormField(
             //   controller: controller.emailController.value,
             //   decoration: InputDecoration(
             //     hintText: "Email"
             //   ),
             // ),
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
                    controller: controller.emailController.value,
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
              SizedBox(height: 14,),
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
                    controller: controller.passwordController.value,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                      hintText: 'Password',
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
             // TextFormField(
             //   controller: controller.passwordController.value,
             //   decoration: InputDecoration(
             //     hintText: "Password"
             //   ),
             // ),
              SizedBox(height: 24,),
             Obx(() {
               return   Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 28),
                 child: SizedBox(
                   width: double.infinity,
                   child: ElevatedButton(
                     onPressed: () {
                       controller.logInApi();
                     },
                     child: controller.loading.value ? CircularProgressIndicator(
                       color: Colors.deepPurple.shade700,
                     ) : Ink(
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
                               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
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
               );
               //   ElevatedButton(onPressed: (){
               //   controller.logInApi();
               // }, child: controller.loading.value ? CircularProgressIndicator() : Text("Log In"));
             })
            ],
          ),
        ),
      ),
    );
  }
}
