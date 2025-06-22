import 'package:flutter/material.dart';
import 'package:newzler/getX/counter_controller3.dart';
import 'package:get/get.dart';
class CounterControllerExample3 extends StatefulWidget {
  const CounterControllerExample3({super.key});

  @override
  State<CounterControllerExample3> createState() => _CounterControllerExample3State();
}

class _CounterControllerExample3State extends State<CounterControllerExample3> {
  CounterController3 controller = Get.put(CounterController3());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch Example"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Enter Name"),
              Obx(() {
                return  Switch(value: controller.notification.value, onChanged: (value) {
                  controller.setNotification(value);
                });
              })

            ],
          )
        ],
      ),
    );
  }
}
