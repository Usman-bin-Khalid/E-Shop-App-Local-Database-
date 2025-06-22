import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newzler/views/home_screen/home_screen.dart';
class RevisionScreen extends StatefulWidget {
  const RevisionScreen({super.key});

  @override
  State<RevisionScreen> createState() => _RevisionScreenState();
}

class _RevisionScreenState extends State<RevisionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Management"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.snackbar("Flutter", "Cross Development Platform",
        snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.black,
        );
      }),
      body: Column(
        children: [
        ElevatedButton(onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("How are You",

          )));
        }, child: Text("CLICK")),
          Card(
            child: Column(
              children: [
                 ListTile(
                   onTap: () {
                     Get.bottomSheet(
                       Container(
                         child: Column(
                           children: [

                           ],
                         ),
                       ),
                     );
                   },
                   leading: IconButton(onPressed: (){
                   }, icon: Icon(Icons.add)),
                 ),

              ],
            ),
          ),
          TextButton(onPressed: (){
            Get.to(HomeScreen(name: "Usman",));
            Get.back();
          }, child: Text("Goto Next Page")),
          TextButton(onPressed: (){
            Get.toNamed("/Home" , arguments: [
              "Usman Khalid",
              "23",
              "Male"
            ]);
          }, child: Text("GoTo Home Page")),
          //Media Query
          Center(
            child: Container(
             height: Get.height * 0.5,
              width: Get.width * 0.5,
              // height: MediaQuery.of(context).size.height * 1,
              // //1 equals to 100 means total height of screen occupy
              // width: MediaQuery.of(context).size.width * 0.5,
              // //0.5 equals to 50 means half height of screen occupy

            ),
          ),
        ],
      ),
    );
  }
}
