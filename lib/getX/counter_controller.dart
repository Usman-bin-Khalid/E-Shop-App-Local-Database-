import 'package:get/get.dart';

class CounterController extends GetxController{
  RxInt counter = 1.obs;
  IncrementCounter () {
    counter.value++;
  }
}