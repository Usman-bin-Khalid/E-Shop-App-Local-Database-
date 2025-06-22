import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newzler/getX/counter_controller2.dart';

class CounterControllerExample2 extends StatefulWidget {
  const CounterControllerExample2({super.key});

  @override
  State<CounterControllerExample2> createState() => _CounterControllerExample3State();
}

class _CounterControllerExample3State extends State<CounterControllerExample2> {
  CounterControllerTwo controller = Get.put(CounterControllerTwo());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(() {
            return  Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width * 0.40,
             color: Colors.red.withOpacity(controller.opacity.value),
            );
          }),
         Obx(() {
           return Slider(value: controller.opacity.value, onChanged: (value) {
             controller.setOpacity(value);

           });
         }),
        ],
      ),
    );
  }
}
