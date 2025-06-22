import 'package:flutter/material.dart';
import 'package:newzler/getX/counter_controller.dart';
import 'package:get/get.dart';
class CounterControllerExample extends StatefulWidget {
  const CounterControllerExample({super.key});

  @override
  State<CounterControllerExample> createState() => _CounterControllerExampleState();
}

class _CounterControllerExampleState extends State<CounterControllerExample> {

  final CounterController controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Management"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.IncrementCounter();
      }, child: Icon(Icons.add),
      backgroundColor: Colors.green,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Obx(() {
      return Text(controller.counter.toString());
          }),
          ],
        ),
      ),
    );
  }
}
