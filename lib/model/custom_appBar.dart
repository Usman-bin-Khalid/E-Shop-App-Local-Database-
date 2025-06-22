import 'dart:io';
import 'package:flutter/material.dart';
import 'user_profile_manager.dart';
import 'package:get/get.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  CustomAppBar({required this.title, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Theme.of(context).appBarTheme.backgroundColor,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FutureBuilder<String?>(
            future: UserProfileManager.getProfileImagePath(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                return CircleAvatar(
                  radius: 20,
                  backgroundImage: FileImage(File(snapshot.data!)),
                );
              }
              return CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.shade200,
                child: Icon(Icons.person, color: Colors.grey.shade600),
              );
            },
          ),
          SizedBox(width: 10),
          FutureBuilder<String?>(
            future: UserProfileManager.getProfileName(),
            builder: (context, snapshot) {
              return Text(
                snapshot.data ?? "No Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,  color: Get.isDarkMode ? Colors.white : Color(0xff1E1A15), ),
              );
            },
          ),
        ],
      ),
      // centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
