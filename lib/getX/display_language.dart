import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DisplayLanguage extends StatefulWidget {
  const DisplayLanguage({super.key});

  @override
  State<DisplayLanguage> createState() => _DisplayLanguageState();
}

class _DisplayLanguageState extends State<DisplayLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Display Language"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text('message'.tr, style: TextStyle(),
                textAlign: TextAlign.justify,),
                subtitle: Text('name'.tr, textAlign: TextAlign.justify,),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    OutlinedButton(onPressed: (){
                      Get.updateLocale(Locale('en' , 'US'));
                    }, child: Text("English")),
                    SizedBox(width: 20,),
                    OutlinedButton(onPressed: (){
                      Get.updateLocale(Locale('ur' , 'PK'));
                    }, child: Text("Urdu")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
