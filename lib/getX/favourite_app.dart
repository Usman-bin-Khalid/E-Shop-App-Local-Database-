import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newzler/getX/favourite_counter.dart';
class FavouriteApp extends StatefulWidget {
  const FavouriteApp({super.key});

  @override
  State<FavouriteApp> createState() => _FavouriteAppState();
}

class _FavouriteAppState extends State<FavouriteApp> {
  FavouriteCounter controller = Get.put(FavouriteCounter());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite App"),

        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: controller.fruits.length,
                itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    if(controller.tempFruitList.contains(controller.fruits[index].toString())){
                      controller.removeFromFavourite(controller.fruits[index].toString());
                    }else {
                      controller.addToFavourite(controller.fruits[index].toString());
                    }
                  },
                  title: Text(controller.fruits[index].toString()),
                  trailing: Obx(() {
                    return Icon(Icons.favorite, color: controller.tempFruitList.contains(controller.fruits[index].toString()) ? Colors.red :
                    Colors.grey,);
                  })
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
