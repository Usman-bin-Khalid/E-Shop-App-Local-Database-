// import 'dart:io';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class UserProfileManager {
//   static const String _keyProfileName = 'profile_name';
//   static const String _keyProfileImage = 'profile_image';
//
//   /// Save profile details
//   static Future<void> saveProfileDetails(String name, String imagePath) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_keyProfileName, name);
//     await prefs.setString(_keyProfileImage, imagePath);
//   }
//
//   /// Get profile name
//   static Future<String?> getProfileName() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString(_keyProfileName);
//   }
//
//   /// Get profile image path
//   static Future<String?> getProfileImagePath() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString(_keyProfileImage);
//   }
// }
//
//
//
//
import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileManager {
  static const String _keyProfileName = 'profile_name';
  static const String _keyProfileImage = 'profile_image';
  static const String _keyProfileEmail = 'profile_email';

  /// Save profile details
  // static Future<void> saveProfileDetails(
  //     String email, String name, String imagePath) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(_keyProfileEmail, email);
  //   await prefs.setString(_keyProfileName, name);
  //   await prefs.setString(_keyProfileImage, imagePath);
  // }



  static Future<void> saveProfileDetails(String name, String imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyProfileName, name);
    await prefs.setString(_keyProfileImage, imagePath);
  }

  // static const String _keyProfiles = "user_profiles";
  //
  // /// Save a user's profile details in the list
  // static Future<void> saveProfileDetails(String email, String name, String imagePath) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   // Retrieve existing profiles or initialize an empty list
  //   String? profilesJson = prefs.getString(_keyProfiles);
  //   List<Map<String, String>> profiles = profilesJson != null
  //       ? List<Map<String, String>>.from(json.decode(profilesJson))
  //       : [];
  //
  //   // Add the new profile details
  //   profiles.add({
  //     "email": email,
  //     "name": name,
  //     "imagePath": imagePath,
  //   });
  //
  //   // Save the updated profiles list back to SharedPreferences
  //   await prefs.setString(_keyProfiles, json.encode(profiles));
  // }
  //
  // /// Retrieve all saved profiles
  // static Future<List<Map<String, String>>> getAllProfiles() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? profilesJson = prefs.getString(_keyProfiles);
  //   if (profilesJson != null) {
  //     return List<Map<String, String>>.from(json.decode(profilesJson));
  //   }
  //   return [];
  // }
  //
  // /// Retrieve a specific profile by email
  // static Future<Map<String, String>?> getProfileByEmail(String email) async {
  //   List<Map<String, String>> profiles = await getAllProfiles();
  //   return profiles.firstWhere(
  //         (profile) => profile["email"] == email,
  //     orElse: () => {},
  //   );
  // }
  //
  // /// Get profile email
  // static Future<String?> getProfileEmail() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(_keyProfileEmail);
  // }

  /// Get profile name
  static Future<String?> getProfileName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyProfileName);
  }

  /// Get profile image path
  static Future<String?> getProfileImagePath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyProfileImage);
  }

}
