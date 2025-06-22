import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var name;

  var age;

  var gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Passing Data"),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Text("Name" + Get.arguments[0]),
          Text("Age" + Get.arguments[1]),
          Text("Gender" + Get.arguments[2]),
        ],
      ),
    );
  }
}