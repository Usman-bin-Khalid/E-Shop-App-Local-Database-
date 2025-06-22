import 'package:get/get.dart';
class FavouriteCounter extends GetxController{
  RxList<String> fruits = ["Mango" , "Apple" , "Banana" , "Grapes" , "Orange"].obs;
  RxList tempFruitList = [].obs;

  addToFavourite (String value) {
    tempFruitList.add(value);
  }
  removeFromFavourite (String value) {
    tempFruitList.remove(value);
  }
}