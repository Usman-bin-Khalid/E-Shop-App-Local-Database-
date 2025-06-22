import 'package:get/get.dart';
class CounterControllerTwo extends GetxController {
  RxDouble opacity = 0.5.obs;
  setOpacity (double value) {
    opacity.value = value;
  }
}