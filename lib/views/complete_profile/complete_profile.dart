//
// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:newzler/views/home_screen/home_screen.dart';
// import 'package:newzler/views/log_in/log_in.dart';
// import '../../model/user_profile_manager.dart';
//
// class CompleteProfile extends StatefulWidget {
//   // final String email;
//
//   const CompleteProfile({super.key,});
//
//
//   @override
//   State<CompleteProfile> createState() => _CompleteProfileState();
// }
//
// class _CompleteProfileState extends State<CompleteProfile> {
//   TextEditingController fullNameController = TextEditingController();
//
//   File? imageFile;
//
//   /// Check values and save the profile
//   void checkValues() async {
//     String fullname = fullNameController.text.trim();
//
//
//
//     if (fullname.isEmpty || imageFile == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content:
//               Text("Please fill all the fields and upload a profile picture"),
//         ),
//       );
//     } else {
//       // Save profile details
//       await UserProfileManager.saveProfileDetails(fullname, imageFile!.path,);
//
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => LogInScreen(),
//         ),
//       );
//     }
//   }
//
//
//   void showPhotoOptions() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: Colors.white,
//           title: Text("Upload Profile Picture"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 onTap: () {
//                   Navigator.pop(context);
//                   selectImage(ImageSource.gallery);
//                 },
//                 leading: Icon(Icons.photo),
//                 title: Text("Select from Gallery"),
//               ),
//               ListTile(
//                 onTap: () {
//                   Navigator.pop(context);
//                   selectImage(ImageSource.camera);
//                 },
//                 leading: Icon(Icons.camera_alt),
//                 title: Text("Take a Photo"),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   /// Select an image from the given source
//   void selectImage(ImageSource source) async {
//     try {
//       XFile? pickedFile = await ImagePicker().pickImage(source: source);
//       if (pickedFile != null) {
//         setState(() {
//           imageFile = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Failed to pick image: $e")),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Complete Profile',
//           style: TextStyle(
//               fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: CupertinoButton(
//                     padding: EdgeInsets.zero,
//                     onPressed: showPhotoOptions,
//                     child: CircleAvatar(
//                       radius: 65,
//                       backgroundColor: Colors.grey.shade200,
//                       backgroundImage: imageFile != null
//                           ? FileImage(imageFile!) as ImageProvider
//                           : AssetImage('assets/images/profileImg.png'),
//                       child: imageFile == null
//                           ? Icon(Icons.camera_alt,
//                               color: Colors.grey.shade600, size: 40)
//                           : null,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 19),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 28),
//                   child: Container(
//                     width: double.infinity,
//                     height: 48,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: TextField(
//                       controller: fullNameController,
//                       decoration: InputDecoration(
//                         contentPadding:
//                             EdgeInsets.symmetric(horizontal: 12, vertical: 15),
//                         hintText: 'Complete Name',
//                         hintStyle: TextStyle(
//                           fontWeight: FontWeight.w400,
//                           color: Colors.grey,
//                           fontSize: 14,
//                         ),
//                         prefixIcon: Icon(Icons.person, color: Colors.grey),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide:
//                               BorderSide(color: Colors.black, width: 0.5),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide: BorderSide(
//                               color: Theme.of(context).primaryColor,
//                               width: 0.5),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: 19),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 28),
//                   child: SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         checkValues();
//                       },
//                       child: Ink(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [Color(0xff6a11cb), Color(0xff2575fc)],
//                             begin: Alignment.topLeft,
//                             end: Alignment.centerRight,
//                           ),
//                           borderRadius: BorderRadius.circular(12),
//                           border: Border.all(color: Colors.white, width: 1),
//                         ),
//                         child: Container(
//                           alignment: Alignment.center,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(Icons.account_circle, color: Colors.white),
//                               SizedBox(width: 10),
//                               Padding(
//                                 padding: const EdgeInsets.only(top: 3.0),
//                                 child: Text(
//                                   'Submit',
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.zero,
//                         maximumSize: Size(double.infinity, 48),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         elevation: 0,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:newzler/views/log_in/log_in.dart';
import '../../model/user_profile_manager.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  TextEditingController fullNameController = TextEditingController();
  File? imageFile;
  void checkValues() async {
    String fullname = fullNameController.text.trim();

    if (fullname.isEmpty || imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
          Text("Please fill all the fields and upload a profile picture"),
        ),
      );
    } else {
      // Save profile details
      await UserProfileManager.saveProfileDetails(
        fullname,
        imageFile!.path,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LogInScreen(),
        ),
      );
    }
  }



  /// Show photo upload option
  void showPhotoOptions() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Upload Profile Picture"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  selectImage(ImageSource.gallery);
                },
                leading: Icon(Icons.photo),
                title: Text("Select from Gallery"),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  selectImage(ImageSource.camera);
                },
                leading: Icon(Icons.camera_alt),
                title: Text("Take a Photo"),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Select an image and validate for face detection
  void selectImage(ImageSource source) async {
    try {
      XFile? pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        File file = File(pickedFile.path);
        bool hasFace = await detectFace(file);

        if (hasFace) {
          setState(() {
            imageFile = file;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("No face detected. Please try again.")),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to pick image: $e")),
      );
    }
  }

  /// Detect face in the given image
  Future<bool> detectFace(File file) async {
    final inputImage = InputImage.fromFile(file);
    final faceDetector = GoogleMlKit.vision.faceDetector();
    List<Face> faces = await faceDetector.processImage(inputImage);

    faceDetector.close();
    return faces.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Complete Profile',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: showPhotoOptions,
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: imageFile != null
                          ? FileImage(imageFile!) as ImageProvider
                          : AssetImage('assets/images/profileImg.png'),
                      child: imageFile == null
                          ? Icon(Icons.camera_alt,
                          color: Colors.grey.shade600, size: 40)
                          : null,
                    ),
                  ),
                ),
                SizedBox(height: 19),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                        hintText: 'Complete Name',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        prefixIcon: Icon(Icons.person, color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                          BorderSide(color: Colors.black, width: 0.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 19),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: checkValues,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff6a11cb), Color(0xff2575fc)],
                            begin: Alignment.topLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.account_circle, color: Colors.white),
                              SizedBox(width: 10),
                              Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        maximumSize: Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
