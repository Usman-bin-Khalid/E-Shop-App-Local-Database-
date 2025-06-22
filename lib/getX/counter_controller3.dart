import 'package:get/get.dart';
class CounterController3 extends GetxController {
  RxBool notification = false.obs;
  setNotification (bool value) {
    notification.value = value;
  }
}