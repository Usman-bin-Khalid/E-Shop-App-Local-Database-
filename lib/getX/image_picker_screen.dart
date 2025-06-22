import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newzler/getX/image_picker_controller.dart';
class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  ImagePickerController controller = Get.put(ImagePickerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick Image"),
        centerTitle: true,
      ),
      body: Obx(() {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: controller.imagePath.isNotEmpty ?
                FileImage(File(controller.imagePath.toString())) :
                    null
              ),
              TextButton(onPressed: (){
                controller.getImage();
              }, child: Text("Pick Image")),
            ],
          ),
        );
      })
    );
  }
}
